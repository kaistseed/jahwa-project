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
import time
import grpc
from concurrent import futures

# GRPC library
import protolib.spi.spi_pb2 as spi_pb2
import protolib.spi.spi_pb2_grpc as spi_pb2_grpc
import protolib.gpio.gpio_pb2 as gpio_pb2
import protolib.gpio.gpio_pb2_grpc as gpio_pb2_grpc
import protolib.meissner.meissner_pb2 as meissner_pb2
import protolib.meissner.meissner_pb2_grpc as meissner_pb2_grpc

###################################################
##              Define Client Class              ##         
###################################################
# Define Meissner client class
class MeissnerClient(object):
    def __init__(self, *args, **kwargs):
        # Define host IP address and port
        self.host = '192.168.2.99'
        self.port = 50051

        # Instantiate a gRPC channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.port))
        
        # Bind the client and the server
        self.stub = meissner_pb2_grpc.MeissnerStub(self.channel)

    # Reset sensor method
    def reset_sensor(self):
        # Create request
        request = meissner_pb2.ResetSensorPacket()
        
        # Wait for response
        response = self.stub.ResetSensor(request)
        
        # Return response
        return response
    
    # Test I2C connection method
    def test_i2c_connection(self):
        # Create request
        request = meissner_pb2.TestI2CConnectionPacket()
        
        # Wait for response
        response = self.stub.TestI2CConnection(request)
        
        # Return response
        return response
    
# Define GPIO client class
class GPIOClient(object):
    def __init__(self, *args, **kwargs):
        # Define host IP address and port
        self.host = '192.168.2.99'
        self.port = 50051

        # Instantiate a gRPC channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.port))
        
        # Bind the client and the server
        self.stub = gpio_pb2_grpc.GPIOStub(self.channel)

    # Turn off PYNQ SDN 1 I/O method
    def turn_off_pynq_sdn1_io(self):
        # Create request
        request = gpio_pb2.TurnOffPYNQSDN1IOPacket()
        
        # Wait for response
        response = self.stub.TurnOffPYNQSDN1IO(request)
        
        # Return response
        return response
    
    # Turn on PYNQ SDN 1 I/O method
    def turn_on_pynq_sdn1_io(self):
        # Create request
        request = gpio_pb2.TurnOnPYNQSDN1IOPacket()
        
        # Wait for response
        response = self.stub.TurnOnPYNQSDN1IO(request)
        
        # Return response
        return response
    
    # Turn off PYNQ SDN 2 I/O method
    def turn_off_pynq_sdn2_io(self):
        # Create request
        request = gpio_pb2.TurnOffPYNQSDN2IOPacket()
        
        # Wait for response
        response = self.stub.TurnOffPYNQSDN2IO(request)
        
        # Return response
        return response
    
    # Turn on PYNQ SDN 2 I/O method
    def turn_on_pynq_sdn2_io(self):
        # Create request
        request = gpio_pb2.TurnOnPYNQSDN2IOPacket()
        
        # Wait for response
        response = self.stub.TurnOnPYNQSDN2IO(request)
        
        # Return response
        return response
    
    # Turn off PYNQ SDN 3 I/O method
    def turn_off_pynq_sdn3_io(self):
        # Create request
        request = gpio_pb2.TurnOffPYNQSDN3IOPacket()
        
        # Wait for response
        response = self.stub.TurnOffPYNQSDN3IO(request)
        
        # Return response
        return response
    
    # Turn on PYNQ SDN 3 I/O method
    def turn_on_pynq_sdn3_io(self):
        # Create request
        request = gpio_pb2.TurnOnPYNQSDN3IOPacket()
        
        # Wait for response
        response = self.stub.TurnOnPYNQSDN3IO(request)
        
        # Return response
        return response
    
# Define SPI client class
class SPIClient(object):
    def __init__(self, *args, **kwargs):
        # Define host IP address and port
        self.host = '192.168.2.99'
        self.port = 50051

        # Instantiate a gRPC channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.port))
        
        # Bind the client and the server
        self.stub = spi_pb2_grpc.SPIStub(self.channel)

    # Configure DAC channel 0
    def config_dac_channel_0(self):
        # Create request
        request = spi_pb2.ConfigureDACChannel0Packet()
        
        # Wait for response
        response = self.stub.ConfigureDACChannel0(request)
        
        # Return response
        return response
    
    # Configure DAC channel 1
    def config_dac_channel_1(self):
        # Create request
        request = spi_pb2.ConfigureDACChannel1Packet()
        
        # Wait for response
        response = self.stub.ConfigureDACChannel1(request)
        
        # Return response
        return response
    
    # Configure DAC channel 2
    def config_dac_channel_2(self):
        # Create request
        request = spi_pb2.ConfigureDACChannel2Packet()
        
        # Wait for response
        response = self.stub.ConfigureDACChannel2(request)
        
        # Return response
        return response

###################################################
##             Define Helper Function            ##         
###################################################
#  
###################################################
##                  Main Program                 ##         
###################################################
if __name__ == '__main__':
    # Instantiate client
    spi_client = SPIClient()
    gpio_client = GPIOClient()
    meissner_client = MeissnerClient()
    
    # print("=====================================================")
    # print("=                 Start GPIO Test                   =")
    # print("=====================================================")
    # # Test PYNQ SDN 1 I/O (off)
    # response = gpio_client.turn_off_pynq_sdn1_io()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Success: {}".format(response.success))
    # print()

    # # Test PYNQ SDN 2 I/O (off)
    # response = gpio_client.turn_off_pynq_sdn2_io()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Success: {}".format(response.success))
    # print()

    # # Test PYNQ SDN 3 I/O (off)
    # response = gpio_client.turn_off_pynq_sdn3_io()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Success: {}".format(response.success))
    # print()

    # # Test PYNQ SDN 1 I/O (on)
    # response = gpio_client.turn_on_pynq_sdn1_io()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Success: {}".format(response.success))
    # print()

    # # Test PYNQ SDN 2 I/O (on)
    # response = gpio_client.turn_on_pynq_sdn2_io()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Success: {}".format(response.success))
    # print()

    # # Test PYNQ SDN 3 I/O (on)
    # response = gpio_client.turn_on_pynq_sdn3_io()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Success: {}".format(response.success))
    # print()

    print("=====================================================")
    print("=               Start Test Sequence                 =")
    print("=====================================================")
    # Test PYNQ SDN 1 I/O (off)
    response = gpio_client.turn_off_pynq_sdn1_io()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test PYNQ SDN 2 I/O (off)
    response = gpio_client.turn_off_pynq_sdn2_io()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test PYNQ SDN 3 I/O (off)
    response = gpio_client.turn_off_pynq_sdn3_io()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test Configure DAC channel 0
    response = spi_client.config_dac_channel_0()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test Configure DAC channel 1
    response = spi_client.config_dac_channel_1()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test Configure DAC channel 2
    response = spi_client.config_dac_channel_2()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test PYNQ SDN 1 I/O (on)
    response = gpio_client.turn_on_pynq_sdn1_io()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test PYNQ SDN 2 I/O (on)
    response = gpio_client.turn_on_pynq_sdn2_io()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test PYNQ SDN 3 I/O (on)
    response = gpio_client.turn_on_pynq_sdn3_io()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # Test Reset Meissner
    response = meissner_client.test_i2c_connection()
    # Print response
    print("Operation name: {}".format(response.operation_name))
    print("Start time: {} ns".format(response.start_time))
    print("End time: {} ns".format(response.end_time))
    print("Success: {}".format(response.success))
    print()

    # # Test I2C connection
    # response = meissner_client.test_i2c_connection()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Sensor ID: {}".format(response.sensor_id))
    # print("Success: {}".format(response.success))
    # print()

    # # Test I2C connection
    # response = meissner_client.test_i2c_connection()
    # # Print response
    # print("Operation name: {}".format(response.operation_name))
    # print("Start time: {} ns".format(response.start_time))
    # print("End time: {} ns".format(response.end_time))
    # print("Sensor ID: {}".format(response.sensor_id))
    # print("Success: {}".format(response.success))
    # print()

