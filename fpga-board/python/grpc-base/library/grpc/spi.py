########################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/21/2023
# File Name             : spi.py                                           
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
import protolib.spi.spi_pb2 as spi_pb2
import protolib.spi.spi_pb2_grpc as spi_pb2_grpc

###################################################
##               Define SPI Service              ##         
###################################################
class SPIService(spi_pb2_grpc.SPIServicer):
    def __init__(self, *args, **kwargs):
        # Get PYNQ SPI object
        self.pynq_spi = kwargs.get('pynq_spi') if kwargs.get('pynq_spi') is not None else None
        assert self.pynq_spi is not None, "PYNQ SPI object is not defined!"

        # Get PYNQ ADC IO object
        self.pynq_adc_io = kwargs.get('pynq_adc_io') if kwargs.get('pynq_adc_io') is not None else None
        assert self.pynq_adc_io is not None, "PYNQ ADC IO object is not defined!"

    ###############################################
    ##            DAC-Related Commands           ##         
    ###############################################
    # Configure DAC channel 0 method
    def ConfigureDACChannel0(self, request, context):
        # Start time
        start_time = str(time.time())

        # Configure DAC channel 0
        try:
            ch0_code = int(request.channel_code, 16)
            MSB = (0x01 << 4) | ((ch0_code >> 8) & 0x0F)
            LSB = ch0_code & 0xFF
            self.pynq_spi.spi_write(MSB, LSB, 0)
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
            self.pynq_spi.spi_write(MSB, LSB, 0)
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
            self.pynq_spi.spi_write(MSB, LSB, 0)
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

    ###############################################
    ##            ADC-Related Commands           ##         
    ###############################################
    def ReadADC(self, request, context):
        # Declare local variables
        cnt = 0
        num_of_trx = 12
        adc_channel = 8

        # Declare ADC configuration
        softspan_config = [0xDB, 0xB6, 0xDB, 0x6D]

        # Declare lists for storing ADC data
        raw_data = [0 for i in range(num_of_trx*2)]
        adc_value = [0 for i in range(adc_channel)]
        adc_id = [0 for i in range(adc_channel)]
        adc_voltage = [0 for i in range(adc_channel)]
        adc_softspan = [0 for i in range(adc_channel)]

        # Start time
        start_time = str(time.time())

        # Read ADC
        try:
            # Iniialize ADC
            self.pynq_spi.spi_send_bytes(softspan_config, 2, 1)
            self.pynq_adc_io.write(0x1, 0x1)
            time.sleep(0.01)
            self.pynq_adc_io.write(0x0, 0x1)
            time.sleep(0.001)

            # Read ADC data
            buffer = self.pynq_spi.spi_read(0xDBB6, num_of_trx, 1)

            # Parse ADC data
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

            # Set success flag
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

        # Return response
        return response