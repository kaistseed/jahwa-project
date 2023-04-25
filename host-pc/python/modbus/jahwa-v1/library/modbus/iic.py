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
from pymodbus.payload import (
    BinaryPayloadBuilder,
    BinaryPayloadDecoder,   
)

#####################################################################
##                     Define Modbus IIC Class                     ##         
#####################################################################
# Define Modbus IIC class
class ModbusIIC:
    def __init__(self, client):
        # Start the logger
        self._logger = logging.getLogger()
        # Set client
        self.client = client

    ##################################################################
    ##                    Define Helper Function                    ##         
    ##################################################################
    # Define function to decode payload
    def _DecodePayload(self, payload, payload_name, **kwargs):
        # Get endianness
        word_endian = kwargs.get("word_endian", Endian.Big)
        byte_endian = kwargs.get("byte_endian", Endian.Big)
        
        # Initialize decoder
        decoder = BinaryPayloadDecoder(
            payload.registers, # pylint: disable=no-member
            wordorder=word_endian,
            byteorder=byte_endian
        )

        # Create dictionary to store decoded payload
        decoded_payload = OrderedDict()

        # Decode payload based on payload name
        # Read IIC Status
        if payload_name == "read_iic_status":
            decoded_payload["status"] = decoder.decode_32bit_uint()
        # Read IIC Data
        elif payload_name == "read_iic_data":
            for i in range(4):
                decoded_payload["data"].append(decoder.decode_8bit_uint())
        # Raise error if payload name is not defined
        else:
            raise ValueError("Payload name is not defined")

        # Return decoded payload
        return decoded_payload

    ##################################################################
    ##                      Define Data Builder                     ##         
    ##################################################################
    def _BuildData(self, **kwargs):
        # Get endianness
        word_endian = kwargs.get("word_endian", Endian.Big)
        byte_endian = kwargs.get("byte_endian", Endian.Big)

        # Get address and data length
        address_length = kwargs.get("address_length", 1)
        data_length = kwargs.get("data_length", 1)

        # Initialize builder
        builder = BinaryPayloadBuilder(
            byteorder=word_endian, 
            wordorder=byte_endian
        )

        # Add data to builder
        # Add the slave address
        slave_address = kwargs.get("slave_address", 0)
        builder.add_32bit_uint(slave_address)
        # Add the address length
        builder.add_32bit_uint(address_length)
        # Add the data length
        builder.add_32bit_uint(data_length)
        # Add the address buffer
        for i in range(4): #NOTE: Check whether 4 is array length or element length
            builder.add_8bit_uint(0)
        # Add the data buffer
        for i in range(4): #NOTE: Check whether 4 is array length or element length
            builder.add_8bit_uint(0)

        # Return builder
        return builder

    ##################################################################
    ##                  Define Write Method for IIC                 ##         
    ##################################################################
    async def Write(self, **kwargs):
        # Define local variables
        write_addr = 0
        slave = 87 #NOTE: 87 is ASCII code for 'W'

        # Build data
        builder = self._BuildData(**kwargs)

        # Convert data to registers
        registers = builder.to_registers()

        # Write payload to server
        self._logger.info(f"Write payload to address {write_addr} of slave {slave}")
        rr = await self.client.write_registers(write_addr, registers, slave=slave)
        assert not rr.isError()

    ##################################################################
    ##                   Define Read Method for IIC                 ##         
    ##################################################################
    async def Read(self, *args, **kwargs):
        # Define local variables
        status_addr = 0
        write_addr = 1
        read_addr = 2
        slave = 82 #NOTE: 82 is ASCII code for 'R'
        
        # Build data
        builder = self._BuildData(*args, **kwargs)

        # Build data to registers
        send_regs = builder.to_registers()

        # Write payload to server
        self._logger.info(f"Write Read IIC payload to address {write_addr} of slave {slave}")
        rr = await self.client.write_registers(write_addr, send_regs, slave=slave)
        assert not rr.isError()

        # Read payload from server
        # Initialize read iic status
        read_iic_status = 0

        # Read iic status until it is not 0
        while read_iic_status == 0:
            # Read iic status
            self._logger.info(f"Read IIC (status) from address {status_addr} of slave {slave}")
            rr = await self.client.read_holding_registers(address=status_addr, slave=slave)
            assert not rr.isError()

            # Decode payload
            decoded_status = self._DecodePayload(
                payload=rr,
                payload_name="read_iic_status"
            )

            # Get read iic status
            read_iic_status = decoded_status["status"]

        # Read iic data
        self._logger.info(f"Read IIC data from address {read_addr} of slave {slave}")
        rr = await self.client.read_holding_registers(address=read_addr, slave=slave)
        assert not rr.isError()

        # Decode payload
        decoded_data = self._DecodePayload(
            payload=rr,
            payload_name="read_iic_data"
        )

        # Return decoded payload
        return decoded_data

