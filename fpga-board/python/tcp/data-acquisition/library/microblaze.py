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

# Define operation mode
# GPIO operations
GPIO_WRITE_LED = 0x01
GPIO_READ_LED = 0x02
GPIO_TEST_LED = 0x03
GPIO_WRITE_PMODB = 0x04
GPIO_READ_PMODB = 0x05
GPIO_TEST_PMODB = 0x06
# I2C operations
I2C_MEISSNER_RESET = 0x11
I2C_MEISSNER_INIT_CFG = 0x12
I2C_MEISSNER_STBY_TO_ACT = 0x13
I2C_MEISSNER_READ = 0x14
I2C_MEISSNER_WRITE = 0x15
I2C_MEISSNER_PATTERN_LOAD = 0x16
I2C_MEISSNER_PATTERN_RUN = 0x17
I2C_MEISSNER_PATTERN_GET = 0x18
I2C_MEISSNER_CHIP_ID = 0x19
I2C_MEISSNER_VERSION = 0x1A
I2C_MEISSNER_UNIQUE_ID = 0x1B
# Laser trigger operations
LASER_TRIGGER = 0x21
# Timer operations
TIMER_GET_CNT_VAL = 0x31
TIMER_TEST_DELAY = 0x32

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
    #                         GPIO Related Operations                        #
    ##########################################################################
    # Test LED function
    def gpio_test_led(self):
        self.write_blocking_command(GPIO_TEST_LED)

    # Toggle LED function
    def gpio_toggle_led(self):
        # Alternate between 0 and 1
        self._led_state = 1 - self._led_state
        # Write message to mailbox
        self.write_mailbox(0, self._led_state)
        # Write command to mailbox
        self.write_blocking_command(GPIO_WRITE_LED)
    
    ##########################################################################
    #                          I2C Related Operations                        #
    ##########################################################################
    # Reset sensor function
    def i2c_meissner_reset(self):
        # Send reset command
        self.write_blocking_command(I2C_MEISSNER_RESET)

    # I2C read function
    def i2c_meissner_read(self, slave_addr, addr_len, data_len, reg_addr):
        # Write data to mailbox
        self.write_mailbox(0, slave_addr)
        self.write_mailbox(4, addr_len)
        self.write_mailbox(8, data_len)
        self.write_mailbox(12, reg_addr)
        # Send I2C read command
        self.write_blocking_command(I2C_MEISSNER_READ)
        # Get read data
        read_data = self.read_mailbox(0)
        # Return read data
        return read_data

    # I2C write function
    def i2c_meissner_write(self, slave_addr, addr_len, data_len, reg_addr, data_buf):
        # Write data to mailbox
        self.write_mailbox(0, slave_addr)
        self.write_mailbox(4, addr_len)
        self.write_mailbox(8, data_len)
        self.write_mailbox(12, reg_addr)
        self.write_mailbox(16, data_buf)
        # Write command to mailbox
        self.write_blocking_command(I2C_MEISSNER_WRITE)

    # Read chip ID function
    def i2c_meissner_chip_id(self):
        # Send read chip version command
        self.write_blocking_command(I2C_MEISSNER_CHIP_ID)
        # Read chip ID
        chip_id = self.read_mailbox(0)
        # Return chip ID
        return chip_id

    # Read chip version function
    def i2c_meissner_version(self):
        # Send read chip ID command
        self.write_blocking_command(I2C_MEISSNER_VERSION)
        # Read chip ID
        chip_ver_1, chip_ver_2 = self.read_mailbox(0), self.read_mailbox(4)
        # Return chip ID
        return chip_ver_1, chip_ver_2

    # Read chip unique id function
    def i2c_meissner_unique_id(self):
        # Send read chip unique id command
        self.write_blocking_command(I2C_MEISSNER_UNIQUE_ID)
        # Read chip ID
        unique_id = self.read_mailbox(0)
        # Return chip ID
        return unique_id

    ##########################################################################
    #                     Laser Trigger Related Operations                   #
    ##########################################################################
    # Trigger laser function
    def laser_trigger(self, division_ratio):
        # Write message to mailbox
        self.write_mailbox(0, division_ratio)
        # Send laser trigger command
        self.write_blocking_command(LASER_TRIGGER)

    ##########################################################################
    #                          Timer Related Operations                      #
    ##########################################################################
    def timer_get_cnt_val(self, dev_id, timer_id):
        # Write message to mailbox
        self.write_mailbox(0, dev_id)
        self.write_mailbox(4, timer_id)
        # Send timer get count value command
        self.write_blocking_command(TIMER_GET_CNT_VAL)
        # Read count value
        timer_cnt_val = self.read_mailbox(0)
        # Return timer count value
        return timer_cnt_val

    def timer_test_delay(self):
        # Send timer test delay command
        self.write_blocking_command(TIMER_TEST_DELAY)
        # Read delay value
        delay_10us = self.read_mailbox(0) / 1e2
        delay_100us = self.read_mailbox(4) / 1e2
        delay_1ms = self.read_mailbox(8) / 1e5
        delay_10ms = self.read_mailbox(12) / 1e5
        delay_100ms = self.read_mailbox(16) / 1e5
        delay_1s = self.read_mailbox(20) / 1e8
        # Return delay value
        return delay_10us, delay_100us, delay_1ms, \
            delay_10ms, delay_100ms, delay_1s

    def timer_get_sec(self):
        # Get counter value from microblaze
        lsb_count = self.timer_get_cnt_val(2, 0)
        msb_count = self.timer_get_cnt_val(2, 1)
        # Postprocess counter value
        total_count = (msb_count << 32) ^ lsb_count
        time_sec = (0xFFFFFFFFFFFFFFFF-total_count)/1e8
        # Return time in second
        return time_sec
