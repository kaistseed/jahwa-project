########################################################################
#                          [ Python Program ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/20/2023
# File Name             : streaming_client.py                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6                                          
#       
########################################################################

###################################################
##                Import Libraries               ##         
###################################################
# Python library
import grpc
from tabulate import tabulate
from concurrent import futures
from google.protobuf.json_format import MessageToDict

# User-defined library
from library.grpc.spi import SPIClient
from library.grpc.gpio import GPIOClient
from library.grpc.meissner import MeissnerClient

# gRPC generated python library
import protolib.spi.spi_pb2 as spi_pb2
import protolib.spi.spi_pb2_grpc as spi_pb2_grpc
import protolib.gpio.gpio_pb2 as gpio_pb2
import protolib.gpio.gpio_pb2_grpc as gpio_pb2_grpc
import protolib.meissner.meissner_pb2 as meissner_pb2
import protolib.meissner.meissner_pb2_grpc as meissner_pb2_grpc

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
        channel_code = str(input("Enter DAC channel 0 code: "))
        response = spi_client.config_dac_channel_0(
            channel_code=channel_code
        )
        return response
    elif func_number == 2:
        channel_code = str(input("Enter DAC channel 1 code: "))
        response = spi_client.config_dac_channel_1(
            channel_code=channel_code
        )
        return response
    elif func_number == 3:
        channel_code = str(input("Enter DAC channel 2 code: "))
        response = spi_client.config_dac_channel_2(
            channel_code=channel_code
        )
        return response
    elif func_number == 4:
        response = spi_client.read_adc()
        return response
    elif func_number == 5:
        response = gpio_client.reset_adc_start()
        return response
    elif func_number == 6:
        time_delay_1 = float(input("Enter time delay 1: "))
        time_delay_2 = float(input("Enter time delay 2: "))
        response = gpio_client.start_adc(
            time_delay_1=time_delay_1,
            time_delay_2=time_delay_2
        )
        return response
    elif func_number == 7:
        response = gpio_client.turn_off_pynq_sdn1_io()
        return response
    elif func_number == 8:
        response = gpio_client.turn_off_pynq_sdn2_io()
        return response
    elif func_number == 9:
        response = gpio_client.turn_off_pynq_sdn3_io()
        return response
    elif func_number == 10:
        response = gpio_client.turn_on_pynq_sdn1_io()
        return response
    elif func_number == 11:
        response = gpio_client.turn_on_pynq_sdn2_io()
        return response
    elif func_number == 12:
        response = gpio_client.turn_on_pynq_sdn3_io()
        return response
    elif func_number == 13:
        response = meissner_client.pattern_check_status()
        return response
    elif func_number == 14:
        raise NotImplementedError
    elif func_number == 15:
        raise NotImplementedError
    elif func_number == 16:
        raise NotImplementedError
    elif func_number == 17:
        address = int(input("Enter I2C address: "), 16)
        length = int(input("Enter length of data to read: "))
        response = meissner_client.read_i2c(
            address=address, 
            length=length
        )
        return response
    elif func_number == 18:
        response = meissner_client.read_sensor_id()
        return response
    elif func_number == 19:
        response = meissner_client.read_sensor_unique_id()
        return response
    elif func_number == 20:
        response = meissner_client.read_sensor_version()
        return response
    elif func_number == 21:
        response = meissner_client.reset_sensor()
        return response
    elif func_number == 22:
        response = meissner_client.test_afe_sensor_connectivity()
        return response
    elif func_number == 23:
        response = meissner_client.test_i2c_connection()
        return response
    elif func_number == 24:
        response = meissner_client.test_sensor_output_voltage()
        return response
    elif func_number == 25:
        response = meissner_client.test_sensor_supply_voltage()
        return response
    elif func_number == 26:
        response = meissner_client.test_sensor_temperature()
        return response
    elif func_number == 27:
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
    ip_addr = input("Enter IP address of gRPC server, default = 192.168.2.99: ")
    port_num = input("Enter port number of gRPC server, default = 50051: ")

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
            print("Exiting gRPC client...")
            break
        else:
            # Convert gRPC message to dictionary
            response = call_grpc_method(func_number, SPIClient, GPIOClient, MeissnerClient)
            # Print response
            if response is not None:
                response = MessageToDict(
                    response, 
                    including_default_value_fields=True,
                    preserving_proto_field_name=True
                )
                for key, value in response.items():
                    print("{}: {}".format(key, value))
                print()