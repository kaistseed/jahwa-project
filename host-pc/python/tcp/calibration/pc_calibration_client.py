##################################################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 07/18/2023
# File Name             : pc_calibration_client.py                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6                                          
#       
##################################################################################################

##################################################################################################
#                                        Import Libraries                                        #
##################################################################################################
# Python library
import os
import csv
import time
import struct
import asyncio
import numpy as np
from datetime import datetime
import matplotlib.pyplot as plt
# from slack_sdk import WebClient
# from slack_sdk.errors import SlackApiError
from sklearn.linear_model import LinearRegression
# import pyvisa
# User-defined library
from library.packet import *

##################################################################################################
#                                 Define Test TCP Client Function                                #
##################################################################################################
async def tcp_client_test(server_addr, server_port):
    ##############################################################################################
    #                                   Initiate TCP Connection                                  #
    ##############################################################################################
    reader, writer = await asyncio.open_connection(server_addr, server_port)

    ##############################################################################################
    #                                        Test Sequence                                       #
    ##############################################################################################
    # Turn off DAC I/O
    # SDN1 I/O
    print("Sending GPIO write SDN1 packet")
    io_state = 0
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn1',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # # SDN2 I/O
    # print("Sending GPIO write SDN2 packet")
    # io_state = 0
    # packet = encode_packet(
    #     'measurement_sequence',
    #     sequence='gpio_write_sdn2',
    #     data_buf=[io_state]
    # )
    # writer.write(packet)
    # await writer.drain()
    # # Receive response from PYNQ server
    # response = await reader.read(1024)
    # if not response:
    #     print("No response from PYNQ server (read sensor ID)")
    #     raise Exception("Closing connection")

    # SDN3 I/O
    print("Sending GPIO write SDN3 packet")
    io_state = 0
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn3',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # Configure DAC I/O
    # SDN1 I/O
    print("Sending SPI config DAC SDN1 packet")
    channel = 0
    dac_code = 1380
    packet = encode_packet(
        'measurement_sequence',
        sequence='spi_config_dac',
        data_buf=[channel, dac_code]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # # SDN2 I/O
    # print("Sending SPI config DAC SDN2 packet")
    # channel = 1
    # dac_code = 1380
    # packet = encode_packet(
    #     'measurement_sequence',
    #     sequence='spi_config_dac',
    #     data_buf=[channel, dac_code]
    # )
    # writer.write(packet)
    # await writer.drain()
    # # Receive response from PYNQ server
    # response = await reader.read(1024)
    # if not response:
    #     print("No response from PYNQ server (read sensor ID)")
    #     raise Exception("Closing connection")

    # SDN3 I/O
    print("Sending SPI config DAC SDN3 packet")
    channel = 2
    dac_code = 1400
    packet = encode_packet(
        'measurement_sequence',
        sequence='spi_config_dac',
        data_buf=[channel, dac_code]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # Turn on DAC I/O
    # SDN1 I/O
    print("Sending GPIO write SDN1 packet")
    io_state = 1
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn1',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # # SDN2 I/O
    # print("Sending GPIO write SDN2 packet")
    # io_state = 1
    # packet = encode_packet(
    #     'measurement_sequence',
    #     sequence='gpio_write_sdn2',
    #     data_buf=[io_state]
    # )
    # writer.write(packet)
    # await writer.drain()
    # # Receive response from PYNQ server
    # response = await reader.read(1024)
    # if not response:
    #     print("No response from PYNQ server (read sensor ID)")
    #     raise Exception("Closing connection")

    # SDN3 I/O
    print("Sending GPIO write SDN3 packet")
    io_state = 1
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn3',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    ##############################################################################################
    #                                       Check Sensor ID                                      #
    ##############################################################################################
    print("Sending read sensor ID packet")
    # Create packet
    packet = encode_packet(
        'measurement_sequence',
        sequence='i2c_meissner_chip_id'
    )

    # Send packet to PYNQ server
    writer.write(packet)

    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # Decode packet
    decoded_packet = decode_packet(response)

    # Print chip ID
    print(f"Chip ID: {hex(decoded_packet['chip_id'])}")

    ######################################################################################
    #                                    Read ADC Data                                   #
    ######################################################################################
    print("Sending read ADC data packet")
    num_of_samples = 50
    interval_ms = 100
    # Send packet to PYNQ server
    packet = encode_packet(
        'measurement_sequence',
        sequence='spi_read_adc',
        data_buf=[10, 100]
    )
    writer.write(packet)
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")
    # Decode packet
    decoded_packet = decode_packet(response)
    # Get ADC data
    adc_id = decoded_packet['adc_id']
    adc_softspan = decoded_packet['adc_softspan']
    adc_value = decoded_packet['adc_value']
    adc_voltage = decoded_packet['adc_voltage']
    # Print status
    print("ADC ID: {}".format(adc_id))
    print("ADC Softspan: {}".format(adc_softspan))
    print("ADC Value: {}".format(adc_value))
    print("ADC Voltage: {}".format(adc_voltage))

    ##############################################################################################
    #                                       Configure Relay                                      #
    ##############################################################################################
    # Turn on relay 1 I/O
    print("Sending GPIO write relay 1 packet")
    io_state = 1
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_relay1',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")
    
    # Delay
    time.sleep(2)

    # Turn on relay 2 I/O
    print("Sending GPIO write relay 2 packet")
    io_state = 1
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_relay2',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")
    
    # Delay
    time.sleep(2)

    # Turn off relay 1 I/O
    print("Sending GPIO write relay 1 packet")
    io_state = 0
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_relay1',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")
    
    # Delay
    time.sleep(2)

    # Turn off relay 2 I/O
    print("Sending GPIO write relay 2 packet")
    io_state = 0
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_relay2',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    ##############################################################################################
    #                                            Quit                                            #
    ##############################################################################################
    print("Sending Quit packet")
    # Create packet
    packet = encode_packet(
        'quit'
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")

    # Close TCP connection
    print("Closing TCP connection")
    writer.close()
    ##############################################################################################


##################################################################################################
#                                        Define TCP Client                                       #
##################################################################################################
async def tcp_client(server_addr, server_port):
    ##############################################################################################
    #                                   Initiate TCP Connection                                  #
    ##############################################################################################
    reader, writer = await asyncio.open_connection(server_addr, server_port)

    ##############################################################################################
    #                                        Configure DAC                                       #
    ##############################################################################################
    ##############################################################################################
    # Turn off DAC I/O
    # SDN1 I/O
    io_state = 0
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn1',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # SDN2 I/O
    io_state = 0
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn2',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # SDN3 I/O
    io_state = 0
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn3',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    ##############################################################################################
    ##############################################################################################
    # Configure DAC I/O
    # SDN1 I/O
    channel = 0
    dac_code = 1500
    packet = encode_packet(
        'measurement_sequence',
        sequence='spi_config_dac',
        data_buf=[channel, dac_code]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # SDN2 I/O
    channel = 1
    dac_code = 1500
    packet = encode_packet(
        'measurement_sequence',
        sequence='spi_config_dac',
        data_buf=[channel, dac_code]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # SDN3 I/O
    channel = 2
    dac_code = 1500
    packet = encode_packet(
        'measurement_sequence',
        sequence='spi_config_dac',
        data_buf=[channel, dac_code]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")
    ##############################################################################################
    ##############################################################################################
    # Turn on DAC I/O
    # SDN1 I/O
    io_state = 1
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn1',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # SDN2 I/O
    io_state = 1
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn2',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")

    # SDN3 I/O
    io_state = 1
    packet = encode_packet(
        'measurement_sequence',
        sequence='gpio_write_sdn3',
        data_buf=[io_state]
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server (read sensor ID)")
        raise Exception("Closing connection")
    ##############################################################################################

    ##############################################################################################
    #                                 Active Current Measurement                                 #
    ##############################################################################################
    # Set load current
    I_Load = 0

    # Sweep DAC code and read from source meter
    if (measure_mode == 1) or (measure_mode == 0):
        for i in range(Active_samples):
           #######################################################################################
           #                                Configure Source Meter                               #
           #######################################################################################
            meter.write(":SOURce:CURRent:LEVel:IMMediate:AMPLitude {}".format(I_Load))
            print("Load current: {}".format(I_Load))
            I_Load -= Active_step

            ######################################################################################
            #                                  Read Source Meter                                 #
            ######################################################################################
            # Current
            data = abs(float("{:.8f}".format(float(meter.query(":MEAS:CURR?")))))
            V_meas.append(data)
            # Voltage
            time.sleep(Meter_delay)
            aux_data = float("{:.6f}".format(float(aux_meter.query(":MEAS:VOLT?"))))
            V_aux.append(aux_data)

            ######################################################################################
            #                                    Read ADC Data                                   #
            ######################################################################################
            # Send packet to PYNQ server
            packet = encode_packet(
                'measurement_sequence',
                sequence='spi_read_adc',
                data_buf=[Active_averaging_samples, Sample_delay]
            )
            writer.write(packet)
            await writer.drain()
            # Receive response from PYNQ server
            response = await reader.read(1024)
            if not response:
                print("No response from PYNQ server (read sensor ID)")
                raise Exception("Closing connection")
            else:
                # Decode packet
                decoded_packet = decode_packet(response)
                # Get ADC data
                ADC_id.append(decoded_packet['adc_id'][Active_ADC_ch])
                ADC_softspan.append(decoded_packet['adc_softspan'][Active_ADC_ch])
                ADC_value.append(decoded_packet['adc_value'][Active_ADC_ch])
                ADC_voltage.append(decoded_packet['adc_voltage'][Active_ADC_ch])
                Active_meas.append(decoded_packet['adc_voltage'][Active_ADC_ch])
                print(decoded_packet['adc_id'][Active_ADC_ch])
                print(decoded_packet['adc_voltage'][Active_ADC_ch])

            ######################################################################################
            #                                    Print Status                                    #
            ######################################################################################
            print("Active, iteration: {} - Sourcemeter: {} - ADC: {}".format((i + 1), data, Active_meas[i]))
            print("Number of nonlin iteration: {} - Sourcemeter: {} - Aux: {}".format((i + 1), data, aux_data))
            print()

        ##########################################################################################
        #                                      Save to File                                      #
        ##########################################################################################
        # Open file
        f = open('test_active_{}.csv'.format(test_channel_name), 'w', encoding='utf-8', newline="")
        f_aux = open('test_active_smu_{}.csv'.format(test_channel_name), 'w', encoding='utf-8', newline="")
        
        # Print slope and zero
        Active_slope = 1
        Active_zero = 1
        print("Slope: {}".format(Active_slope))
        print("Zero: {}".format(Active_zero))
        
        # Write to file
        with f:
            write = csv.writer(f)
            write.writerows(zip(V_meas, Active_meas))
            # write.writerows(zip(V_meas, V_aux))

        with f_aux:
            write = csv.writer(f_aux)
            write.writerows(zip(V_meas, V_aux))

        # Close file
        f.close()
        f_aux.close()

    ##############################################################################################
    #                                 Static Current Measurement                                 #
    ##############################################################################################
    if (test_channel != 2) and ((measure_mode == 2) or (measure_mode == 0)):
        ##########################################################################################
        #                                      Initial Setup                                     #
        ##########################################################################################
        # Reset load current
        I_Load = 0
        # Set source meter range
        meter.write(":SOURce:CURRent:RANGe {}".format(100E-3))

        ##########################################################################################
        #                                    Measurement Loop                                    #
        ##########################################################################################
        for i in range(Static_samples):
            ######################################################################################
            #                               Configure Source Meter                               #
            ######################################################################################
            meter.write(":SOURce:CURRent:LEVel:IMMediate:AMPLitude {}".format(I_Load))
            print("Load current: {}".format(I_Load))
            I_Load -= Static_step

            ######################################################################################
            #                                  Read Source Meter                                 #
            ######################################################################################
            # Current
            data = abs(float("{:.8f}".format(float(meter.query(":MEAS:CURR?")))))
            V_meas.append(data)
            # Voltage
            time.sleep(Meter_delay)
            aux_data = float("{:.6f}".format(float(aux_meter.query(":MEAS:VOLT?"))))
            V_aux.append(aux_data)

            ######################################################################################
            #                                    Read ADC Data                                   #
            ######################################################################################
            # Send packet to PYNQ server
            packet = encode_packet(
                'measurement_sequence',
                sequence='spi_read_adc',
                data_buf=[Static_averaging_samples, Sample_delay]
            )
            writer.write(packet)
            await writer.drain()
            # Receive response from PYNQ server
            response = await reader.read(1024)
            if not response:
                print("No response from PYNQ server (read sensor ID)")
                raise Exception("Closing connection")
            else:
                # Decode packet
                decoded_packet = decode_packet(response)
                # Get ADC data
                ADC_id.append(decoded_packet['adc_id'][Static_ADC_ch])
                ADC_softspan.append(decoded_packet['adc_softspan'][Static_ADC_ch])
                ADC_value.append(decoded_packet['adc_value'][Static_ADC_ch])
                ADC_voltage.append(decoded_packet['adc_voltage'][Static_ADC_ch])
                Static_meas.append(decoded_packet['adc_voltage'][Static_ADC_ch])


            ######################################################################################
            #                                    Print Status                                    #
            ######################################################################################
            print("Static, iteration: {} - Sourcemeter: {} - ADC: {}".format((i + 1), data, Static_meas[i]))
            print()
        
        ##########################################################################################
        #                                      Save to File                                      #
        ##########################################################################################
        # Open file
        f = open('test_static_{}.csv'.format(test_channel_name), 'w', encoding='utf-8', newline="")
        f_aux = open('test_static_smu_{}.csv'.format(test_channel_name), 'w', encoding='utf-8', newline="")

        # Print slope and zero
        Static_slope = (V_meas[Static_samples - 1] - V_meas[100]) / (Static_meas[Static_samples - 1] - Static_meas[100])
        Static_zero = ((Static_meas[100] * Static_slope) - (V_meas[100] * 1000))
        print("Slope: {}".format(Static_slope))
        print("Zero: {}".format(Static_zero))

        # Write to file
        with f:
            write = csv.writer(f)
            write.writerows(zip(V_meas, Static_meas))
            #write.writerows(zip(V_meas, V_aux))

        with f_aux:
            write = csv.writer(f_aux)
            write.writerows(zip(V_meas, V_aux))

        # Close file
        f.close()
        f_aux.close()

    ##############################################################################################
    #                                       Output Voltage                                       #
    ##############################################################################################
    if (measure_mode == 3) or (measure_mode == 0):
        ##########################################################################################
        #                                      Initial Setup                                     #
        ##########################################################################################
        I_Load = -10E-3
        meter.write(":SOURce:CURRent:LEVel:IMMediate:AMPLitude {}".format(I_Load))

        ##########################################################################################
        #                        Sweep DAC Code and Read from Source Meter                       #
        ##########################################################################################
        for i in range(Voltage_samples):
            ######################################################################################
            #                                    Configure DAC                                   #
            ######################################################################################
            # Set channel
            if test_channel == 0:
                channel = 2
            elif test_channel == 1:
                channel = 1
            elif test_channel == 2:
                channel = 0
            else:
                assert e.response["Invalid DAC channel"]

            # Set DAC code
            dac_code = i
            
            # Send packet to PYNQ server
            packet = encode_packet(
                'measurement_sequence',
                sequence='spi_config_dac',
                data_buf=[channel, dac_code]
            )
            writer.write(packet)
            await writer.drain()
            
            # Receive response from PYNQ server
            response = await reader.read(1024)
            if not response:
                print("No response from PYNQ server (read sensor ID)")
                raise Exception("Closing connection")

            ######################################################################################
            #                                  Read Source Meter                                 #
            ######################################################################################
            # Current
            data = abs(float("{:.8f}".format(float(meter.query(":MEAS:VOLT?")))))
            V_meas.append(data)
            # Voltage
            time.sleep(Meter_delay)
            aux_data = float("{:.6f}".format(float(aux_meter.query(":MEAS:VOLT?"))))
            V_aux.append(aux_data)

            ######################################################################################
            #                                    Read ADC Data                                   #
            ######################################################################################
            # Send packet to PYNQ server
            packet = encode_packet(
                'measurement_sequence',
                sequence='spi_read_adc',
                data_buf=[Voltage_averaging_samples, Sample_delay]
            )
            writer.write(packet)
            await writer.drain()
            # Receive response from PYNQ server
            response = await reader.read(1024)
            if not response:
                print("No response from PYNQ server (read sensor ID)")
                raise Exception("Closing connection")
            else:
                # Decode packet
                decoded_packet = decode_packet(response)
                # Get ADC data
                ADC_id.append(decoded_packet['adc_id'][Voltage_ADC_ch])
                ADC_softspan.append(decoded_packet['adc_softspan'][Voltage_ADC_ch])
                ADC_value.append(decoded_packet['adc_value'][Voltage_ADC_ch])
                ADC_voltage.append(decoded_packet['adc_voltage'][Voltage_ADC_ch])
                Voltage_meas.append(decoded_packet['adc_voltage'][Voltage_ADC_ch])

            
            ######################################################################################
            #                                    Print Status                                    #
            ######################################################################################
            print("Voltage, iteration: {} - Sourcemeter: {} - ADC: {}".format((i + 1), data, Voltage_meas[i]))
            print()

        ##########################################################################################
        #                                      Save to File                                      #
        ##########################################################################################
        # Open file
        f = open('test_voltage_{}.csv'.format(test_channel_name), 'w', encoding='utf-8', newline="")
        f_aux = open('test_voltage_smu_{}.csv'.format(test_channel_name), 'w', encoding='utf-8', newline="")

        # Print slope and zero
        Voltage_slope = (V_meas[Voltage_samples-1] - V_meas[100]) / (Voltage_meas[Voltage_samples - 1] - Voltage_meas[100])
        Voltage_zero = ((Voltage_meas[100] * Voltage_slope) - (V_meas[100] * 1000))
        print("Slope: {}".format(Voltage_slope))
        print("Zero: {}".format(Voltage_zero))

        # Write to file
        with f:
            write = csv.writer(f)
            write.writerows(zip(V_meas, Voltage_meas))
            # write.writerows(zip(V_meas, V_aux))

        with f_aux:
            write = csv.writer(f_aux)
            write.writerows(zip(V_meas, V_aux))

        # Close file
        f.close()
        f_aux.close()

    ##############################################################################################
    #                                       Post Processing                                      #
    ##############################################################################################
    ##############################################################################################
    # Disable source meter
    meter.write(":SOURce:CURRent:LEVel:IMMediate:AMPLitude 0")
    meter.write(":OUTPut:STATe 0")
    meter.write(":SOURce:DIGital:DATA 0")
    aux_meter.write(":SOURce:CURRent:LEVel:IMMediate:AMPLitude 0")
    aux_meter.write(":OUTPut:STATe 0")
    ##############################################################################################
    ##############################################################################################
    # Send notification to slack
    slack_token = "xoxb-4516910652224-5053947500997-cuwBjtCehqQvjjf5wGN6y9Px"
    client = WebClient(token=slack_token)
    try:
        response = client.chat_postMessage(
            channel="C051G90F8NS",
            text="Measurement finished!"
        )
    except SlackApiError as e:
        # You will get a SlackApiError if "ok" is False
        assert e.response["error"]  # str like 'invalid_auth', 'channel_not_found'\

    slack_token = "xoxb-4516910652224-5053947500997-cuwBjtCehqQvjjf5wGN6y9Px"
    client = WebClient(token=slack_token)
    now = datetime.now()
    stop_time = now.strftime("%H:%M:%S")
    try:
        response = client.chat_postMessage(
            channel="U04EH5VFU9H",
            text= "FINISH! Measurement started at: " + str(start_time) + "Completed at: " + str(stop_time),
            as_user="MAN"
        )
    except SlackApiError as e:
        # You will get a SlackApiError if "ok" is False
        assert e.response["error"]  # str like 'invalid_auth', 'channel_not_found'
        print(e)
    ##############################################################################################
    ##############################################################################################
    # Print status
    if ((measure_mode == 1) or (measure_mode == 0)):
        print("Active gain: {}".format(Active_slope))
        print("Active offset: {}".format(Active_zero))
    if (test_channel != 2) and ((measure_mode == 2) or (measure_mode == 0)):
        print("Static gain: {}".format(Static_slope))
        print("Static offset: {}".format(Static_zero))
    if ((measure_mode == 3) or (measure_mode == 0)):
        print("Voltage gain: {}".format(Voltage_slope))
        print("Voltage offset: {}".format(Voltage_zero))

    # Convert python list to numpy array
    np_ADC_voltage = np.array(ADC_voltage)
    np_ADC_id = np.array(ADC_id)
    np_ADC_softspan = np.array(ADC_softspan)
    np_ADC_value = np.array(ADC_value)

    # Create x-axis value
    Active_sample_num = np.linspace(0, Active_samples - 1, Active_samples)
    Static_sample_num = np.linspace(0, Static_samples - 1, Static_samples)
    Voltage_sample_num = np.linspace(0, Voltage_samples - 1, Voltage_samples)

    # Plot data
    figure, axis = plt.subplots(1, 3)
    if  ((measure_mode == 1) or (measure_mode == 0)):
        axis[0].step(Active_sample_num, Active_meas)
        axis[0].set_title("Active current {}, unconverted".format(test_channel_name))
        axis[0].set_xlabel("Load current [mA]")
        axis[0].set_ylabel("Measured voltage [V]")
    if (test_channel != 2) and ((measure_mode == 2) or (measure_mode == 0)):
        axis[1].step(Static_sample_num, Static_meas)
        axis[1].set_title("Static current {}, unconverted".format(test_channel_name))
        axis[1].set_xlabel("Load current [uA]")
        axis[1].set_ylabel("Measured voltage [V]")
    if ((measure_mode == 3) or (measure_mode == 0)):
        axis[2].step(Voltage_sample_num, Voltage_meas)
        axis[2].set_title("Voltage output {}".format(test_channel_name))
        axis[2].set_xlabel("DAC code")
        axis[2].set_ylabel("Output voltage [V]")
    plt.show()

    print("Ready")

    ##############################################################################################
    #                                            Quit                                            #
    ##############################################################################################
    print("Sending Quit packet")
    # Create packet
    packet = encode_packet(
        'quit'
    )
    writer.write(packet)
    await writer.drain()
    # Receive response from PYNQ server
    response = await reader.read(1024)
    if not response:
        print("No response from PYNQ server")
        raise Exception("Closing connection")

    # Close TCP connection
    print("Closing TCP connection")
    writer.close()
    ##############################################################################################

##################################################################################################
#                                          Main Program                                          #
##################################################################################################
if __name__ == "__main__":
    ##############################################################################################
    #                                    Basic Configurations                                    #
    ##############################################################################################
    # Print program start time
    now = datetime.now()
    start_time = now.strftime("%H:%M:%S")
    print("Program start at {}".format(start_time))

    # Receive input from user to check whether to run test or not
    run_test = input("Run test program? (y/n): ")

    # Check if user wants to run test
    if run_test == "y":
        ##############################################################################################
        #                                    Configure TCP Server                                    #
        ##############################################################################################
        # Define server address and port
        server_addr = '192.168.2.99'
        # server_addr = 'localhost'
        server_port = 5555

        ##############################################################################################
        #                                       Run TCP Server                                       #
        ##############################################################################################
        asyncio.run(tcp_client_test(server_addr=server_addr, server_port=server_port))
    else:
        ##############################################################################################
        #                                   Configure Source Meter                                   #
        ##############################################################################################
        print("=====================================================")
        print("=            Configuring Source Meter               =")
        print("=====================================================")
        # Add VISA library to system path
        os.add_dll_directory('C:\Program Files\Keysight\IO Libraries Suite\\bin')

        # List all of connected devices\
        rm = pyvisa.ResourceManager()
        aux_rm = pyvisa.ResourceManager()

        # Open the devices
        meter = rm.open_resource("USB0::0x2A8D::0x9001::MY61390406::0::INSTR")
        aux_meter = aux_rm.open_resource("USB0::0x0957::0x8B18::MY51143933::0::INSTR")

        # Set source meter and measurement configurations
        # Number of samples
        Active_samples = 1001 #1000
        Static_samples = 7001 #10000
        Voltage_samples = 4096 #4096
        # Sample step
        Active_step = 1E-3
        Static_step = 1E-6
        Voltage_step = 1 #1 DAC code
        # Averaging parameters
        Voltage_averaging_samples = 16
        Active_averaging_samples = 16
        Static_averaging_samples = 16
        Sample_accumulator = 0
        # Array for storing data
        V_meas = []
        V_ADC = []
        np_V_ADC_Averaged = []
        ADC_value = []
        ADC_voltage = []
        ADC_id = []
        ADC_softspan = []
        V_aux = []
        Active_meas = []
        Static_meas = []
        Voltage_meas = []

        # Configure the device
        Sample_delay = 50 #ms
        Meter_delay = 0.03
        I_Load = -1E-03
        V_Limit = 10
        I_Max = 1.1 #13.3
        test_channel = 0
        # Write meter configurations
        meter.write(":SOURce:FUNCtion:MODE CURRent")
        meter.write(":SOURce:CURRent:MODE FIXed")
        meter.write(":SOURce:CURRent:LEVel:IMMediate:AMPLitude {}".format(I_Load))
        meter.write(":SENSe:VOLTage:DC:PROTection:LEVel {}".format(V_Limit))
        meter.write(":SOURce: CURRent:RANGe: AUTO 10E-9")
        meter.write(":SOURce:CURRent:RANGe {}".format(I_Max))
        meter.write(":OUTPut:STATe 1")
        meter.write(":OUTPut:STATe 1")
        meter.write(":SOURce: DIGital:EXTernal1: FUNCtion DIO")
        meter.write(":SOURce: DIGital:EXTernal2: FUNCtion DIO")
        meter.write(":SOURce: DIGital:EXTernal3: FUNCtion DIO")
        meter.write(":SOURce: DIGital:EXTernal4: FUNCtion DIO")
        meter.write(":SOURce:DIGital:EXTernal1:POLarity POS")
        meter.write(":SOURce:DIGital:EXTernal2:POLarity POS")
        meter.write(":SOURce:DIGital:EXTernal3:POLarity POS")
        meter.write(":SOURce:DIGital:EXTernal4:POLarity POS")
        meter.write(":SOURce:DIGital:DATA 1")
        # Write aux meter configurations
        aux_meter.write(":SOURce:FUNCtion:MODE CURRent")
        aux_meter.write(":SOURce:CURRent:MODE FIXed")
        aux_meter.write(":SOURce:CURRent:LEVel:IMMediate:AMPLitude {}".format(0))
        aux_meter.write(":SENSe:VOLTage:DC:PROTection:LEVel {}".format(V_Limit))
        aux_meter.write(":SENSe:VOLTage:DC:RANGe:AUTO 0")
        aux_meter.write(":SENSe:VOLTage:DC:RANGe:UPPer 20")
        aux_meter.write(":OUTPut:STATe 1")

        ##############################################################################################
        #                                    Configure Measurement                                   #
        ##############################################################################################
        # Get input from user and set measurement parameters
        test_channel = input("Enter channel for test: OIS: 0, AF: 1, VDDM: 2. Default: OIS")
        measure_mode = input("Enter outputs to measaure: All: 0, Active: 1, Static: 2, Voltage: 3")
        test_channel = int(test_channel)
        measure_mode = int(measure_mode)
        channel_names = ["OIS", "AF", "VDDM"]
        test_channel_name = channel_names[test_channel]

        # Configure ADC channel
        Active_ADC_ch = 0 + (test_channel*3)
        Static_ADC_ch = 1 + (test_channel*3)
        Voltage_ADC_ch = 2 + (test_channel*3)
        if test_channel == 2:
            Static_ADC_ch = 6
            Active_ADC_ch = 6
            Voltage_ADC_ch = 7
            Active_samples = 301
        # Print ADC channel configuration
        print("Active ADC Channel: {} - Static ADC Channel: {} - Voltage ADC Channel: {}".\
            format(Active_ADC_ch, Static_ADC_ch, Voltage_ADC_ch))
        print("Test Channel: {}".format(test_channel))

        ##############################################################################################
        #                                    Configure TCP Server                                    #
        ##############################################################################################
        # Define server address and port
        server_addr = '192.168.2.99'
        # server_addr = 'localhost'
        server_port = 5555

        ##############################################################################################
        #                                       Run TCP Server                                       #
        ##############################################################################################
        asyncio.run(tcp_client(server_addr=server_addr, server_port=server_port))