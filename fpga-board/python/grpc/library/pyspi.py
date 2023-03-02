#*******************************************************************************
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 11/24/2022
# File Name             : pyspi.py                                           
#                                                                                
# Target Device         : PYNQ-Z1                                                     
# Tool Version          : Python >= 3.6                                         
#       
#*******************************************************************************

################################################
#              Import Libraries                #
################################################
import sys
import time
import cffi
import ctypes
import math
import numpy as np
from dataclasses import dataclass
from typing import List
from enum import Enum

#############################################################################
#                             Define SPI Class                              #
#############################################################################
# Initiate C Foreign Function Interface
ffi = cffi.FFI()

# SPI driver class
class SPI:
    # Initialize SPI class
    def __init__(self, master, cpol, cpha):
        # Instance of SPI master
        self.master = master

        # Set SPI mode
        self.spi_mode = 0 if (cpol == 0) else 1
        if (self.spi_mode == 0):
            self.master.write(0x60,0b00_00000110)
        else:
            self.master.write(0x60,0b00_00011110) 

    # SPI read method
    def spi_read(self, reg_addr, read_len, slave_num):
        """
            Method for reading from SPI slave
            -------------------------------------
            Parameters
            reg_addr: SPI slave register address 
            read_len: Number of bytes to be read
        """
        # Declare internal variable
        count = 0
        out_buffer = []
        slave_reg_addr = reg_addr
        
        # Set chip select to low (enable slave)
        slave_mask = ~(1 << slave_num)
        self.master.write(0x70,slave_mask)
            
        # Send command to slave
        while (count < read_len):
            # Reset AXI quad SPI RX FIFO
            if (self.spi_mode == 0):
                self.master.write(0x60,0b00_01100110)
                self.master.write(0x60,0b00_00000110)
            else:
                self.master.write(0x60,0b00_01111110)
                self.master.write(0x60,0b00_00011110)

            # Write data to master TX FIFO
            tx_data  = (slave_reg_addr | 0x80) << 8
            self.master.write(0x68,tx_data)

            # Read data from master RX FIFO
            rx_data = self.master.read(0x6C)
            
            # Append data to output buffer
            out_buffer.append(rx_data)
            
            # Increment counter and address
            count += 1
            slave_reg_addr += 1
        
        # Set chip select to high (disable slave)
        self.master.write(0x70,0b1111_1111)
        
        # Return value
        return out_buffer
    
    # SPI write method
    def spi_write(self, reg_addr, data, slave_num):
        """
            Method for writing to SPI slave
            -------------------------------------
            Parameters
            reg_addr: SPI slave register address
            data: Data to be written to SPI slave
        """
        # Set chip select to low (enable slave)
        slave_mask = ~(1 << slave_num)
        self.master.write(0x70,slave_mask)
        
        # Reset AXI quad SPI RX FIFO
        if (self.spi_mode == 0):
            self.master.write(0x60,0b00_01100110)
            self.master.write(0x60,0b00_00000110)
        else:
            self.master.write(0x60,0b00_01111110)
            self.master.write(0x60,0b00_00011110)
        
        # Write data to master TX FIFO
        tx_data  = (reg_addr << 8) | data
        self.master.write(0x68,tx_data)
        
        # Set chip select to high (disable slave)
        self.master.write(0x70,0b1111_1111)

    # Set bits position method
    def set_bits_pos(self, reg_data, data, bit_mask, mask_pos):
        """
            Method for writing new bit value to 
            register (bit-masking)
            -------------------------------------
            Parameters
            reg_data: Register data from slave
            data: Data to be written to register
            bit_mask: Bit mask
            mask_pos: Bit position of the data
        """
        # Set new register value
        reg_mask = (reg_data & ~(bit_mask)) | ((data << mask_pos) & bit_mask)
        return reg_mask

    # Get bits position method
    def get_bits_pos(self, reg_data, bit_mask, mask_pos):
        reg_mask = (reg_data & bit_mask) >> mask_pos
        return reg_mask    
    
    # Concatenate bytes method
    def concat_2_bytes(self, msb_data, lsb_data):
        """
            Method for combining two 1 byte data to 2 byte data
            -------------------------------------
            Parameters
            msb_data: 8 bit msb data
            lsb_data: 8 bit lsb data
        """
        result = (msb_data << 8) | lsb_data
        return result