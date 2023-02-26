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
        self.host = kwargs.get('ip_addr') if kwargs.get('ip_addr') is not None else '192.168.2.99'
        self.port = kwargs.get('port') if kwargs.get('port') is not None else 50051
        
        # Instantiate a gRPC channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.port))
        
        # Bind the client and the server
        self.stub = meissner_pb2_grpc.MeissnerStub(self.channel)

    # Read I2C method
    def read_i2c(self, address, length):
        # Create request
        request = meissner_pb2.ReadI2CPacket(
            address=address, 
            length=length
        )
        # Wait for response
        response = self.stub.ReadI2C(request)
        # Return response
        return response

    # Write I2C method
    def write_i2c(self, address, length, data):
        # Create request
        request = meissner_pb2.WriteI2CPacket(
            address=address,
            length=length,
            data=data
        )
        # Wait for response
        response = self.stub.WriteI2C(request)
        # Return response
        return response

    # Reset sensor method
    def reset_sensor(self):
        # Create request
        request = meissner_pb2.ResetSensorPacket()
        # Wait for response
        response = self.stub.ResetSensor(request)
        # Return response
        return response
    
    # Read sensor id method
    def read_sensor_id(self):
        # Create request
        request = meissner_pb2.ReadSensorIDPacket()
        # Wait for response
        response = self.stub.ReadSensorID(request)
        # Return response
        return response
    
    # Read sensor version method
    def read_sensor_version(self):
        # Create request
        request = meissner_pb2.ReadSensorVersionPacket()
        # Wait for response
        response = self.stub.ReadSensorVersion(request)
        # Return response
        return response
    
    # Read sensor unique id method
    def read_sensor_unique_id(self):
        # Create request
        request = meissner_pb2.ReadSensorUniqueIDPacket()
        # Wait for response
        response = self.stub.ReadSensorUniqueID(request)
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
    
    # Test sensor temperature method
    def test_sensor_temperature(self):
        # Create request
        request = meissner_pb2.TestSensorTemperaturePacket()
        # Wait for response
        response = self.stub.TestSensorTemperature(request)
        # Return response
        return response
    
    # Test sensor supply voltage method
    def test_sensor_supply_voltage(self):
        # Create request
        request = meissner_pb2.TestSensorSupplyVoltagePacket()
        # Wait for response
        response = self.stub.TestSensorSupplyVoltage(request)
        # Return response
        return response
    
    # Test sensor output voltage method
    def test_sensor_output_voltage(self):
        # Create request
        request = meissner_pb2.TestSensorOutputVoltagePacket()
        # Wait for response
        response = self.stub.TestSensorOutputVoltage(request)
        # Return response
        return response
    
    # Test AFE sensor connectivity method
    def test_afe_sensor_connectivity(self):
        # Create request
        request = meissner_pb2.TestAFESensorConnectivityPacket()
        # Wait for response
        response = self.stub.TestAFESensorConnectivity(request)
        # Return response
        return response
    
# Define GPIO client class
class GPIOClient(object):
    def __init__(self, *args, **kwargs):
        # Define host IP address and port
        self.host = kwargs.get('ip_addr') if kwargs.get('ip_addr') is not None else '192.168.2.99'
        self.port = kwargs.get('port') if kwargs.get('port') is not None else 50051

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
        self.host = kwargs.get('ip_addr') if kwargs.get('ip_addr') is not None else '192.168.2.99'
        self.port = kwargs.get('port') if kwargs.get('port') is not None else 50051

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
    # Get class name
    cls_name = cls.__name__
    # Get all methods of the class
    method_list = [[cls_name, method] for method in dir(cls) if callable(getattr(cls, method)) and not method.startswith("__")]
    return method_list

# Define function that print all user-defined methods of a class
def print_all_methods(*args):
    # Declare local variable
    method_list = []
    
    # Get all methods of the class
    for cls in args:
        method_list.extend(list_all_methods(cls))
    
    # Enumerate all methods
    for i, value in enumerate(method_list):
        method_list[i] = [i+1, value[0], value[1]]
    
    # Print all methods
    print()
    print("============================================================")
    print("=              List of Available Functions                 =")
    print("============================================================")
    print(tabulate(method_list, headers=["Function Number", "Class Name" ,"Function Name"], tablefmt="fancy_grid", numalign="left"))
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
        address = int(input("Enter I2C address: "), 16)
        length = int(input("Enter length of data to read: "))
        response = meissner_client.read_i2c(
            address=address, 
            length=length
        )
        return response
    elif func_number == 11:
        response = meissner_client.read_sensor_id()
        return response
    elif func_number == 12:
        response = meissner_client.read_sensor_unique_id()
        return response
    elif func_number == 13:
        response = meissner_client.read_sensor_version()
        return response
    elif func_number == 14:
        response = meissner_client.reset_sensor()
        return response
    elif func_number == 15:
        response = meissner_client.test_afe_sensor_connectivity()
        return response
    elif func_number == 16:
        response = meissner_client.test_i2c_connection()
        return response
    elif func_number == 17:
        response = meissner_client.test_sensor_output_voltage()
        return response
    elif func_number == 18:
        response = meissner_client.test_sensor_supply_voltage()
        return response
    elif func_number == 19:
        response = meissner_client.test_sensor_temperature()
        return response
    elif func_number == 20:
        address = int(input("Enter I2C address: "))
        length = int(input("Enter length: "))
        data = int(input("Enter data: "))
        response = meissner_client.write_i2c(
            address=address, 
            length=length, 
            data=data
        )
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
    ip_addr = input("Enter IP address of gRPC server: ")
    port_num = input("Enter port number of gRPC server: ")

    # Instantiate gRPC client
    try:
        spi_client = SPIClient(ip_addr, port_num)
        gpio_client = GPIOClient(ip_addr, port_num)
        meissner_client = MeissnerClient(ip_addr, port_num)
        print("Successfully connected to gRPC server at {}:{}".format(meissner_client.host, meissner_client.port))
    except Exception as e:
        print(e)
        print("Failed to connect to gRPC server at {}:{}".format(meissner_client.host, meissner_client.port))
        exit(1)

    # Print all methods
    print_all_methods(SPIClient, GPIOClient, MeissnerClient)

    # Run gRPC client based on user input
    while True:
        # Get function number from user
        func_number = int(input("Enter function number (0) to list all functions, (-1) to exit: "))

        # Call gRPC method
        if func_number == -1:
            break
        else:
            response = call_grpc_method(func_number, SPIClient, GPIOClient, MeissnerClient)
            if response is not None:
                print(response)