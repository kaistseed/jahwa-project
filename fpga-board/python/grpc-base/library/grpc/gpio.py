########################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/21/2023
# File Name             : gpio.py                                           
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

# gRPC generated Python library
import protolib.gpio.gpio_pb2 as gpio_pb2
import protolib.gpio.gpio_pb2_grpc as gpio_pb2_grpc

###################################################
##              Define GPIO Service              ##         
###################################################
class GPIOService(gpio_pb2_grpc.GPIOServicer):
    def __init__(self, *args, **kwargs):
        # Get PYNQ ADC IO object
        self.pynq_adc_io = kwargs.get('pynq_adc_io') if kwargs.get('pynq_adc_io') is not None else None
        assert self.pynq_adc_io is not None, "PYNQ ADC IO object is not defined!"

        # Get PYNQ SDN 1 IO object
        self.pynq_sdn_1_io = kwargs.get('pynq_sdn_1_io') if kwargs.get('pynq_sdn_1_io') is not None else None
        assert self.pynq_sdn_1_io is not None, "PYNQ SDN 1 IO object is not defined!"

        # Get PYNQ SDN 2 IO object
        self.pynq_sdn_2_io = kwargs.get('pynq_sdn_2_io') if kwargs.get('pynq_sdn_2_io') is not None else None
        assert self.pynq_sdn_2_io is not None, "PYNQ SDN 2 IO object is not defined!"

        # Get PYNQ SDN 3 IO object
        self.pynq_sdn_3_io = kwargs.get('pynq_sdn_3_io') if kwargs.get('pynq_sdn_3_io') is not None else None
        assert self.pynq_sdn_3_io is not None, "PYNQ SDN 3 IO object is not defined!"

    ###############################################
    ##            Turn Off I/O Commands          ##         
    ###############################################
    # Turn off PYNQ SDN 1 I/O method
    def TurnOffPYNQSDN1IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn off PYNQ SDN 1 I/O
        try:
            self.pynq_sdn_1_io.write(0x0, 0x1)
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
    
    # Turn off PYNQ SDN 2 I/O method
    def TurnOffPYNQSDN2IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn off PYNQ SDN 2 I/O
        try:
            self.pynq_sdn_2_io.write(0x0, 0x1)
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
    
    # Turn off PYNQ SDN 3 I/O method
    def TurnOffPYNQSDN3IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn off PYNQ SDN 3 I/O
        try:
            self.pynq_sdn_3_io.write(0x0, 0x1)
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
    
    ###############################################
    ##             Turn On I/O Commands          ##         
    ###############################################
    # Turn on PYNQ SDN 1 I/O method
    def TurnOnPYNQSDN1IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn on PYNQ SDN 1 I/O
        try:
            self.pynq_sdn_1_io.write(0x1, 0x1)
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
    
    # Turn on PYNQ SDN 2 I/O method
    def TurnOnPYNQSDN2IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn on PYNQ SDN 2 I/O
        try:
            self.pynq_sdn_2_io.write(0x1, 0x1)
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
    
    # Turn on PYNQ SDN 3 I/O method
    def TurnOnPYNQSDN3IO(self, request, context):
        # Start time
        start_time = str(time.time())
        # Turn on PYNQ SDN 3 I/O
        try:
            self.pynq_sdn_3_io.write(0x1, 0x1)
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
    
    ###############################################
    ##            ADC Control Commands           ##         
    ###############################################
    # Reset ADC Start method
    def ResetADCStart(self, request, context):
        # Start time
        start_time = str(time.time())
        # Reset ADC Start
        try:
            self.pynq_adc_io.write(0x0, 0x1)
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
            self.pynq_adc_io.write(0x1, 0x1)
            time.sleep(time_delay_1)
            self.pynq_adc_io.write(0x0, 0x1)
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