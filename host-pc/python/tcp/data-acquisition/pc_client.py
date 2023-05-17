##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/17/2023
# File Name             : pc_client.py                                           
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
async def tcp_client(server_addr, server_port):
    ##########################################################################
    #                         Initiate TCP connection                        #
    ##########################################################################
    reader, writer = await asyncio.open_connection(server_addr, server_port)

    ##########################################################################
    #                            Test LED Sequence                           #
    ##########################################################################
    # Print message
    print("Sending test LED sequence packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='test_led'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)
    await writer.drain()

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                           Toggle LED Sequence                          #
    ##########################################################################
    # Print message
    print("Sending toggle LED sequence packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='toggle_led'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)
    await writer.drain()

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                               Test PMODB                               #
    ##########################################################################
    # Print message
    print("Sending test PMODB packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='test_pmodb'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)
    await writer.drain()

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                              Toggle PMODB                              #
    ##########################################################################
    # Print message
    print("Sending toggle PMODB packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='toggle_pmodb'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)
    await writer.drain()

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                                  Quit                                  #
    ##########################################################################
    # Print message
    print("Sending quit packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'quit'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)
    await writer.drain()

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    # Close TCP connection
    print("Closing TCP connection")
    writer.close()

##############################################################################
#                                Main Program                                #
##############################################################################
if __name__ == "__main__":
    # Define server address and port
    # server_addr = '192.168.2.99'
    server_addr = 'localhost'
    server_port = 5555

    # Run TCP client
    print("=====================================================")
    print("=                 Running PC Client                 =")
    print("=====================================================")
    asyncio.run(tcp_client(server_addr=server_addr, server_port=server_port))