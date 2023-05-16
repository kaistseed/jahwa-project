##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/16/2023
# File Name             : client.py                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6                                          
#       
##############################################################################

##############################################################################
#                              Import Libraries                              #
##############################################################################
# Python library
import struct
import asyncio

# User-defined library
from library.packet import *

##############################################################################
#                              Define TCP Client                             #
##############################################################################
async def run_client(server_addr, server_port):
    ##########################################################################
    #                         Initiate TCP connection                        #
    ##########################################################################
    reader, writer = await asyncio.open_connection(server_addr, server_port)

    ##########################################################################
    #                                Write I2C                               #
    ##########################################################################
    # Encode packet
    packet = encode_packet(
        'write_i2c',
        slave_addr=20,
        addr_len=1,
        data_len=1,
        addr_buf=['1', '2', '3', '4'],
        data_buf=['5', '6', '7', '8']
    )
    print(f"Send: {packet}")
    
    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data.decode()!r}")

    ##########################################################################
    #                                Read I2C                                #
    ##########################################################################
    # Encode packet
    packet = encode_packet(
        'read_i2c',
        slave_addr=10,
        addr_len=1,
        data_len=1,
        addr_buf=['1', '2', '3', '4'],
        data_buf=['5', '6', '7', '8']
    )
    print(f"Send: {packet}")
    
    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data.decode()!r}")

    ##########################################################################
    #                                  Quit                                  #
    ##########################################################################
    # Encode packet
    packet = encode_packet('quit')
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data.decode()!r}")
    
    # Close connection
    writer.close()

##############################################################################
#                                Main Program                                #
##############################################################################
if __name__ == "__main__":
    # Define server address and port
    server_addr = "localhost"
    server_port = 5555

    # Run TCP client
    print("=====================================================")
    print("=                 Running PC Client                 =")
    print("=====================================================")
    asyncio.run(run_client(server_addr=server_addr, server_port=server_port))
