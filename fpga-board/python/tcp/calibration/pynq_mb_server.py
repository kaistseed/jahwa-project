##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 07/04/2023
# File Name             : pynq_mb_server.py                                           
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
from library.microblaze_new import *

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
            print("Received write I2C packet from client\n")

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
            print("Received read I2C packet from client\n")

            # Decode packet
            packet = decode_packet(data)

            # Print decoded packet
            for key, value in packet.items():
                print(key, ":", value)
            print()

            # Get start time
            start_time = microblaze.timer_get_sec()

            # Call microblaze I2C read function
            read_data = microblaze.i2c_meissner_read(
                slave_addr=packet['slave_addr'], 
                addr_len=packet['addr_len'], 
                data_len=packet['data_len'], 
                reg_addr=int(''.join(packet['addr_buf'])),
            )

            # Get end time
            end_time = microblaze.timer_get_sec()

            # Convert read data to char array
            data_buf = int_to_char_array(read_data)

            # Create dummy response for client
            packet = encode_packet(
                'read_i2c',
                transaction_id=packet['transaction_id'],
                protocol_id=packet['protocol_id'],
                length=packet['length'],
                unit_id=packet['unit_id'],
                data_buf=data_buf
            )

            # Print read data
            print("Read data: {}".format(hex(read_data)))
            print("Data buffer: {}".format(data_buf))
            print("Packet: {}".format(packet))
            print("Elapsed time: {} s\n".format(end_time-start_time))

            # Send back data to the client
            writer.write(packet)
            await writer.drain()

        ######################################################################
        #                           Pattern Loading                          #
        ######################################################################
        elif unit_id == unit_id_dict['pattern_loading']:
            # Print status
            print("Received pattern loading packet from client\n")

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
            print("Received pattern run packet from client\n")

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
            print("Received pattern get data packet from client\n")

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
            print("Received LDO voltage set packet from client\n")

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
                print("Received power control packet from client\n")
            elif command == 11:
                print("Received burst mode packet from client\n")
            elif command == 12:
                print("Received burst write delay packet from client\n")
            elif command == 13:
                print("Received burst read delay packet from client\n")
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
            print("Received burst get data packet from client\n")

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
            # Toggle LED sequence
            if packet['sequence'] == 1:
                print("Received toggle LED sequence packet from client\n")
                # Run toggle LED sequence
                microblaze.gpio_toggle_led()

            # Test LED sequence
            elif packet['sequence'] == 2:
                # Print status
                print("Received test LED sequence packet from client\n")
                # Run test LED sequence
                microblaze.gpio_test_led()

            # Configure DAC
            elif packet['sequence'] == 3:
                # Print status
                print("Received configure DAC sequence packet from client\n")
                # Run configure DAC sequence
                # Turn off all SDN I/O
                microblaze.gpio_write_sdn1(0)
                microblaze.gpio_write_sdn2(0)
                microblaze.gpio_write_sdn3(0)
                # Configure all DAC channel
                microblaze.spi_config_dac(0, '0x600')
                microblaze.spi_config_dac(1, '0x500')
                microblaze.spi_config_dac(2, '0x500')
                # Turn on all SDN I/O
                microblaze.gpio_write_sdn1(1)
                microblaze.gpio_write_sdn2(1)
                microblaze.gpio_write_sdn3(1)

            # Reset Sensor
            elif packet['sequence'] == 4:
                # Print status
                print("Received reset sensor sequence packet from client\n")
                # Run reset sensor sequence
                microblaze.i2c_meissner_reset()

            # Read Chip ID
            elif packet['sequence'] == 5:
                # Print status
                print("Received read chip ID sequence packet from client")
                # Run read chip ID sequence
                chip_id = microblaze.i2c_meissner_chip_id()
                # Print chip ID
                print("Chip ID: {}\n".format(hex(chip_id)))

            # Read Chip Version
            elif packet['sequence'] == 6:
                # Print status
                print("Received read chip version packet from client")
                # Run read chip ID sequence
                chip_ver_1, chip_ver_2 = microblaze.i2c_meissner_version()
                # Print chip ID
                print("Chip version: {}{}\n".format(hex(chip_ver_1), hex(chip_ver_2)[2:]))

            # Read Chip Unique ID
            elif packet['sequence'] == 7:
                # Print status
                print("Received read chip unique ID sequence packet from client")
                # Run read chip ID sequence
                unique_id = microblaze.i2c_meissner_unique_id()
                # Print chip ID
                print("Unique ID: {}\n".format(hex(unique_id)))

            # Read global timer counter
            elif packet['sequence'] == 8:
                # Print status
                print("Received get timer count value packet from client")
                # Run get timer count value for global counter
                lsb_count = microblaze.timer_get_cnt_val(2, 0)
                msb_count = microblaze.timer_get_cnt_val(2, 1)
                total_count = (msb_count << 32) ^ lsb_count
                time_sec = (0xFFFFFFFFFFFFFFFF-total_count)/1e8
                # Print count value
                print("MSB count: {}\nLSB count: {}".format(msb_count, lsb_count)) 
                print("Time in second: {}\n".format(time_sec))

            # Test timer delay
            elif packet['sequence'] == 9:
                # Print status
                print("Received test timer delay packet from client")
                # Get timer delay from microblaze
                delay_10us, delay_100us, delay_1ms, \
                delay_10ms, delay_100ms, delay_1s = microblaze.timer_test_delay()
                # Print delay value
                print("Intended delay: 10us, actual delay: {}us".format(delay_10us))
                print("Intended delay: 100us, actual delay: {}us".format(delay_100us))
                print("Intended delay: 1ms, actual delay: {}ms".format(delay_1ms))
                print("Intended delay: 10ms, actual delay: {}ms".format(delay_10ms))
                print("Intended delay: 100ms, actual delay: {}ms".format(delay_100ms))
                print("Intended delay: 1s, actual delay: {}s\n".format(delay_1s))

            # SPI read ADC
            elif packet['sequence'] == 10:
                # Print status
                print("Received read ADC packet from client")
                # Set number of samples and interval
                sample_num = 20
                interval_ms = 10

                # get the start time
                start = time.time()
                # Get ADC data
                adc_value, adc_id, adc_softspan = microblaze.spi_read_adc(
                    sample_num=sample_num,
                    interval_ms=interval_ms
                )
                # get the start time
                end = time.time()

                # Print data
                print("Reading ADC with {} samples and delay between samples {} ms".format(
                    sample_num, interval_ms))
                print("ADC id: {}".format(adc_id))
                print("ADC value: {}".format(adc_value))
                print("ADC softspan: {}".format(adc_softspan))
                print("Time per sample: {:.2f}".format((end-start)/sample_num))
                print()
            
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
    server = await asyncio.start_server(
        lambda reader, writer: handle_client(reader, writer, microblaze),
        server_addr, 
        server_port
    )
    
    async with server:
        await server.serve_forever()

##############################################################################
#                                Main Program                                #
##############################################################################
if __name__ == "__main__":
    print('##########################################################################')
    print('#                          Loading FPGA Overlay                          #')
    print('##########################################################################')
    # Load overlay
    # ol = Overlay("./bitstream/pynq_mb_jahwa_v3.bit")
    ol = Overlay("./bitstream/pynq_mb_jahwa_v6.bit")

    # Print status
    print("FPGA Overlay loaded successfully")
    print()

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
    # _microblaze = MicroBlaze(SoftProcessor, "./bitstream/pynq_tcp_test.bin")
    _microblaze = MicroBlaze(SoftProcessor, "./bitstream/pynq_jahwa_daq_v3.bin")

    # Check microblaze state
    print("Microblaze state: {}".format(_microblaze.state))
    print()

    print('##########################################################################')
    print('#                           Running PYNQ Server                          #')
    print('##########################################################################')
    # Define server address and port
    server_addr = '192.168.2.99'
    server_port = input("Enter port number, default is 5555: ")
    print()

    # Check if port number is empty
    if server_port == '':
        server_port = '5555'

    # Run TCP server
    asyncio.run(tcp_server(
        server_addr=server_addr, 
        server_port=server_port,
        microblaze=_microblaze
    ))