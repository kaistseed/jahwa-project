##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/17/2023
# File Name             : gpio.py                                           
#                                                                                
# Target Device         : FPGA                                      
# Tool Version          : Python >= 3.6                                          
#       
##############################################################################

##############################################################################
#                              Import Libraries                              #
##############################################################################
# Python library
import time

##############################################################################
#                              Define GPIO class                             #
##############################################################################
# GPIO driver class
class GPIO:
    ##########################################################################
    #                           Basic GPIO Methods                           #
    ##########################################################################
    def __init__(self, *args, **kwargs):
        # Get PYNQ ADC IO object
        self.pynq_adc_io = kwargs.get('pynq_adc_io') if kwargs.get('pynq_adc_io') is not None else None
        # assert self.pynq_adc_io is not None, "PYNQ ADC IO object is not defined!"

        # Get PYNQ SDN 1 IO object
        self.pynq_sdn_1_io = kwargs.get('pynq_sdn_1_io') if kwargs.get('pynq_sdn_1_io') is not None else None
        assert self.pynq_sdn_1_io is not None, "PYNQ SDN 1 IO object is not defined!"

        # Get PYNQ SDN 2 IO object
        self.pynq_sdn_2_io = kwargs.get('pynq_sdn_2_io') if kwargs.get('pynq_sdn_2_io') is not None else None
        assert self.pynq_sdn_2_io is not None, "PYNQ SDN 2 IO object is not defined!"

        # Get PYNQ SDN 3 IO object
        self.pynq_sdn_3_io = kwargs.get('pynq_sdn_3_io') if kwargs.get('pynq_sdn_3_io') is not None else None
        assert self.pynq_sdn_3_io is not None, "PYNQ SDN 3 IO object is not defined!"

    ##########################################################################
    #                          Turn Off I/O Methods                          #
    ##########################################################################
    # Turn off PYNQ SDN 1 I/O method
    def turn_off_sdn_1_io(self):
        # Print message
        print("Turning off PYNQ SDN 1 I/O...\n")
        # Write to PYNQ SDN 1 I/O
        self.pynq_sdn_1_io.write(0x0, 0x1)

    # Turn off PYNQ SDN 2 I/O method
    def turn_off_sdn_2_io(self):
        # Print message
        print("Turning off PYNQ SDN 2 I/O...\n")
        # Write to PYNQ SDN 2 I/O
        self.pynq_sdn_2_io.write(0x0, 0x1)

    # Turn off PYNQ SDN 3 I/O method
    def turn_off_sdn_3_io(self):
        # Print message
        print("Turning off PYNQ SDN 3 I/O...\n")
        # Write to PYNQ SDN 3 I/O
        self.pynq_sdn_3_io.write(0x0, 0x1)

    ##########################################################################
    #                           Turn On I/O Methods                          #
    ##########################################################################
    # Turn on PYNQ SDN 1 I/O method
    def turn_on_sdn_1_io(self):
        # Print message
        print("Turning on PYNQ SDN 1 I/O...\n")
        # Write to PYNQ SDN 1 I/O
        self.pynq_sdn_1_io.write(0x1, 0x1)

    # Turn on PYNQ SDN 2 I/O method
    def turn_on_sdn_2_io(self):
        # Print message
        print("Turning on PYNQ SDN 2 I/O...\n")
        # Write to PYNQ SDN 2 I/O
        self.pynq_sdn_2_io.write(0x1, 0x1)

    # Turn on PYNQ SDN 3 I/O method
    def turn_on_sdn_3_io(self):
        # Print message
        print("Turning on PYNQ SDN 3 I/O...\n")
        # Write to PYNQ SDN 3 I/O
        self.pynq_sdn_3_io.write(0x1, 0x1)

    ##########################################################################
    #                           ADC-Related Methods                          #
    ##########################################################################
    # Reset ADC method
    def reset_adc(self):
        # Print message
        print("Resetting ADC...\n")
        # Write to PYNQ ADC IO
        self.pynq_adc_io.write(0x0, 0x1)

    # Start ADC method
    def start_adc(self, delay_1, delay_2):
        # Print message
        print("Starting ADC...\n")
        # Start ADC
        self.pynq_adc_io.write(0x1, 0x1)
        time.sleep(delay_1)
        self.pynq_adc_io.write(0x0, 0x1)
        time.sleep(delay_2)