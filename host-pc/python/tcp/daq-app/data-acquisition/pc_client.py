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
import time
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
        sequence='gpio_test_led'
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
    #                         Configure DAC Sequence                         #
    ##########################################################################
    # Print message
    print("Sending configure DAC sequence packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='configure_dac'
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
    #                          Reset Sensor Sequence                         #
    ##########################################################################
    # Print message
    print("Sending reset sensor sequence packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='i2c_meissner_reset'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                         I2C Read Data (Chip ID)                        #
    ##########################################################################
    # Print message
    print("Sending I2C read data (chip ID) packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'read_i2c',
        slave_addr=0x74,
        addr_len=2,
        data_len=2,
        addr_buf='0000',
        data_buf='0000',
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    else:
        # Decode packet
        packet = decode_packet(response)
        # Print decoded packet
        decoded_data = hex(int(''.join([str(ord(char)) for char in packet['data_buf']])))
        print(f"Received data: {decoded_data}\n")

    ##########################################################################
    #                          Read Chip ID Sequence                         #
    ##########################################################################
    # Print message
    print("Sending read chip ID sequence packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='i2c_meissner_chip_id'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    # ##########################################################################
    # #                       Read Chip Version Sequence                       #
    # ##########################################################################
    # # Print message
    # print("Sending read chip version sequence packet to PYNQ server")

    # # Create packet
    # packet = encode_packet(
    #     'test_sequence',
    #     sequence='i2c_meissner_version'
    # )

    # # Send packet to PYNQ server
    # print(f"Sending packet: {packet}")
    # writer.write(packet)

    # # Receive response from PYNQ server
    # response = await reader.read(100)
    # if not response:
    #     print("No response from PYNQ server")
    #     raise Exception("Closing connection")
    # print(f"Received response: {response}")
    # print()

    # ##########################################################################
    # #                      Read Chip Unique ID Sequence                      #
    # ##########################################################################
    # # Print message
    # print("Sending read chip unique ID sequence packet to PYNQ server")

    # # Create packet
    # packet = encode_packet(
    #     'test_sequence',
    #     sequence='i2c_meissner_unique_id'
    # )

    # # Send packet to PYNQ server
    # print(f"Sending packet: {packet}")
    # writer.write(packet)

    # # Receive response from PYNQ server
    # response = await reader.read(100)
    # if not response:
    #     print("No response from PYNQ server")
    #     raise Exception("Closing connection")
    # print(f"Received response: {response}")
    # print()

    # ##########################################################################
    # #                            Read ADC Sequence                           #
    # ##########################################################################
    # # Print message
    # print("Sending read ADC sequence packet to PYNQ server")

    # # Create packet
    # packet = encode_packet(
    #     'test_sequence',
    #     sequence='spi_read_adc'
    # )

    # # Send packet to PYNQ server
    # print(f"Sending packet: {packet}")
    # writer.write(packet)

    # # Receive response from PYNQ server
    # response = await reader.read(100)
    # if not response:
    #     print("No response from PYNQ server")
    #     raise Exception("Closing connection")
    # print(f"Received response: {response}")
    # print()

    # ##########################################################################
    # #                        Read Global Counter Value                       #
    # ##########################################################################
    # # Iterate 5 times
    # for i in range(10):
    #     # Print message
    #     print("Sending get timer count value packet to PYNQ server")

    #     # Create packet
    #     packet = encode_packet(
    #         'test_sequence',
    #         sequence='timer_get_cnt_val'
    #     )

    #     # Send packet to PYNQ server
    #     print(f"Sending packet: {packet}")
    #     writer.write(packet)

    #     # Receive response from PYNQ server
    #     response = await reader.read(100)
    #     if not response:
    #         print("No response from PYNQ server")
    #         raise Exception("Closing connection")
    #     print(f"Received response: {response}")
    #     print()

    #     # Sleep for 1 second
    #     time.sleep(1)

    # ##########################################################################
    # #                             Test Timer Delay                           #
    # ##########################################################################
    # # Iterate 5 times
    # for i in range(5):
    #     # Print message
    #     print("Sending test timer delay packet to PYNQ server")

    #     # Create packet
    #     packet = encode_packet(
    #         'test_sequence',
    #         sequence='timer_test_delay'
    #     )

    #     # Send packet to PYNQ server
    #     print(f"Sending packet: {packet}")
    #     writer.write(packet)

    #     # Receive response from PYNQ server
    #     response = await reader.read(100)
    #     if not response:
    #         print("No response from PYNQ server")
    #         raise Exception("Closing connection")
    #     print(f"Received response: {response}")
    #     print()

    ##########################################################################
    #                              Pattern Load                              #
    ##########################################################################
    # Print message
    print("Sending pattern load packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_load'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                               Pattern Run                              #
    ##########################################################################
    # Print message
    print("Sending pattern run packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_run'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                          Pattern Check Status                          #
    ##########################################################################
    # Print message
    print("Sending pattern check status packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_check_status'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                            Pattern Get Data                            #
    ##########################################################################
    # Print message
    print("Sending pattern get data packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_get_data'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                              Pattern Load                              #
    ##########################################################################
    # Print message
    print("Sending pattern load packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_load'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                               Pattern Run                              #
    ##########################################################################
    # Print message
    print("Sending pattern run packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_run'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                          Pattern Check Status                          #
    ##########################################################################
    # Print message
    print("Sending pattern check status packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_check_status'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(100)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")
    print(f"Received response: {response}")
    print()

    ##########################################################################
    #                            Pattern Get Data                            #
    ##########################################################################
    # Print message
    print("Sending pattern get data packet to PYNQ server")

    # Create packet
    packet = encode_packet(
        'test_sequence',
        sequence='pattern_get_data'
    )

    # Send packet to PYNQ server
    print(f"Sending packet: {packet}")
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(1024)
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
    server_addr = '192.168.2.99'
    # server_addr = 'localhost'
    server_port = 5555

    # Run TCP client
    print("=====================================================")
    print("=                 Running PC Client                 =")
    print("=====================================================")
    asyncio.run(tcp_client(server_addr=server_addr, server_port=server_port))