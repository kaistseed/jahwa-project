##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/10/2023
# File Name             : packet.py                                           
#                                                                                
# Target Device         : FPGA                                      
# Tool Version          : Python >= 3.6                                          
#       
##############################################################################

##############################################################################
#                              Import Libraries                              #
##############################################################################
# PYNQ library
from pynq.lib import PynqMicroblaze

##############################################################################
#                              Define parameters                             #
##############################################################################
# Define MicroBlaze mailbox address
MAILBOX_OFFSET = 0xF000
MAILBOX_SIZE = 0x1000
MAILBOX_PY2IOP_CMD_OFFSET = 0xffc
MAILBOX_PY2IOP_ADDR_OFFSET = 0xff8
MAILBOX_PY2IOP_DATA_OFFSET = 0xf00

# Define commands
WRITE_LED = 0x1
READ_LED = 0x2
TEST_LED = 0x3
WRITE_PMODB = 0x4
READ_PMODB = 0x5
TEST_PMODB = 0x6
TEST_I2C = 0x7
READ_ERROR = 0x8

##############################################################################
#                           Define MicroBlaze class                          #
##############################################################################
class MicroBlaze(PynqMicroblaze):
    ##########################################################################
    #                              Basic Methods                             #
    ##########################################################################
    def __init__(self, mb_info, mb_program):
        super().__init__(mb_info, mb_program)

        # Internal variables
        self._led_state = 0

    def write_mailbox(self, data_offset, data):
        offset = MAILBOX_OFFSET + data_offset
        self.write(offset, data)

    def read_mailbox(self, data_offset, num_words=1):
        offset = MAILBOX_OFFSET + data_offset
        return self.read(offset, num_words)

    def write_blocking_command(self, command):
        self.write(MAILBOX_OFFSET + MAILBOX_PY2IOP_CMD_OFFSET, command)
        while self.read(MAILBOX_OFFSET + MAILBOX_PY2IOP_CMD_OFFSET) != 0:
            pass
    def write_blocking_command_addr(self, addr, command):
        self.write(addr, command)
        while self.read(addr) != 0:
            pass        

    def write_non_blocking_command(self, command):
        self.write(MAILBOX_OFFSET + MAILBOX_PY2IOP_CMD_OFFSET, command)

    ##########################################################################
    #                    Methods Related to Test Sequence                    #
    ##########################################################################
    # Test LED sequence
    def test_led(self):
        self.write_blocking_command(TEST_LED)

    # Toggle LED sequence
    def toggle_led(self):
        # Alternate between 0 and 1
        self._led_state = 1 - self._led_state
        # Write message to mailbox
        self.write_mailbox(0, self._led_state)
        # Write command to mailbox
        self.write_blocking_command(WRITE_LED)