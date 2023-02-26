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
from tabulate import tabulate
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
# Define function that return all user-defined methods of a class
def list_all_methods(cls):
    # Get all methods of the class
    method_list = [method for method in dir(cls) if callable(getattr(cls, method)) and not method.startswith("__")]
    return method_list

# Define function that print all user-defined methods of a class
def print_all_methods(*args):
    # Declare local variable
    method_list = []
    
    # Get all methods of the class
    for cls in args:
        method_list.extend(list_all_methods(cls))
    
    # Enumerate all methods
    for i, method in enumerate(method_list):
        method_list[i] = [i+1, method]
    
    # Print all methods
    print("============================================================")
    print("=              List of Available Functions                 =")
    print("============================================================")
    print(tabulate(method_list, headers=["Function Number", "Function Name"], tablefmt="fancy_grid"))
    print()

# Define function to call gRPC method
def call_grpc_method(func_number, *args):
    # Call gRPC method based on function number
    if func_number == 0:
        print_all_methods(*args)
        return None
    elif func_number == 1:
        response = spi_client.config_dac_channel_0()
        return response
    elif func_number == 2:
        response = spi_client.config_dac_channel_1()
        return response
    elif func_number == 3:
        response = spi_client.config_dac_channel_2()
        return response
    elif func_number == 4:
        response = gpio_client.turn_off_pynq_sdn1_io()
        return response
    elif func_number == 5:
        response = gpio_client.turn_off_pynq_sdn2_io()
        return response
    elif func_number == 6:
        response = gpio_client.turn_off_pynq_sdn3_io()
        return response
    elif func_number == 7:
        response = gpio_client.turn_on_pynq_sdn1_io()
        return response
    elif func_number == 8:
        response = gpio_client.turn_on_pynq_sdn2_io()
        return response
    elif func_number == 9:
        response = gpio_client.turn_on_pynq_sdn3_io()
        return response
    elif func_number == 10:
        response = meissner_client.reset_sensor()
        return response
    elif func_number == 11:
        response = meissner_client.test_i2c_connection()
        return response
    else:
        print("Invalid function number!")
        return None

###################################################
##                  Main Program                 ##         
###################################################
if __name__ == '__main__':
    print("=====================================================")
    print("=              Starting gRPC Client                 =")
    print("=====================================================")
    print()

    # Instantiate client
    spi_client = SPIClient()
    gpio_client = GPIOClient()
    meissner_client = MeissnerClient()

    # Print all methods
    print_all_methods(SPIClient, GPIOClient, MeissnerClient)

    # Run gRPC client based on user input
    while True:
        # Get function number from user
        func_number = int(input("Enter function number (0) to list all functions, (-1) to exit: "))
        print()

        # Call gRPC method
        if func_number == -1:
            break
        else:
            response = call_grpc_method(func_number, SPIClient, GPIOClient, MeissnerClient)
            if response is not None:
                print(response)