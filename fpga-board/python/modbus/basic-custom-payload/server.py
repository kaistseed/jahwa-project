###################################################
##                Import Libraries               ##         
###################################################
# Built-in libraries
import os
import logging
import asyncio

# Pymodbus libraries
from pymodbus.constants import Endian
from pymodbus.server import StartAsyncTcpServer
from pymodbus.payload import BinaryPayloadBuilder
from pymodbus.transaction import ModbusSocketFramer
from pymodbus.device import ModbusDeviceIdentification
from pymodbus.datastore import (
    ModbusSequentialDataBlock,
    ModbusServerContext,
    ModbusSlaveContext,
)

###################################################
##             Define Helper Function            ##         
###################################################
# Start the logger
_logger = logging.getLogger()

# Define function to setup the server
def setup_server(data_length: int, address_length: int):
    # Set logger info
    _logger.info("### Setup server")
    
    ###############################################
    ##            Build Custom Payload           ##         
    ###############################################
    builder = BinaryPayloadBuilder(byteorder=Endian.Little, wordorder=Endian.Little)
    # Add the slave address
    builder.add_32bit_uint(1)
    # Add the address length
    builder.add_32bit_uint(address_length)
    # Add the data length
    builder.add_32bit_uint(data_length)
    # Add the address buffer
    for i in range(address_length):
        builder.add_32bit_uint(0)
    # Add the data buffer
    for i in range(data_length):
        builder.add_32bit_uint(0)
    
    ###############################################
    ##          Create Custom Datastore          ##         
    ###############################################
    # Define the block
    block = ModbusSequentialDataBlock(1, builder.to_registers())
    # Define the slave context
    slave_context = ModbusSlaveContext(
        di=None, co=None, hr=block, ir=None
    )

    # Define the server context
    server_context = ModbusServerContext(slaves={1: slave_context}, single=False)

    # Define the device identification
    identity = ModbusDeviceIdentification(
        info_name={
            "ProductName": "Pymodbus Custom Payload",
            "VendorName": "KAIST-SEED-DALTA",
            "ProductCode": "04/23/2023"
        }
    )

    # Return the server context and device identification
    return server_context, identity

# Define function to start the server
async def run_async_server(server_context, identity):
    # Set logger info
    txt = "### Start async server on port 502"
    _logger.info(txt)

    # Start the server
    server = await StartAsyncTcpServer(
        context=server_context,
        identity=identity,
        address=("127.0.0.1", 5020),
        framer=ModbusSocketFramer,
        allow_reuse_address=True,
    )

    # Return the server
    return server

###################################################
##                 Main Function                 ##
###################################################
if __name__ == "__main__":
    # Set logger info
    _logger.info("### Start main function")
    
    # Define the data length
    data_length = 10

    # Define the address length
    address_length = 10

    # Setup the server
    server_context, identity = setup_server(data_length, address_length)

    # Start the server
    server = run_async_server(server_context, identity)

    # Run the server
    asyncio.run(server, debug=True)