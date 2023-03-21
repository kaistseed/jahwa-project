#*******************************************************************************
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 11/24/2022
# File Name             : pyiic.py                                       
# Library Dependency    :                                                           
#                                                                                
# Target Device         : PYNQ-Z1                                                     
# Tool Version          : Python >= 3.7                                          
#       
#*******************************************************************************

################################################
#              Import Libraries                #
################################################
import time
import cffi
import numpy as np
from dataclasses import dataclass
from typing import List
from enum import Enum

#############################################################################
#                             Define I2C Class                              #
#############################################################################
# Initiate C Foreign Function Interface
ffi = cffi.FFI()

# I2C driver class
class IIC:
    # Initialize class
    def __init__(self, master, prim_addr, sec_addr=None):
        self.master = master
        self.prim_addr = prim_addr
        self.sec_addr = sec_addr

    # I2C read method (16-bit address and data)
    def read_16bit(self, reg_addr):
        # Declare variables
        in_buffer = ffi.new("unsigned char[2]")
        out_buffer = ffi.new("unsigned char[2]")

        # Parse data into byte-chunks
        in_buffer[0] = (reg_addr >> 8) & 0xFF
        in_buffer[1] = reg_addr & 0xFF

        # Start I2C read sequence
        self.master.send(self.prim_addr, in_buffer, 2, 1)
        time.sleep(0.001)
        self.master.receive(self.prim_addr, out_buffer, 2)
        self.master.wait()
        
        # Clear interrupt register
        self.master.write(0x20, self.master.read(0x20))

        # Return value
        return out_buffer

    # I2C write method (16-bit address and data)
    def write_16bit(self, reg_addr, data):
        # Declare variables
        in_buffer = ffi.new("unsigned char[4]")

        # Parse address and data into byte chunks
        in_buffer[0] = (reg_addr >> 8) & 0xFF
        in_buffer[1] = reg_addr & 0xFF
        in_buffer[2] = (data >> 8) & 0xFF
        in_buffer[3] = data & 0xFF

        # Start I2C write sequence
        self.master.send(self.prim_addr, in_buffer, 4)

        # Clear interrupt register
        self.master.write(0x20, self.master.read(0x20))

    # I2C read method (32-bit address and data)
    def read_32bit(self, reg_addr):
        # Declare variables
        in_buffer = ffi.new("unsigned char[4]")
        out_buffer = ffi.new("unsigned char[4]")

         # Parse address into byte-chunks
        in_buffer[0] = (reg_addr >> 24) & 0xFF
        in_buffer[1] = (reg_addr >> 16) & 0xFF
        in_buffer[2] = (reg_addr >> 8) & 0xFF
        in_buffer[3] = reg_addr & 0xFF

        # Start I2C erad sequence
        # Write register address to secondary slave address
        if (self.sec_addr is not None):
            self.master.send(self.sec_addr, in_buffer, 4, 1)
            self.master.receive(self.sec_addr, out_buffer, 4)
        # Write register address to primary slave address if secondary slave address is not provided
        else:
            self.master.send(self.prim_addr, in_buffer, 4, 1)
            self.master.receive(self.prim_addr, out_buffer, 4)
        
#         self.master.receive(self.prim_addr, out_buffer, 4)
        self.master.wait()

        # Clear interrupt register
        self.master.write(0x20, self.master.read(0x20))

        # Return value
        return out_buffer

    # I2C write method (32-bit address and data)
    def write_32bit(self, reg_addr, data):
        # Declare variables
        in_buffer = ffi.new("unsigned char[8")

        # Parse address and data into byte chunks
        in_buffer[0] = (reg_addr >> 24) & 0xFF
        in_buffer[1] = (reg_addr >> 16) & 0xFF
        in_buffer[2] = (reg_addr >> 8) & 0xFF
        in_buffer[3] = reg_addr & 0xFF
        in_buffer[4] = (data >> 24) & 0xFF
        in_buffer[5] = (data >> 16) & 0xFF
        in_buffer[6] = (data >> 8) & 0xFF
        in_buffer[7] = data & 0xFF

        # Start I2C write sequence
        self.master.send(self.sec_addr, in_buffer, 8)

        # Clear interrupt register
        self.master.write(0x20, self.master.read(0x20))