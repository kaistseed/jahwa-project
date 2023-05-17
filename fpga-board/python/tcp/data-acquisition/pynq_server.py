##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/17/2023
# File Name             : pynq_server.py                                           
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
import time
import random
import asyncio

# PYNQ library
from pynq import Overlay
from pynq.lib import PynqMicroblaze

# User-defined library
from library.packet import *

##############################################################################
#                 Define Function to Handle Client Connection                #
##############################################################################
async def handle_client(reader, writer, microblaze):
    # Keep listening to client until client closes connection
    while True:
        # Wait for client to send data
        data = await reader.read(1024)

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

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

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

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Create dummy response for client
            packet = encode_packet(
                'read_i2c',
                transaction_id=packet['transaction_id'],
                protocol_id=packet['protocol_id'],
                length=packet['length'],
                unit_id=packet['unit_id'],
                data_buf=packet['data_buf']
            )

            # Send back data to the client
            writer.write(packet)
            await writer.drain()

        ######################################################################
        #                           Pattern Loading                          #
        ######################################################################
        elif unit_id == unit_id_dict['pattern_loading']:
            # Print status
            print("Received pattern loading packet from client")

            # Decode data tp get write buffer size
            write_packet_size = int.from_bytes(data[20:24], byteorder='little')
            block_count = int.from_bytes(data[28:32], byteorder='little')
            measure_count = int.from_bytes(data[32:36], byteorder='little')
            write_buffer_size = write_packet_size * block_count * measure_count

            # Decode packet
            packet = decode_packet(data, write_buffer_size=write_buffer_size)

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Send back data to the client
            writer.write(data)
            await writer.drain()

        ######################################################################
        #                             Pattern Run                            #
        ######################################################################
        elif unit_id == unit_id_dict['pattern_run']:
            # Print status
            print("Received pattern run packet from client")

            # Decode packet
            packet = decode_packet(data)

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Send back data to the client
            writer.write(data)
            await writer.drain()

        ######################################################################
        #                          Pattern Get Data                          #
        ######################################################################
        elif unit_id == unit_id_dict['pattern_get_data']:
            # Print status
            print("Received pattern get data packet from client")

            # Decode packet
            packet = decode_packet(data)

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Create dummy response for client
            packet = encode_packet(
                'pattern_get_data',
                transaction_id=packet['transaction_id'],
                protocol_id=packet['protocol_id'],
                length=packet['length'],
                unit_id=packet['unit_id'],
                read_buffer_size=packet['read_buffer_size'],
                num_of_ldo_ch0_current=packet['num_of_ldo_ch0_current'],
                num_of_ldo_ch0_voltage=packet['num_of_ldo_ch0_voltage'],
                num_of_ldo_ch1_current=packet['num_of_ldo_ch1_current'],
                num_of_ldo_ch1_voltage=packet['num_of_ldo_ch1_voltage'],
                read_buffer=[str(i) for i in range(packet['read_buffer_size'])],
                ldo_ch0_current=[random.random() for i in range(packet['num_of_ldo_ch0_current'])],
                ldo_ch0_voltage=[random.random() for i in range(packet['num_of_ldo_ch0_voltage'])],
                ldo_ch1_current=[random.random() for i in range(packet['num_of_ldo_ch1_current'])],
                ldo_ch1_voltage=[random.random() for i in range(packet['num_of_ldo_ch1_voltage'])],
            )

            # Send back data to the client
            writer.write(packet)
            await writer.drain()

        ######################################################################
        #                           LDO Voltage Set                          #
        ######################################################################
        elif unit_id == unit_id_dict['ldo_voltage_set']:
            # Print status
            print("Received LDO voltage set packet from client")

            # Decode packet
            packet = decode_packet(data)

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Send back data to the client
            writer.write(data)
            await writer.drain()

        ##########################################################################
        #   Power Control, Burst Mode, Burst Write Delay, and Burst Read Delay   #
        ##########################################################################
        elif (unit_id == unit_id_dict['power_control']) or (unit_id == unit_id_dict['burst_mode']) or \
         (unit_id == unit_id_dict['burst_write_delay']) or (unit_id == unit_id_dict['burst_read_delay']):
            # Get command
            command = int.from_bytes(data[8:12], byteorder='little')
            
            # Print status based on command
            if command == 1:
                print("Received power control packet from client")
            elif command == 11:
                print("Received burst mode packet from client")
            elif command == 12:
                print("Received burst write delay packet from client")
            elif command == 13:
                print("Received burst read delay packet from client")
            else:
                print("Unknown command")

            # Decode packet
            packet = decode_packet(data)

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Send back data to the client
            writer.write(data)
            await writer.drain()

        ######################################################################
        #                           Burst Get Data                           #
        ######################################################################
        elif unit_id == unit_id_dict['burst_get_data']:
            # Print status
            print("Received burst get data packet from client")

            # Decode packet
            packet = decode_packet(data)

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Calculate read buffer size
            read_buffer_size = packet['read_packet_size']*packet['read_count']

            # Create dummy response for client
            packet = encode_packet(
                'burst_get_data',
                transaction_id=packet['transaction_id'],
                protocol_id=packet['protocol_id'],
                length=packet['length'],
                unit_id=packet['unit_id'],
                read_buffer_size=read_buffer_size,
                read_buffer=[str(i) for i in range(read_buffer_size)],
            )

            # Send back data to the client
            writer.write(packet)
            await writer.drain()

        ######################################################################
        #                            Test Sequence                           #
        ######################################################################
        elif unit_id == unit_id_dict['test_sequence']:
            # Decode packet
            packet = decode_packet(data)

            # Run test sequence based on sequence number
            if packet['sequence'] == 1:
                # Print status
                print("Received test LED sequence packet from client")
                # Run test LED sequence
                microblaze.write_blocking_command(TEST_LED)
            elif packet['sequence'] == 2:
                print("Received toggle LED sequence packet from client")
            elif packet['sequence'] == 3:
                print("Received test PMODB sequence packet from client")
                # Run test PMODB sequence
                microblaze.write_blocking_command(TEST_PMODB)
            elif packet['sequence'] == 4:
                print("Received toggle PMODB sequence packet from client")
            else:
                print("Unknown test sequence")

            # Send back data to the client
            writer.write(data)
            await writer.drain()

        ######################################################################
        #                                Quit                                #
        ######################################################################
        elif unit_id == unit_id_dict['quit']:
            # Print status
            print("Received quit packet from client")

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
    print("Closing TCP connection")
    print()
    writer.close()
    await writer.wait_closed()

##############################################################################
#                              Define TCP Server                             #
##############################################################################
async def tcp_server(server_addr, server_port, microblaze) -> None:
    server = await asyncio.start_server(handle_client, server_addr, server_port, microblaze)
    async with server:
        await server.serve_forever()

##############################################################################
#                           Define MicroBlaze Class                          #
##############################################################################
# Define MicroBlaze mailbox address
MAILBOX_OFFSET = 0xF000
MAILBOX_SIZE = 0x1000
MAILBOX_PY2IOP_CMD_OFFSET = 0xffc
MAILBOX_PY2IOP_ADDR_OFFSET = 0xff8
MAILBOX_PY2IOP_DATA_OFFSET = 0xf00

# Define commands
WRITE_LED = 0x1
READ_LED = 0x2
TEST_LED = 0x3
WRITE_PMODB = 0x4
READ_PMODB = 0x5
TEST_PMODB = 0x6
TEST_I2C = 0x7
READ_ERROR = 0x8

# Define MicroBlaze class Python API
class MicroBlaze(PynqMicroblaze):
    def __init__(self, mb_info, mb_program):
        super().__init__(mb_info, mb_program)

    def write_mailbox(self, data_offset, data):
        offset = MAILBOX_OFFSET + data_offset
        self.write(offset, data)

    def read_mailbox(self, data_offset, num_words=1):
        offset = MAILBOX_OFFSET + data_offset
        return self.read(offset, num_words)

    def write_blocking_command(self, command):
        self.write(MAILBOX_OFFSET + MAILBOX_PY2IOP_CMD_OFFSET, command)
        while self.read(MAILBOX_OFFSET + MAILBOX_PY2IOP_CMD_OFFSET) != 0:
            pass
    def write_blocking_command_addr(self, addr, command):
        self.write(addr, command)
        while self.read(addr) != 0:
            pass        

    def write_non_blocking_command(self, command):
        self.write(MAILBOX_OFFSET + MAILBOX_PY2IOP_CMD_OFFSET, command)

##############################################################################
#                                Main Program                                #
##############################################################################
if __name__ == "__main__":
    print('##########################################################################')
    print('#                          Loading FPGA Overlay                          #')
    print('##########################################################################')
    print()
    # Load overlay
    ol = Overlay("/home/daltamaulana/Projects/Jahwa/jahwa-project/fpga-board/python/tcp/data-acquisition/bitstream/pynq_mb_jahwa_v3.bit")

    print('##########################################################################')
    print('#                        Configuring Softprocessor                       #')
    print('##########################################################################')
    # Define softprocessor block
    SoftProcessor = {
        'ip_name': ol.softprocessor_0.description["memories"]["axi_bram_ctrl_0"]["fullpath"],
        'rst_name': "xlslice_0", #'mb_iop_pmoda_reset',
        'intr_pin_name': "softprocessor_0/dff_en_reset_vector_0/q",
        'intr_ack_name': "xlslice_1"#'mb_iop_pmoda_intr_ack'
    } 

    # Instantiate microblaze class
    _microblaze = MicroBlaze(SoftProcessor, "./bitstream/pynq_tcp_test.bin")

    # Check microblaze state
    print("Microblaze state: {}".format(_microblaze.state))
    print()

    print('##########################################################################')
    print('#                           Running PYNQ Server                          #')
    print('##########################################################################')
    # Define server address and port
    server_addr = '192.168.2.99'
    server_port = input("Enter port number, default is 5555: ")

    # Check if port number is empty
    if server_port == '':
        server_port = '5555'

    # Run TCP server
    asyncio.run(tcp_server(server_addr=server_addr, server_port=server_port))
