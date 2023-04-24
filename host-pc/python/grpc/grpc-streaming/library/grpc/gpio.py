########################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/20/2023
# File Name             : gpio.py                                           
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

# gRPC generated python library
import protolib.gpio.gpio_pb2 as gpio_pb2
import protolib.gpio.gpio_pb2_grpc as gpio_pb2_grpc

###################################################
##               Define GPIO Class               ##         
###################################################
class GPIOClient(object):
    def __init__(self, *args, **kwargs):
        # Define host IP address and port
        self.host = kwargs.get('ip_addr') if kwargs.get('ip_addr') is not None else '192.168.2.99'
        self.port = kwargs.get('port_num') if kwargs.get('port_num') is not None else 50051

        # Instantiate a gRPC channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.port))
        
        # Bind the client and the server
        self.stub = gpio_pb2_grpc.GPIOStub(self.channel)

    ###############################################
    ##            Turn Off I/O Commands          ##         
    ###############################################
    # Turn off PYNQ SDN 1 I/O method
    def turn_off_pynq_sdn1_io(self):
        # Create request
        request = gpio_pb2.TurnOffPYNQSDN1IOPacket()
        # Wait for response
        response = self.stub.TurnOffPYNQSDN1IO(request)
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
    
    # Turn off PYNQ SDN 3 I/O method
    def turn_off_pynq_sdn3_io(self):
        # Create request
        request = gpio_pb2.TurnOffPYNQSDN3IOPacket()
        # Wait for response
        response = self.stub.TurnOffPYNQSDN3IO(request)
        # Return response
        return response
    
    ###############################################
    ##            Turn On I/O Commands           ##         
    ###############################################
    # Turn on PYNQ SDN 1 I/O method
    def turn_on_pynq_sdn1_io(self):
        # Create request
        request = gpio_pb2.TurnOnPYNQSDN1IOPacket()
        # Wait for response
        response = self.stub.TurnOnPYNQSDN1IO(request)
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
    
    # Turn on PYNQ SDN 3 I/O method
    def turn_on_pynq_sdn3_io(self):
        # Create request
        request = gpio_pb2.TurnOnPYNQSDN3IOPacket()
        # Wait for response
        response = self.stub.TurnOnPYNQSDN3IO(request)
        # Return response
        return response
    
    ###############################################
    ##            ADC Control Commands           ##         
    ###############################################
    # Reset ADC Start method
    def reset_adc_start(self):
        # Create request
        request = gpio_pb2.ResetADCStartPacket()
        # Wait for response
        response = self.stub.ResetADCStart(request)
        # Return response
        return response
    
    # Start ADC conversion method
    def start_adc(self, time_delay_1, time_delay_2):
        # Create request
        request = gpio_pb2.StartADCPacket(
            time_delay_1=time_delay_1,
            time_delay_2=time_delay_2
        )
        # Wait for response
        response = self.stub.StartADC(request)
        # Return response
        return response