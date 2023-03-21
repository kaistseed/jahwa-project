########################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/20/2023
# File Name             : spi.py                                           
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

# gPRC generated python library
import protolib.spi.spi_pb2 as spi_pb2
import protolib.spi.spi_pb2_grpc as spi_pb2_grpc

###################################################
##                Define SPI Class               ##         
###################################################
class SPIClient(object):
    def __init__(self, *args, **kwargs):
        # Define host IP address and port
        self.host = kwargs.get('ip_addr') if kwargs.get('ip_addr') is not None else '192.168.2.99'
        self.port = kwargs.get('port_num') if kwargs.get('port_num') is not None else 50051

        # Instantiate a gRPC channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.port))
        
        # Bind the client and the server
        self.stub = spi_pb2_grpc.SPIStub(self.channel)

    ###############################################
    ##            DAC-Related Commands           ##         
    ###############################################
    # Configure DAC channel 0
    def config_dac_channel_0(self, channel_code):
        # Create request
        request = spi_pb2.ConfigureDACChannel0Packet(
            channel_code=channel_code
        )
        # Wait for response
        response = self.stub.ConfigureDACChannel0(request)
        # Return response
        return response
    
    # Configure DAC channel 1
    def config_dac_channel_1(self, channel_code):
        # Create request
        request = spi_pb2.ConfigureDACChannel1Packet(
            channel_code=channel_code
        )
        # Wait for response
        response = self.stub.ConfigureDACChannel1(request)
        # Return response
        return response
    
    # Configure DAC channel 2
    def config_dac_channel_2(self, channel_code):
        # Create request
        request = spi_pb2.ConfigureDACChannel2Packet(
            channel_code=channel_code
        )
        # Wait for response
        response = self.stub.ConfigureDACChannel2(request)
        # Return response
        return response
    
    ###############################################
    ##            ADC-Related Commands           ##         
    ###############################################
    # Read ADC
    def read_adc(self):
        # Create request
        request = spi_pb2.ReadADCPacket()
        # Wait for response
        response = self.stub.ReadADC(request)
        # Return response
        return response

