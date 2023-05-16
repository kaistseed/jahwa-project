##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/16/2023
# File Name             : server.py                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6                                          
#       
##############################################################################

##############################################################################
#                              Import Libraries                              #
##############################################################################
# Python library
import re
import csv
import asyncio

# User-defined library
from library.packet import *

##############################################################################
#                 Define Function to Handle Client Connection                #
##############################################################################
async def handle_echo(reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
    # Keep listening to client until client send "quit" packet
    while True:
        # Wait for client to send data
        data = await reader.read(1024)
        msg = data.decode()

        # Get packet header
        transaction_id = data[0:2]
        protocol_id = data[2:4]
        length = data[4:6]
        unit_id = data[6:7]

        # Follow up operation based on packet type
        ######################################################################
        #                              Write I2C                             #
        ######################################################################
        if unit_id == unit_id_dict['write_i2c']:
            # Print status
            print("Received write I2C packet from client")

            # Decode packet
            packet = decode_packet(data)

            # Send back data to the client
            writer.write(data)
            await writer.drain()

        ######################################################################
        #                              Read I2C                              #
        ######################################################################
        elif unit_id == unit_id_dict['read_i2c']:
            # Print status
            print("Received read I2C packet from client")

            # Decode packet
            packet = decode_packet(data)

            # Send back data to the client
            writer.write(data)
            await writer.drain()

        ######################################################################
        #                                Quit                                #
        ######################################################################
        elif unit_id == unit_id_dict['quit']:
            # Print status
            print("Received quit packet from client")

            # Decode packet
            packet = decode_packet(data)

            # Send back data to the client
            writer.write(data)
            await writer.drain()

            # Close connection
            break

        else:
            # Print status
            print("Received unknown packet from client")

            # Send back data to the client
            writer.write(data)
            await writer.drain()

    # Close connection
    print("Close the connection to the client")
    writer.close()
    await writer.wait_closed()

##############################################################################
#                              Define TCP Server                             #
##############################################################################
async def run_server(server_addr, server_port) -> None:
    server = await asyncio.start_server(handle_echo, server_addr, server_port)
    async with server:
        await server.serve_forever()

##############################################################################
#                                Main Program                                #
##############################################################################
if __name__ == "__main__":
    # Define server address and port
    server_addr = 'localhost'
    server_port = 5555

    # Run TCP server
    print("=====================================================")
    print("=                Running PYNQ Server                =")
    print("=====================================================")
    asyncio.run(run_server(server_addr=server_addr, server_port=server_port))

