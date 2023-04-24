#####################################################################
##                         Import Libraries                        ##         
#####################################################################
# Built-in libraries
import os
import logging
import asyncio
from collections import OrderedDict

# Pymodbus libraries
from pymodbus.constants import Endian
from pymodbus.client import AsyncModbusTcpClient
from pymodbus.transaction import ModbusSocketFramer
from pymodbus.payload import (
    BinaryPayloadBuilder,
    BinaryPayloadDecoder,   
)

#####################################################################
##                      Define Helper Function                     ##         
#####################################################################
# Start the logger
_logger = logging.getLogger()

# Set endianness dictionary
ENDIANNESS = {"<": "LITTLE", ">": "BIG"}

# Define function to send payload to server
async def send_payload(client):
    """Send custom payload to server.

    Payload builder can be used to simplify the
    packing of the payload. The payload builder
    can be used to pack the payload into a
    register format.
    
    Packing/unpacking depends on your CPU's word/byte order. 
    Modbus messages are always using big endian.
    BinaryPayloadBuilder will per default use what your CPU uses.
    The wordorder is applicable only for 32 and 64 bit values.
    For example, to write a value 0x12345678 to a 32 bit register,
    the following combinations could be used to write the register:
    +++++++++++++++++++++++++++++++++++++++++++++++
    |  Word Order  | Byte order | Word1  | Word2  |
    +++++++++++++++++++++++++++++++++++++++++++++++
    |     Big     |     Big     | 0x1234 | 0x5678 |
    |     Big     |    Little   | 0x3412 | 0x7856 |
    |    Little   |     Big     | 0x5678 | 0x1234 |
    |    Little   |    Little   | 0x7856 | 0x3412 |
    +++++++++++++++++++++++++++++++++++++++++++++++
    """

    # Create payload for every combination of word and byte order
    for word_endian, byte_endian in (
        (Endian.Big, Endian.Big),
        (Endian.Big, Endian.Little),
        (Endian.Little, Endian.Big),
        (Endian.Little, Endian.Little),
    ):
        print("-" * 60)
        print(f"Word Order: {ENDIANNESS[word_endian]}")
        print(f"Byte Order: {ENDIANNESS[byte_endian]}")
        print()

        # Create payload builder
        builder = BinaryPayloadBuilder(
            wordorder=word_endian,
            byteorder=byte_endian,
        )

        # Populate payload with data
        # Define address length and data length
        address_length = 10
        data_length = 10
        # Add the slave address
        builder.add_32bit_uint(1)
        # Add the address length
        builder.add_32bit_uint(address_length)
        # Add the data length
        builder.add_32bit_uint(data_length)
        # Add the address buffer
        for i in range(address_length):
            builder.add_32bit_uint(i+1)
        # Add the data buffer
        for i in range(data_length):
            builder.add_32bit_uint((i+1)*10)

        #############################################################
        ##                   Write Data to Slave                   ##         
        #############################################################
        # Create register payload
        registers = builder.to_registers()
        print("Write registers:")
        print(registers)
        print()

        # Build payload
        payload = builder.build()

        # Define address and slave
        address = 0
        slave = 1

        # Write payload to server
        print(f"Write payload to address {address} of slave {slave}")
        rr = await client.write_registers(address, payload, slave=slave)
        assert not rr.isError()

        #############################################################
        ##                   Read Data from Slave                  ##         
        #############################################################
        # Define payload count
        count = len(payload)

        # Read payload from server
        print(f"Read payload from address {address} of slave {slave}")
        rr = await client.read_holding_registers(address, count, slave=slave)
        assert not rr.isError()

        # Print payload
        print("Read registers:")
        print(rr.registers)
        print()

        # # Create custom payload decoder
        # decoder = BinaryPayloadDecoder.fromRegisters(
        #     rr.registers,
        #     wordorder=word_endian,
        #     byteorder=byte_endian,
        # )

        # # Make sure the word and byte order is consistent with the payload builder
        # assert decoder._wordorder == builder._wordorder
        # assert decoder._byteorder == builder._byteorder

        # # Create dictionary to store payload
        # decoded_payload = OrderedDict(
        #     [
        #         ("slave", decoder.decode_32bit_uint()),
        #         ("address_length", decoder.decode_32bit_uint()),
        #         ("data_length", decoder.decode_32bit_uint()),
        #         ("address", []),
        #         ("data", []),
        #     ]
        # )

        # # Add address buffer
        # for i in range(decoded_payload["address_length"]):
        #     decoded_payload["address"].append(decoder.decode_32bit_uint())

        # # Add data buffer
        # for i in range(decoded_payload["data_length"]):
        #     decoded_payload["data"].append(decoder.decode_32bit_uint())

        # # Print payload
        # print("Decoded payload:")
        # for key, value in decoded_payload.items():
        #     print(f"{key}: {value}")
        # print()

# Define function to setup client
def setup_client(host, port):
    # Create client
    client = AsyncModbusTcpClient(
        host=host,
        port=port,
        framer=ModbusSocketFramer,
    )

    # Return client
    return client

# Define function to start the client
async def run_async_client(client, modbus_calls=None):
    # Set logger info
    _logger.info("### Running Async Client")

    # Connect to server
    await client.connect()
    assert client.connected

    # Send payload to server
    if modbus_calls:
        await modbus_calls(client)

    # Disconnect from server
    client.close()

    # Set logger info
    _logger.info("### Closing Async Client")

#####################################################################
##                            Main Function                        ##
#####################################################################
if __name__ == "__main__":
    # Set host and port
    host = "127.0.0.1"
    port = 5020

    # Setup client
    client = setup_client(host, port)

    # Start client
    asyncio.run(run_async_client(client, modbus_calls=send_payload), debug=True)



