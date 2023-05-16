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
    # Print status
    print("Send write I2C packet to server")

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
    print(f"Received: {data}\n")

    ##########################################################################
    #                                Read I2C                                #
    ##########################################################################
    # Print status
    print("Send read I2C packet to server")

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
    print(f"Received: {data}\n")

    ##########################################################################
    #                             Pattern Loading                            #
    ##########################################################################
    # Print status
    print("Send pattern loading packet to server")

    # Encode packet
    packet = encode_packet(
        'pattern_loading',
        cmd_id=1,
        write_slave_addr=76,
        read_slave_addr=75,
        write_packet_size=5,
        read_packet_size=9,
        block_count=2,
        measure_count=1,
        write_interval_us=310000,
        measure_interval_us=0,
        delay_from_write_to_measure_us=300000,
        write_buffer=[str(i) for i in range(10)],
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                               Pattern Run                              #
    ##########################################################################
    # Print status
    print("Send pattern run packet to server")

    # Encode packet
    packet = encode_packet(
        'pattern_run',
        cmd_id=77,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                            Pattern Get Data                            #
    ##########################################################################
    # Print status
    print("Send pattern get data packet to server")

    # Encode packet
    packet = encode_packet(
        'pattern_get_data',
        read_buffer_size=18,
        num_of_ldo_ch0_current=2,
        num_of_ldo_ch0_voltage=2,
        num_of_ldo_ch1_current=2,
        num_of_ldo_ch1_voltage=2,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                             LDO Voltage Set                            #
    ##########################################################################
    # Print status
    print("Send LDO voltage set packet to server")

    # Encode packet
    packet = encode_packet(
        'ldo_voltage_set',
        channel=0,
        voltage=5.8,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                              Power Control                             #
    ##########################################################################
    # Print status
    print("Send power control packet to server")

    # Encode packet
    packet = encode_packet(
        'power_control',
        command=1,
        data=1,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                             Burst Get Data                             #
    ##########################################################################
    # Print status
    print("Send burst get data packet to server")

    # Encode packet
    packet = encode_packet(
        'burst_get_data',
        read_packet_size=2,
        read_count=5,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                               Burst Mode                               #
    ##########################################################################
    # Print status
    print("Send burst mode packet to server")

    # Encode packet
    packet = encode_packet(
        'burst_mode',
        command=11,
        data=1,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                            Burst Write Delay                           #
    ##########################################################################
    # Print status
    print("Send burst write delay packet to server")

    # Encode packet
    packet = encode_packet(
        'burst_write_delay',
        command=12,
        data=12,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                            Burst Read Delay                            #
    ##########################################################################
    # Print status
    print("Send burst read delay packet to server")

    # Encode packet
    packet = encode_packet(
        'burst_read_delay',
        command=13,
        data=200,
    )
    print(f"Send: {packet}")

    # Send packet to server
    writer.write(packet)
    await writer.drain()

    # Receive packet from server
    data = await reader.read(1024)
    if not data:
        raise Exception("Socket closed")
    print(f"Received: {data}\n")

    ##########################################################################
    #                                  Quit                                  #
    ##########################################################################
    # Print status
    print("Send quit packet to server")
    
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
    print(f"Received: {data}\n")
    
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
