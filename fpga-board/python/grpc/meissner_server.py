########################################################################
#                          [ Python Program ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 02/16/2023
# File Name             : meissner_server.py                                           
#                                                                                
# Target Device         : PYNQ-Z1                                                     
# Tool Version          : Python >= 3.6                                          
#       
########################################################################

###################################################
##                Import Libraries               ##         
###################################################
# Python library
import re
import sys
import csv
import json
import time
import grpc
import os.path 
import argparse
from pathlib import Path
from tabulate import tabulate
from concurrent import futures

# GRPC library
import protolib.spi.spi_pb2 as spi_pb2
import protolib.spi.spi_pb2_grpc as spi_pb2_grpc
import protolib.gpio.gpio_pb2 as gpio_pb2
import protolib.gpio.gpio_pb2_grpc as gpio_pb2_grpc
import protolib.meissner.meissner_pb2 as meissner_pb2
import protolib.meissner.meissner_pb2_grpc as meissner_pb2_grpc

# PYNQ library
from pynq import GPIO
from pynq import Overlay
from pynq.lib import AxiGPIO
from pynq.lib.iic import AxiIIC

# Import sensor library
from library.pymeissner import *
from library.pyspi import *

###################################################
##              Define Service Class             ##         
###################################################
# GPIO service class
class GPIOService(gpio_pb2_grpc.GPIOServicer):
    def __init__(self, *args, **kwargs):
        pass

    # Turn off PYNQ SDN 1 I/O method
    def TurnOffPYNQSDN1IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn off PYNQ SDN 1 I/O
        try:
            pynq_sdn_1.write(0x0, 0x1)
            success = True
        except:
            print("Turn off PYNQ SDN 1 I/O failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Turn off PYNQ SDN 1 I/O', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.TurnOffPYNQSDN1IOResponse(**response)
    
    # Turn on PYNQ SDN 1 I/O method
    def TurnOnPYNQSDN1IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn on PYNQ SDN 1 I/O
        try:
            pynq_sdn_1.write(0x1, 0x1)
            success = True
        except:
            print("Turn on PYNQ SDN 1 I/O failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Turn on PYNQ SDN 1 I/O', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.TurnOnPYNQSDN1IOResponse(**response)
    
    # Turn off PYNQ SDN 2 I/O method
    def TurnOffPYNQSDN2IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn off PYNQ SDN 2 I/O
        try:
            pynq_sdn_2.write(0x0, 0x1)
            success = True
        except:
            print("Turn off PYNQ SDN 2 I/O failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Turn off PYNQ SDN 2 I/O', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.TurnOffPYNQSDN2IOResponse(**response)
    
    # Turn on PYNQ SDN 2 I/O method
    def TurnOnPYNQSDN2IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn on PYNQ SDN 2 I/O
        try:
            pynq_sdn_2.write(0x1, 0x1)
            success = True
        except:
            print("Turn on PYNQ SDN 2 I/O failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Turn on PYNQ SDN 2 I/O', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.TurnOnPYNQSDN2IOResponse(**response)
    
    # Turn off PYNQ SDN 3 I/O method
    def TurnOffPYNQSDN3IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn off PYNQ SDN 3 I/O
        try:
            pynq_sdn_3.write(0x0, 0x1)
            success = True
        except:
            print("Turn off PYNQ SDN 3 I/O failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Turn off PYNQ SDN 3 I/O', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.TurnOffPYNQSDN3IOResponse(**response)
    
    # Turn on PYNQ SDN 3 I/O method
    def TurnOnPYNQSDN3IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn on PYNQ SDN 3 I/O
        try:
            pynq_sdn_3.write(0x1, 0x1)
            success = True
        except:
            print("Turn on PYNQ SDN 3 I/O failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Turn on PYNQ SDN 3 I/O', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.TurnOnPYNQSDN3IOResponse(**response)
    
    # Reset ADC Start method
    def ResetADCStart(self, request, context):
        # Start time
        start_time = str(time.time())
        # Reset ADC Start
        try:
            pynq_adc_start.write(0x0, 0x1)
            success = True
        except:
            print("Reset ADC Start failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Reset ADC Start', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.ResetADCStartResponse(**response)
    
    # Start ADC method
    def StartADC(self, request, context):
        # Start time
        start_time = str(time.time())
        # Start ADC
        try:
            time_delay_1 = float(request.time_delay_1)
            time_delay_2 = float(request.time_delay_2)
            pynq_adc_start.write(0x1, 0x1)
            time.sleep(time_delay_1)
            pynq_adc_start.write(0x0, 0x1)
            time.sleep(time_delay_2)
            success = True
        except:
            print("Start ADC failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Start ADC', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return gpio_pb2.StartADCResponse(**response)
    
# SPI service class
class SPIService(spi_pb2_grpc.SPIServicer):
    def __init__(self, *args, **kwargs):
        pass
    
    # Configure DAC channel 0 method
    def ConfigureDACChannel0(self, request, context):
        # Start time
        start_time = str(time.time())

        # Configure DAC channel 0
        try:
            ch0_code = int(request.channel_code, 16)
            MSB = (0x01 << 4) | ((ch0_code >> 8) & 0x0F)
            LSB = ch0_code & 0xFF
            PYNQSPI.spi_write(MSB, LSB, 0)
            success = True
        except:
            print("Configure DAC channel 0 failed! Please try again.")
            success = False

        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Configure DAC channel 0', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }

        return spi_pb2.ConfigureDACChannel0Response(**response)
    
    # Configure DAC channel 1 method
    def ConfigureDACChannel1(self, request, context):
        # Start time
        start_time = str(time.time())

        # Configure DAC channel 1
        try:
            ch1_code = int(request.channel_code, 16)
            MSB = (0x05 << 4) | ((ch1_code >> 8) & 0x0F)
            LSB = ch1_code & 0xFF
            PYNQSPI.spi_write(MSB, LSB, 0)
            success = True
        except:
            print("Configure DAC channel 1 failed! Please try again.")
            success = False

        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Configure DAC channel 1', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }

        return spi_pb2.ConfigureDACChannel1Response(**response)
    
    # Configure DAC channel 2 method
    def ConfigureDACChannel2(self, request, context):
        # Start time
        start_time = str(time.time())

        # Configure DAC channel 2
        try:
            ch2_code = int(request.channel_code, 16)
            MSB = (0x09 << 4) | ((ch2_code >> 8) & 0x0F)
            LSB = ch2_code & 0xFF
            PYNQSPI.spi_write(MSB, LSB, 0)
            success = True
        except:
            print("Configure DAC channel 2 failed! Please try again.")
            success = False

        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Configure DAC channel 2', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }

        return spi_pb2.ConfigureDACChannel2Response(**response)
    
    # Read ADC method
    def ReadADC(self, request, context):
        # Declare local variables
        cnt = 0
        num_of_trx = 12
        adc_channel = 8
        raw_data = [0 for i in range(num_of_trx*2)]
        adc_value = [0 for i in range(adc_channel)]
        adc_id = [0 for i in range(adc_channel)]
        adc_voltage = [0 for i in range(adc_channel)]
        adc_softspan = [0 for i in range(adc_channel)]

        # Start time
        start_time = str(time.time())

        # Read ADC
        try:
            # Read from ADC
            num_of_trx = 12
            softspan_config = [0xDB, 0xB6, 0xDB, 0x6D]
            PYNQSPI.spi_send_bytes(softspan_config, 2, 1)
            pynq_adc_start.write(0x1, 0x1)
            time.sleep(0.01)
            pynq_adc_start.write(0x0, 0x1)
            time.sleep(0.001)
            buffer = PYNQSPI.spi_read(0xDBB6, num_of_trx, 1)
            # Parse RAW data
            for i in range(num_of_trx):
                halfword = buffer[i]
                raw_data[cnt] = halfword >> 8
                cnt += 1
                raw_data[cnt] = halfword & 0xFF
                cnt += 1
            # Convert RAW data to ADC value
            for i in range(adc_channel):
                adc_value[i] = (raw_data[(i*3)] << 8) | (raw_data[(i*3)+1] & 0xFF)
                adc_id[i] = raw_data[(i*3)+2] >> 3
                adc_softspan[i] = raw_data[(i*3)+2] & 0x07
                adc_voltage[i] = ((adc_value[i])/65536.0) * 4.096
            # Status
            success = True
        except:
            print("Read ADC failed! Please try again.")
            success = False

        # End time
        end_time = str(time.time())

        # Set response
        response = spi_pb2.ReadADCResponse()
        response.operation_name = 'Read ADC'
        response.start_time = start_time
        response.end_time = end_time
        response.success = success
        for i in range(adc_channel):
            response.adc_value.extend([adc_value[i]])
            response.adc_id.extend([adc_id[i]])
            response.adc_softspan.extend([adc_softspan[i]])
            response.adc_voltage.extend([adc_voltage[i]])

        return response

# Meissner service class
class MeissnerService(meissner_pb2_grpc.MeissnerServicer):
    def __init__(self, *args, **kwargs):
        pass
    
    # Reset sensor method
    def ResetSensor(self, request, context):
        # Start time
        start_time = str(time.time())
        # Reset sensor
        try:
            MEISSNERI2C.reset_sensor_single()
            success = True
        except:
            print("Reset sensor failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Reset sensor', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return meissner_pb2.ResetSensorResponse(**response)
    
    # Read sensor ID method
    def ReadSensorID(self, request, context):
        # Start time
        start_time = str(time.time())
        # Read sensor ID
        try:
            sensor_id = MEISSNERI2C.read_chip_id()
            success = True
        except:
            print("Read sensor ID failed! Please try again.")
            sensor_id = ''
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Read sensor ID', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_id': sensor_id, 
            'success': success
        }
        
        return meissner_pb2.ReadSensorIDResponse(**response)
    
    # Read sensor version method
    def ReadSensorVersion(self, request, context):
        # Start time
        start_time = str(time.time())
        # Read sensor version
        try:
            sensor_version = MEISSNERI2C.read_chip_ver()
            sensor_version = sensor_version[0] + sensor_version[1]
            success = sensor_version[2]
            if not(success):
                print("Assertion failed! Please check the sensor version.")
        except:
            print("Read sensor version failed! Please try again.")
            sensor_version = ''
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Read sensor version', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_version': sensor_version, 
            'success': success
        }
        
        return meissner_pb2.ReadSensorVersionResponse(**response)

    # Read sensor unique ID method
    def ReadSensorUniqueID(self, request, context):
        # Start time
        start_time = str(time.time())
        # Read sensor unique ID
        try:
            sensor_unique_id = MEISSNERI2C.read_unique_id()
            sensor_unique_id = sensor_unique_id[0] + sensor_unique_id[1]
            success = True
        except:
            print("Read sensor unique ID failed! Please try again.")
            sensor_unique_id = ''
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Read sensor unique ID', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_unique_id': sensor_unique_id, 
            'success': success
        }
        
        return meissner_pb2.ReadSensorUniqueIDResponse(**response)
    
    # Test I2C connection method
    def TestI2CConnection(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test I2C connection
        try:
            sensor_id = MEISSNERI2C.test_i2c_comm()
            success = sensor_id[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test I2C connection failed! Please try again.")
            sensor_id = ['']
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test I2C connection', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_id': sensor_id[0], 
            'success': success
        }
        
        return meissner_pb2.TestI2CConnectionResponse(**response)
    
    # Test sensor temperature method
    def TestSensorTemperature(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test sensor temperature
        try:
            sensor_temperature = MEISSNERI2C.test_temp_read()
            success = sensor_temperature[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test sensor temperature failed! Please try again.")
            sensor_temperature = [0.0, 0.0, 0.0, 0.0]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test sensor temperature', 
            'start_time': start_time, 
            'end_time': end_time, 
            'int_temp': sensor_temperature[0],
            'ext_voltage': sensor_temperature[1],
            'ext_current': sensor_temperature[2],
            'ext_resistance': sensor_temperature[3],
            'success': success
        }
        
        return meissner_pb2.TestSensorTemperatureResponse(**response)
    
    # Test sensor supply voltage method
    def TestSensorSupplyVoltage(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test sensor supply voltage
        try:
            sensor_supply_voltage = MEISSNERI2C.test_supply_sensor_voltage()
            success = sensor_supply_voltage[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test sensor supply voltage failed! Please try again.")
            sensor_supply_voltage = [0.0, 0.0, 0.0]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test sensor supply voltage', 
            'start_time': start_time, 
            'end_time': end_time, 
            'vdda': sensor_supply_voltage[0],
            'vddp_af': sensor_supply_voltage[1],
            'vddp_ois': sensor_supply_voltage[2], 
            'success': success
        }
        
        return meissner_pb2.TestSensorSupplyVoltageResponse(**response)
    
    # Test sensor output voltage method
    def TestSensorOutputVoltage(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test sensor output voltage
        try:
            sensor_output_voltage = MEISSNERI2C.test_output_voltage()
            success = sensor_output_voltage[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test sensor output voltage failed! Please try again.")
            sensor_output_voltage = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0,]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test sensor output voltage', 
            'start_time': start_time, 
            'end_time': end_time, 
            'vout_ois_b1': sensor_output_voltage[0],
            'vout_ois_b2': sensor_output_voltage[1],
            'vout_af_b3': sensor_output_voltage[2],
            'res_ois_b1': sensor_output_voltage[3],
            'res_ois_b2': sensor_output_voltage[4],
            'res_af_b3': sensor_output_voltage[5],
            'success': success
        }
        
        return meissner_pb2.TestSensorOutputVoltageResponse(**response)
    
    # Test AFE sensor connectivity method
    def TestAFESensorConnectivity(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test AFE sensor connectivity
        try:
            sensor_connectivity = MEISSNERI2C.test_afe_connectivity()
            success = sensor_connectivity[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test AFE sensor connectivity failed! Please try again.")
            sensor_connectivity = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0,]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test AFE sensor connectivity', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sense_open_s1_p': sensor_connectivity[0], 
            'sense_open_s1_n': sensor_connectivity[1],
            'sense_open_s2_p': sensor_connectivity[2],
            'sense_open_s2_n': sensor_connectivity[3],
            'sense_open_z1_p': sensor_connectivity[4],
            'sense_open_z1_n': sensor_connectivity[5],
            'success': success
        }
        
        return meissner_pb2.TestAFESensorConnectivityResponse(**response)
    
###################################################
##             Define Helper Function            ##         
###################################################
def serve(*args, **kwargs):
    # Create gRPC server
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    # Add service
    gpio_pb2_grpc.add_GPIOServicer_to_server(GPIOService(), server)
    spi_pb2_grpc.add_SPIServicer_to_server(SPIService(), server)
    meissner_pb2_grpc.add_MeissnerServicer_to_server(MeissnerService(), server)
    # Listen on port
    if args[0] != '':
        server.add_insecure_port('[::]:' + str(args[0]))
    else:
        server.add_insecure_port('[::]:50051')
    # Start server
    server.start()
    if args[0] != '':
        print('Successfully started gRPC server on port ' + str(args[0]))
    else:
        print('Successfully started gRPC server on port 50051')
    # Keep server alive until keyboard interrupt
    try:
        server.wait_for_termination()
    except KeyboardInterrupt:
        server.stop(0)

###################################################
##                  Main Program                 ##         
###################################################
if __name__ == '__main__':
    print("=====================================================")
    print("=               Loading FPGA Overlay                =")
    print("=====================================================")
    # Load overlay
    ol = Overlay('bitstream/spi_iic_interrupt_v3.bit')
    # Print overlay information
    ip_block_list = []
    for i, items in enumerate(ol.ip_dict.items()):
        ip_block_list.append([i+1, items[0]])
    print(tabulate(ip_block_list, headers=["IP Block Number", "IP Block Name"], tablefmt="fancy_grid", numalign="left"))
    print()

    print("=====================================================")
    print("=             Configuring AXI GPIO IP               =")
    print("=====================================================")
    # Get AXI GPIO IP
    pynq_adc_start_ip = ol.ip_dict['axi_gpio_0'] 
    pynq_sdn_1_ip = ol.ip_dict['axi_gpio_1']
    pynq_sdn_2_ip = ol.ip_dict['axi_gpio_2']
    pynq_sdn_3_ip = ol.ip_dict['axi_gpio_3']
    # Map GPIO IP to AXI GPIO Class
    pynq_adc_start = AxiGPIO(pynq_adc_start_ip).channel1
    pynq_sdn_1 = AxiGPIO(pynq_sdn_1_ip).channel1
    pynq_sdn_2 = AxiGPIO(pynq_sdn_2_ip).channel1
    pynq_sdn_3 = AxiGPIO(pynq_sdn_3_ip).channel1
    # Print status
    print("Successfully configured AXI GPIO IP")
    print()

    print("=====================================================")
    print("=             Configuring AXI QSPI IP               =")
    print("=====================================================")
    # Get AXI SPI IP
    spi_control = ol.axi_quad_spi_0
    # Map AXI SPI IP to SPI class
    PYNQSPI = SPI(spi_control, 0, 0) # (spi_control, cpol, cpha)
    # Print status
    print("Successfully configured AXI QSPI IP")
    print()

    print("=====================================================")
    print("=         Configuring AXI Interrupt Timer           =")
    print("=====================================================")
    # Get AXI Interrupt Timer IP
    intr_timer_ip = ol.axi_timer_0
    # Map AXI Interrupt Timer IP to Timer Class
    intr_timer = intr_timer_ip.interrupt
    # Print status
    print("Successfully configured AXI interrupt timer")
    print()

    print("=====================================================")
    print("=             Configuring AXI I2C IP                =")
    print("=====================================================")
    # get AXI IIC IP
    i2c_control = ol.ip_dict['axi_iic_0']
    # Map AXI IIC IP to Meissner Class
    AXII2C = AxiIIC(i2c_control)
    MEISSNERI2C = MeissnerI2C(AXII2C, 0x74, 0x77, intr_timer_ip, intr_timer)
    # Print status
    print("Successfully configured AXI I2C IP")
    print()
    
    
    print("=====================================================")
    print("=              Starting gRPC Server                 =")
    print("=====================================================")
    port_num = input("Enter port number of gRPC server, default = 50051: ")
    # Start server
    serve(port_num)