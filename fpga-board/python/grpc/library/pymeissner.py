#*******************************************************************************
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 11/24/2022
# File Name             : spi_master_burst.v                                           
# Library Dependency    : spi_master.v                                                          
#                                                                                
# Target Device         : PYNQ-Z1                                                     
# Tool Version          : Python >= 3.7                                          
#       
#*******************************************************************************

################################################
#              Import Libraries                #
################################################
import sys
import time
import cffi
import math
import ctypes
import asyncio
import numpy as np
from enum import Enum
from .pyiic import IIC
from typing import List
from dataclasses import dataclass

####################################################################
#              Define Constant and Struct Data Type                #
####################################################################
# I2C modes
I2C_SINGLE_MODE = 0
I2C_BURST_MODE  = 1

# Meissner I2C Address
MEISSNER_I2C_ADDR_16_BIT   = 0x74
MEISSNER_I2C_ADDR_32_BIT   = 0x77

# I2C memory read address
MEMORY_I2CREAD_ADDRESS  = 0x0E000000
MEMORY_I2CREAD0_ADDRESS = MEMORY_I2CREAD_ADDRESS + 0x00000000
MEMORY_I2CREAD1_ADDRESS = MEMORY_I2CREAD0_ADDRESS + 0x00c00000
MEMORY_I2CREAD2_ADDRESS = MEMORY_I2CREAD1_ADDRESS + 0x00c00000
MEMORY_I2CREAD3_ADDRESS = MEMORY_I2CREAD2_ADDRESS + 0x00c00000
MEMORY_I2CREAD4_ADDRESS = MEMORY_I2CREAD3_ADDRESS + 0x00c00000
MEMORY_I2CREAD5_ADDRESS = MEMORY_I2CREAD4_ADDRESS + 0x00c00000
MEMORY_I2CREAD6_ADDRESS = MEMORY_I2CREAD5_ADDRESS + 0x00c00000
MEMORY_I2CREAD7_ADDRESS = MEMORY_I2CREAD6_ADDRESS + 0x00c00000

# ADC memory read address
MEMORY_SPACE               = 0x01000000
MEMORY_ADC_RESULT_ADDRESS  = 0x14000000
MEMORY_ADC_RESULT_ADDRESS0 = MEMORY_ADC_RESULT_ADDRESS
MEMORY_ADC_RESULT_ADDRESS1 = MEMORY_ADC_RESULT_ADDRESS0 + MEMORY_SPACE
MEMORY_ADC_RESULT_ADDRESS2 = MEMORY_ADC_RESULT_ADDRESS1 + MEMORY_SPACE
MEMORY_ADC_RESULT_ADDRESS3 = MEMORY_ADC_RESULT_ADDRESS2 + MEMORY_SPACE
MEMORY_ADC_RESULT_ADDRESS4 = MEMORY_ADC_RESULT_ADDRESS3 + MEMORY_SPACE
MEMORY_ADC_RESULT_ADDRESS5 = MEMORY_ADC_RESULT_ADDRESS4 + MEMORY_SPACE
MEMORY_ADC_RESULT_ADDRESS6 = MEMORY_ADC_RESULT_ADDRESS5 + MEMORY_SPACE
MEMORY_ADC_RESULT_ADDRESS7 = MEMORY_ADC_RESULT_ADDRESS6 + MEMORY_SPACE

# stTestParam struct
@dataclass
class stTestParam:
    strLotID    : str
    strBarcodeID: str
    strSocketID : str
    strRecipeID : str
    strConfig   : str

# stTestProcedure struct
@dataclass
class stTestProcedure:
    strLotID            : str
    strBarcodeID        : str
    strSocketID         : str
    chTestType          : ctypes.c_ubyte
    nProcedureLen       : ctypes.c_uint
    nProcedurePosIndex  : ctypes.c_uint
    byProcedureData     : List[ctypes.c_byte]

# stTestData struct
@dataclass
class stTestData:
    szLotID         : List[ctypes.c_char]
    szBcdID         : List[ctypes.c_char]
    szSocketID      : List[ctypes.c_char]
    chTestType      : ctypes.c_ubyte
    nDataCount      : ctypes.c_uint
    dTimeStamp      : List[ctypes.c_double]
    dCurrentX       : List[ctypes.c_double]
    dCurrentY       : List[ctypes.c_double]
    dCurrentZ       : List[ctypes.c_double]
    dPositionX      : List[ctypes.c_double]
    dPositionY      : List[ctypes.c_double]
    dPositionZ      : List[ctypes.c_double]
    dTiltX          : List[ctypes.c_double]
    dTiltY          : List[ctypes.c_double]
    dRotation       : List[ctypes.c_double]
    dLaserPowerSum  : List[ctypes.c_double]

# stMonData struct
@dataclass
class stMonData:
    dTimeStamp      : ctypes.c_double
    dCurrentX       : ctypes.c_double
    dCurrentY       : ctypes.c_double
    dCurrentZ       : ctypes.c_double
    dPositionX      : ctypes.c_double
    dPositionY      : ctypes.c_double
    dPositionZ      : ctypes.c_double
    dTiltX          : ctypes.c_double
    dTiltY          : ctypes.c_double
    dRotation       : ctypes.c_double
    dLaserPowerSum  : ctypes.c_double

# stBoardAlarm struct
@dataclass
class stBoardAlarm:
    chAlarmStatus   : ctypes.c_ubyte
    chHeavyAlarm    : ctypes.c_ubyte
    nAlarmID        : ctypes.c_uint
    szAlarmText     : List[ctypes.c_char]

# stSPI2CWrite struct
@dataclass
class stSPI2CWrite:
    write_slave_address             : ctypes.c_int
    read_slave_address              : ctypes.c_int
    write_packet_size               : ctypes.c_int
    read_packet_size                : ctypes.c_int
    block_count                     : ctypes.c_int
    measure_count                   : ctypes.c_int
    write_interval_us               : ctypes.c_int
    measure_interval_us             : ctypes.c_int
    delay_from_write_to_measure_us  : ctypes.c_int
    write_buffer                    : List[ctypes.c_byte]

# stSPI2CRead struct
@dataclass
class stSPI2CRead:
    cReadBuffer     : List[ctypes.c_byte]       
    nGeminiX        : List[ctypes.c_double]         
    nGeminiY        : List[ctypes.c_double]         
    nGeminiZ        : List[ctypes.c_double]         
    nGnd            : List[ctypes.c_double]         
    nGeminiTx       : List[ctypes.c_double]        
    nGeminiTy       : List[ctypes.c_double]        
    nGeminiTLaser   : List[ctypes.c_double]        
    nGeminiZLaser   : List[ctypes.c_double]        
    nLdoCh0Current  : List[ctypes.c_double]       
    nLdoCh0Voltage  : List[ctypes.c_double]       
    nLdoCh1Current  : List[ctypes.c_double]       
    nLdoCh1Voltage  : List[ctypes.c_double]       
    nReservAnalog0  : List[ctypes.c_double]       
    nReservAnalog1  : List[ctypes.c_double]       
    nReservAnalog2  : List[ctypes.c_double]       
    nReservAnalog3  : List[ctypes.c_double]       

# _IniInfo struct
@dataclass
class _IniInfo:
    nWidth  : ctypes.c_uint 
    nHeight : ctypes.c_uint
    yOnly   : ctypes.c_ubyte # 0 for YONLY
    speed   : ctypes.c_ubyte # 8 for 0.8Gbps 16 for 1.62 Gbps, 27 for 2.7 Gbps, 54 for 5.4 Gbps
 
# INII2CTYPE enum
class INII2CTYPE(Enum):
    eWRITE = 0
    eREAD = 1
    eWAIT_US = 2
    eWAIT_MS = 3
    eLENGTH = 4
    ePATCH_START = 5
    ePATCH_END = 6
    eREAD_CURRENT = 7
    eBURST_START = 8
    eBURST_END = 9
    eBURST_EXE = 10

# _INII2CCMD struct
@dataclass
class _INII2CCMD:
    eReadWrite  : INII2CTYPE
    nSlaveAddr  : ctypes.c_uint
    nRegAddr    : List[ctypes.c_byte]
    nWriteData  : List[ctypes.c_byte]
    nWaitTime   : ctypes.c_uint
    nAddrLength : ctypes.c_uint
    nDataLength : ctypes.c_uint

# stTIMECNT struct
@dataclass
class stTIMECNT:
    year        : ctypes.c_byte
    day         : ctypes.c_byte
    month       : ctypes.c_byte
    hour        : ctypes.c_byte
    minute      : ctypes.c_byte
    seconds     : ctypes.c_byte
    reserve1    : ctypes.c_byte
    reserve2    : ctypes.c_byte

# stOMITGeminiStatus struct
@dataclass
class stOMITGeminiStatus:
    cBusy           : ctypes.c_ubyte
    cGO_NG_Tilt     : ctypes.c_ubyte
    cGO_NG_Height   : ctypes.c_ubyte
    cGO_NG_Position : ctypes.c_ubyte
    nXYCounter1     : ctypes.c_uint
    nXYCounter2     : ctypes.c_uint
    nXYCounter3     : ctypes.c_uint
    nTxTyCounter1   : ctypes.c_uint
    nTxTyCounter2   : ctypes.c_uint
    nTxTyCounter3   : ctypes.c_uint
    nZCounter1      : ctypes.c_uint
    nZCounter2      : ctypes.c_uint
    nZCounter3      : ctypes.c_uint

#############################################################################
#                          Define Helper Function                           #
#############################################################################
# Two's complement to decimal
def twos_to_dec(input, bits):
    # Convert binary to decimal
    value = int(input, 2) 
    # Return value
    return value - (1 << bits) if value & (1 << (bits - 1)) else value

#############################################################################
#                       Define Meissner Sensor Class                        #
#############################################################################
# Initiate C Foreign Function Interface
ffi = cffi.FFI()

class MeissnerI2C(IIC):
    def __init__(self, master, prim_addr, sec_addr=None, *args) -> None:
        """
        Class containing methods for accessing Meissner sensor
        -------------------------------------------------------
        Args:
            master (AXIIIC module): I2C master instance

        """      
        # Initialize sensor
        super().__init__(master, prim_addr, sec_addr)
        
        # Declare sensor variables
        self.driver_chipID = 0x0000
        self.driver_intTemp = 0
        self.driver_extTempVolt = 0
        self.driver_extTempAmp = 0
        self.driver_extTempRes = 0
        self.driver_vout_OIS_B1 = 0
        self.driver_vout_OIS_B2 = 0
        self.driver_vout_AF_B3 = 0
        self.driver_res_OIS_B1 = 0
        self.driver_res_OIS_B2 = 0
        self.driver_res_AF_B3 = 0

        # Declare variable for interrupt timer
        self.intr_timer_ip = args[0]
        self.intr_timer = args[1]

        # Declare async event for interrupt
        self.intr_event = asyncio.get_event_loop()

    # Define method for configuring interrupt timer
    async def intr_handler(self, timer):
        self.intr_timer_ip.register_map.TLR0 = timer
        self.intr_timer_ip.register_map.TCSR0.LOAD0 = 1
        self.intr_timer_ip.register_map.TCSR0.LOAD0 = 0
        self.intr_timer_ip.register_map.TCSR0.ENIT0 = 1
        self.intr_timer_ip.register_map.TCSR0.UDT0 = 1
        self.intr_timer_ip.register_map.TCSR0.ENT0 = 1
        intr_timer_start = time.perf_counter()
        await self.intr_timer.wait()
        intr_timer_stop = time.perf_counter()
        print("Interrupt time: {} us".format((intr_timer_stop-intr_timer_start)*1e6))
        self.intr_timer_ip.register_map.TCSR0.T0INT = 1

    # Reset sensor without exception
    def reset_sensor_single(self):
        # Define address and data
        write_addr = 0x000E
        read_addr = 0x0000
        data = 0x03C0

        # Write to register 0x000E
        self.write_16bit(write_addr, data)
        # Sleep for 500us
        print("Reset sensor interrupt (500 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(2e4))
        self.intr_event.run_until_complete(sleep_task)
        # Read from register 0x0000
        try:
            chip_id = self.read_16bit(read_addr)
        except:
            print("[I2C status] Read operation is failed due to chip reset. Retrying the operation!")
    
    # Reset sensor
    def reset_sensor(self):
        # Define address and data
        write_addr = 0x000E
        read_addr = 0x0000
        data = 0x03C0

        # Write to register 0x000E
        self.write_16bit(write_addr, data)
        # Sleep for 500us
        print("Reset sensor interrupt (500 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(2e4))
        self.intr_event.run_until_complete(sleep_task)
        # Read from register 0x0000
        try:
            chip_id = self.read_16bit(read_addr)
        except:
            print("[I2C status] Read operation is failed due to chip reset. Retrying the operation!")
            chip_id = self.read_16bit(read_addr)

    # Read chip ID
    def read_chip_id(self):
        # Define address
        rd_addr_1 = 0x0000
        # Start I2C sequence
        rd_data_1 = self.read_16bit(rd_addr_1)
        rd_data_1 = ffi.unpack(rd_data_1, 2)
        # Convert int to hex string
        for i in range(len(rd_data_1)):
            rd_data_1[i] = format(rd_data_1[i], '02x').upper()
        # Concat string and compare
        rd_data_1 = format(''.join(rd_data_1)).zfill(4)
        
        # Return chip ID
        return rd_data_1

    # Read device version
    def read_chip_ver(self):
        # Define address
        rd_addr_1 = 0x0001
        rd_addr_2 = 0x0002
        # Start I2C sequence
        rd_data_1 = self.read_16bit(rd_addr_1)
        rd_data_2 = self.read_16bit(rd_addr_2)
        # Convert FFI list into python list
        rd_data_1 = ffi.unpack(rd_data_1, 2)
        rd_data_2 = ffi.unpack(rd_data_2, 2)
        # Convert int to hex string
        for i in range(len(rd_data_1)):
            rd_data_1[i] = format(rd_data_1[i], '02x').upper()
            rd_data_2[i] = format(rd_data_2[i], '02x').upper()
        # Concat string and compare
        rd_data_1 = format(''.join(rd_data_1)).zfill(4)
        rd_data_2 = format(''.join(rd_data_2)).zfill(4)
        # Check chip version validity
        status = (rd_data_1 == "A620") and (rd_data_2[2:] == "A0")

        # assert rd_data_1 == "A620", f"Data read from register 0x0001 is not 0xA620, got: {rd_data_1}" // REVIEW: Do we need this assertion?
        # assert rd_data_2[2:] == "A0", f"Data read from register 0x0002[7:0] is not 0xA0, got: {rd_data_2[2:]}" // REVIEW: Do we need this assertion?

        # Return version
        return (rd_data_1, rd_data_2, status)

    # Read sensor unique ID
    def read_unique_id(self):
        # Define address
        rd_addr_1 = 0x40021048
        rd_addr_2 = 0x4002104C
        # Start I2C sequence
        rd_data_1 = self.read_32bit(rd_addr_1)
        rd_data_2 = self.read_32bit(rd_addr_2)
        # Convert FFI list into python list
        rd_data_1 = ffi.unpack(rd_data_1, 4)
        rd_data_2 = ffi.unpack(rd_data_2, 4)
        # Convert int to hex string
        for i in range(len(rd_data_1)):
            rd_data_1[i] = format(rd_data_1[i], '02x')
            rd_data_2[i] = format(rd_data_2[i], '02x')
        # Concat string and compare
        rd_data_1 = format(''.join(rd_data_1)).zfill(8)
        rd_data_2 = format(''.join(rd_data_2)).zfill(8)

        # Return unique ID
        return (rd_data_1, rd_data_2)
    
    # Initial sequence
    def init_config(self, test_conn=False):
        # Read chip ID
        chip_id = self.read_chip_id()
        print("[I2C operation] Reading chip ID: {}".format(chip_id))
        
        # Reset chip
        self.reset_sensor()
        print("[I2C operation] Reseting chip!")
        
        # Read chip version
        chip_version = self.read_chip_ver()
        print("[I2C operation] Reading chip version: {} {}".format(chip_version[0], chip_version[1]))
        
        # Define write address and data
        wr_addr_1 = 0x0009
        wr_data_1 = 0x8000
        # Write data to register 0x0009
        self.write_16bit(wr_addr_1, wr_data_1)

        # Group 0 sequence 0
        wr_iter_grp_0_0 = 11
        wr_addr_grp_0_0 = 0x0038
        wr_data_grp_0_0 = [
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0009, 0x0009, 0x0000, 0x0000, 
            0x0031, 0x0031, 0x003A
        ]
        # Write data to register
        for i in range(wr_iter_grp_0_0):
            self.write_16bit(wr_addr_grp_0_0, wr_data_grp_0_0[i])
            wr_addr_grp_0_0 += 1

        # Define write address and data
        wr_addr_2 = 0x004C
        wr_addr_3 = 0x004D
        wr_data_2 = 0x001F
        wr_data_3 = 0x2C2C
        # Write data to register 0x004C and 0x004D
        self.write_16bit(wr_addr_2, wr_data_2)
        self.write_16bit(wr_addr_3, wr_data_3)

        # Define write address and data
        wr_addr_4 = 0x0049
        wr_data_4 = 0x0601
        # Write data to register 0x0049
        self.write_16bit(wr_addr_4, wr_data_4)

        # Define write address and data
        wr_addr_5 = 0x0056
        wr_addr_6 = 0x0057
        wr_data_5 = 0x0010
        wr_data_6 = 0x0104
        # Write data to register 0x0056 and 0x0057
        self.write_16bit(wr_addr_5, wr_data_5)
        self.write_16bit(wr_addr_6, wr_data_6)

        # Define write address and data
        wr_iter_grp_0_1 = 8
        wr_addr_grp_0_1 = 0x0043
        wr_data_grp_0_1 = [
            0x0003, 0x4321, 0x0005, 0x0006, 
            0x0000, 0x0000, 0x00A3, 0x0000
        ]
        # Write data to register
        for i in range(wr_iter_grp_0_1):
            self.write_16bit(wr_addr_grp_0_1, wr_data_grp_0_1[i])
            wr_addr_grp_0_1 += 1

        # Define write address and data
        wr_iter_grp_0_2 = 8
        wr_addr_grp_0_2 = 0x004E
        wr_data_grp_0_2 = [
            0x0000, 0x0000, 0x0000, 0x000F, 
            0x58AE, 0x58AE, 0x589A, 0x0923
        ]
        # Write data to register
        for i in range(wr_iter_grp_0_2):
            self.write_16bit(wr_addr_grp_0_2, wr_data_grp_0_2[i])
            wr_addr_grp_0_2 += 1

        # Define write address and data
        wr_addr_7 = 0x0058
        wr_data_7 = 0x0000
        # Write data to register 0x0058
        self.write_16bit(wr_addr_7, wr_data_7)

        # Define write address and data
        wr_addr_8 = 0x005C
        # Set write data depending on the caller function name
        wr_data_8 = 0x0003 if test_conn else 0x0000 # NOTE: Value depends on connectivity test
        # Write data to register 0x005C
        self.write_16bit(wr_addr_8, wr_data_8)

        # Define write address and data
        wr_addr_9 = 0x0066
        wr_addr_10 = 0x0067
        wr_addr_11 = 0x0068
        wr_data_9 = 0x0000
        wr_data_10 = 0x0000
        wr_data_11 = 0x0000
        # Write data to register 0x0066, 0x0067, and 0x0068 
        self.write_16bit(wr_addr_9, wr_data_9)
        self.write_16bit(wr_addr_10, wr_data_10)
        self.write_16bit(wr_addr_11, wr_data_11)

        # Group 0 patch register sequence
        wr_iter_grp_0_otp = 10
        wr_addr_grp_0_otp = [
            0x0059, 0x005A, 0x005E, 0x005F, 
            0x0060, 0x0061, 0x0062, 0x0063, 
            0x0064, 0x0065
        ]
        wr_data_grp_0_otp = [
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000
        ]
        # Write data to register
        for i in range(wr_iter_grp_0_otp):
            self.write_16bit(wr_addr_grp_0_otp[i], wr_data_grp_0_otp[i])

        # Group 1 sequence
        wr_iter_grp_1 = 5
        wr_addr_grp_1 = [
            0x0032, 0x0033, 0x0034, 0x0036, 
            0x0037
        ]
        wr_data_grp_1 = [
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000
        ]
        # Write data to register
        for i in range(wr_iter_grp_1):
            self.write_16bit(wr_addr_grp_1[i], wr_data_grp_1[i])

        # Group 6 and debug sequence
        wr_iter_grp_6 = 8
        wr_addr_grp_6 = [
            0x000A, 0x000B, 0x01C2, 0x01C3, 
            0x01C4, 0x01C5, 0x01C6, 0x01C7
        ]
        wr_data_grp_6 = [
            0x0001, 0x0033, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000
        ]
        # Write data to register
        for i in range(wr_iter_grp_6):
            self.write_16bit(wr_addr_grp_6[i], wr_data_grp_6[i])

    # Configuration group 2 and 3
    def _config_group_2_3(self):
        # Group 2 configuration
        wr_iter_grp_2 = 12
        wr_addr_grp_2 = 0x0020
        wr_data_grp_2 = [
            0x0000, 0x0000, 0x0000, 0x0000,
            0x0600, 0x0000, 0x0000, 0x0000,
            0x08CC, 0x08CC, 0x0000, 0x0000
        ]
        # Write data to register
        for i in range(wr_iter_grp_2):
            self.write_16bit(wr_addr_grp_2, wr_data_grp_2[i])
            wr_addr_grp_2 += 1

        # Group 3 configuration
        wr_iter_grp_3 = 47
        wr_addr_grp_3 = 0x0070
        wr_data_grp_3 = [
            0x4000, 0x0000, 0x0000, 0x4000, 
            0x4000, 0x0000, 0x0000, 0xC000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000
        ]
        # Write data to register
        for i in range(wr_iter_grp_3):
            self.write_16bit(wr_addr_grp_3, wr_data_grp_3[i])
            wr_addr_grp_3 += 1

    # Configuration group 4 and 5
    def _config_group_4_5(self, test_conn=False):
        # Define write address and data
        wr_addr_0 = 0x00BF
        # Set write data depending on the caller function name
        wr_data_0 = 0x0000 if test_conn else 0x0001 # NOTE: Value depends on connectivity test
        # Write data to register 0x005C
        self.write_16bit(wr_addr_0, wr_data_0)

        # Group 4 configuration
        wr_iter_grp_4 = 71
        wr_addr_grp_4 = 0x00C0
        wr_data_grp_4 = [
            0x1122, 0x2108, 0xEC08, 
            0xA12C, 0x10E1, 0x0000, 0xDDB5, 
            0x91B8, 0x91B8, 0x00D2, 0x7D06, 
            0xDDB5, 0x00DC, 0x2000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x01E1, 
            0x0000, 0x0003, 0x0000, 0x19CD, 
            0xE781, 0x12AB, 0x0E0E, 0xCC1C, 
            0x01D7, 0xFE29, 0xBAE4, 0x4A67, 
            0x1B54, 0xE673, 0x0895, 0xC1C1, 
            0x00C1, 0xED85, 0xF76B, 0x0011, 
            0x0766, 0x3B24, 0x0F00, 0x000E, 
            0x001C, 0x000E, 0x8664, 0x39D3, 
            0x1000, 0x005A, 0x002B, 0x3949, 
            0x8432, 0x0330, 0x80FB, 0x0F0F, 
            0x0005, 0x0005, 0x0000, 0xC241, 
            0x1DCA, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x03FF, 0x000A
        ]
        # Write data to register
        for i in range(wr_iter_grp_4):
            self.write_16bit(wr_addr_grp_4, wr_data_grp_4[i])
            wr_addr_grp_4 += 1

        # Define write address and data
        wr_addr_1 = 0x0125
        # Set write data depending on the caller function name
        wr_data_1 = 0x0000 if test_conn else 0x1182 # NOTE: Value depends on connectivity test
        # Write data to register 0x005C
        self.write_16bit(wr_addr_1, wr_data_1)

        # Group 5 configuration
        wr_iter_grp_5 = 127
        wr_addr_grp_5 = 0x0126
        wr_data_grp_5 = [
            0x9DB2, 0x5375, 0x3B63, 
            0xD915, 0x01E1, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0002, 0x9DB2, 
            0x5375, 0x3B63, 0xD915, 0x01E1, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0002, 0x5375, 0x0000, 0x5375, 
            0x0000, 0x0E0E, 0x2000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x2000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0250, 0x0000, 0x3393, 0x0000, 
            0x1C4E, 0xE572, 0x09D4, 0x0E0E, 
            0xCC1C, 0x01EC, 0xFE14, 0xC311, 
            0x46E0, 0x312B, 0xD1CB, 0x0CC9, 
            0xC1C1, 0x0EC1, 0x0250, 0x0000, 
            0x3393, 0x0000, 0x1C4E, 0xE572, 
            0x09D4, 0x1C0E, 0xC1CC, 0x01EC, 
            0xFE14, 0xC311, 0x46E0, 0x312B, 
            0xD1CB, 0x0CC9, 0xC1C1, 0xF62C, 
            0xF338, 0xF62C, 0xF338, 0x1111, 
            0x08DA, 0x1932, 0x08DA, 0x1932, 
            0xFF00, 0x0008, 0x000F, 0x0008, 
            0x84BB, 0x3B64, 0x1000, 0x008F, 
            0x004F, 0x1000, 0x008F, 0x004F, 
            0x6DB7, 0x8C31, 0x0333, 0x802F, 
            0xF0F0, 0x6DB7, 0x8C31, 0x0333, 
            0x802F, 0xF0F0, 0x0001, 0x0001, 
            0x0000, 0xC45B, 0x1BAB, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x0000, 0x0000, 0x0000, 
            0x0000, 0x03FF, 0x03FF, 0x000F
        ]
        # Write data to register
        for i in range(wr_iter_grp_5):
            self.write_16bit(wr_addr_grp_5, wr_data_grp_5[i])
            wr_addr_grp_5 += 1
        
    # Standby to active sequence
    def stby_to_active(self, test_conn=False):
        # Read data from register 0x000C and 0x000D
        rd_data_1 = self.read_16bit(0x000C)
        rd_data_2 = self.read_16bit(0x000D)
        # Convert FFI list into python list
        rd_data_1 = ffi.unpack(rd_data_1, 2)
        rd_data_2 = ffi.unpack(rd_data_2, 2)
        # Convert int to hex string
        for i in range(len(rd_data_1)):
            rd_data_1[i] = format(rd_data_1[i], '02x')
            rd_data_2[i] = format(rd_data_2[i], '02x')
        # Concat string and compare
        rd_data_1 = format(''.join(rd_data_1)).zfill(4)
        rd_data_2 = format(''.join(rd_data_2)).zfill(4)
        # Check if data read from register 0x000C and 0x000D is 0x0000
        status = rd_data_1 == "0000" and rd_data_2 == "0000"

        # assert rd_data_1 == "0000", f"Data read from register 0x000C is not 0x0000, got: {rd_data_1}" // REVIEW: Do we need this assertion?
        # assert rd_data_2 == "0000", f"Data read from register 0x000D is not 0x0000, got: {rd_data_2}" // REVIEW: Do we need this assertion?

        # Define write address and data
        wr_addr_1 = 0x0006
        wr_addr_2 = 0x0007
        wr_data_1 = 0x03FF
        wr_data_2 = 0x0001
        # Write data to register
        self.write_16bit(wr_addr_1, wr_data_1)
        self.write_16bit(wr_addr_2, wr_data_2)

        # Wait for 10ms
        print("Standby to active interrupt (10000 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(1e6))
        self.intr_event.run_until_complete(sleep_task)

        # Read data from register 0x0009
        rd_data_3 = self.read_16bit(0x0009)
        # Convert FFI list into python list
        rd_data_3 = ffi.unpack(rd_data_3, 2)
        # Convert data from int to binary
        rd_data_3_bin = []
        for i in range(len(rd_data_3)):
            rd_data_3_bin.append(bin(rd_data_3[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Check the data validity by comparing data in binary form "11" means 0b11
        status = (
            status and
            rd_data_3_bin[1][0] == "1" and
            rd_data_3_bin[1][2] == "1" and
            rd_data_3_bin[1][4] == "1" and
            rd_data_3_bin[1][5] == "1" and
            rd_data_3_bin[1][6:] == "11"
        )

        # assert rd_data_3_bin[1][0] == "1", f"Data read from the register 0x0009[7] is not 0x1, got: {hex(int(rd_data_3_bin[1][0], 2))}, {rd_data_3_bin[1][0]}" // REVIEW: Do we need this assertion? 
        # assert rd_data_3_bin[1][2] == "1", f"Data read from the register 0x0009[5] is not 0x1, got: {hex(int(rd_data_3_bin[1][2], 2))}, {rd_data_3_bin[1][2]}" // REVIEW: Do we need this assertion?
        # assert rd_data_3_bin[1][4] == "1", f"Data read from the register 0x0009[3] is not 0x1, got: {hex(int(rd_data_3_bin[1][4], 2))}, {rd_data_3_bin[1][4]}" // REVIEW: Do we need this assertion?
        # assert rd_data_3_bin[1][5] == "1", f"Data read from the register 0x0009[2] is not 0x1, got: {hex(int(rd_data_3_bin[1][5], 2))}, {rd_data_3_bin[1][5]}" // REVIEW: Do we need this assertion?
        # assert rd_data_3_bin[1][6:] == "11", f"Data read from the register 0x0009[1:0] is not 0x3, got: {hex(int(rd_data_3_bin[1][6:], 2))}, {rd_data_3_bin[1][6:]}" // REVIEW: Do we need this assertion?
        
        # Convert int to hex string
        for i in range(len(rd_data_3)):
            rd_data_3[i] = format(rd_data_3[i], '02x')
        # Concat hex string and compare
        rd_data_3 = format(''.join(rd_data_3)).zfill(4)

        # Define write address and data
        wr_addr_3 = 0x0008
        wr_data_3 = 0x0001
        # Write data to register
        self.write_16bit(wr_addr_3, wr_data_3)

        # Read data from register 0x0009
        rd_data_4 = self.read_16bit(0x0009)
        # Convert FFI list into python list
        rd_data_4 = ffi.unpack(rd_data_4, 2)
        rd_data_4_bin = []
        for i in range(len(rd_data_4)):
            rd_data_4_bin.append(bin(rd_data_4[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Check the data
        assert rd_data_4_bin[1][3] == "1", f"Data read from the register 0x0009[4] is not 0x1, got: {hex(int(rd_data_4_bin[1][3], 2))}"
        # Convert int to hex string
        for i in range(len(rd_data_4)):
            rd_data_4[i] = format(rd_data_4[i], '02x')
        # Concat hex string and compare
        rd_data_4 = format(''.join(rd_data_4)).zfill(4)

        # Read data from register 0x000C and 0x000D
        rd_data_5 = self.read_16bit(0x000C)
        rd_data_6 = self.read_16bit(0x000D)
        # Convert FFI list into python list
        rd_data_5 = ffi.unpack(rd_data_5, 2)
        rd_data_6 = ffi.unpack(rd_data_6, 2)
        # Convert int to hex string
        for i in range(len(rd_data_5)):
            rd_data_5[i] = format(rd_data_5[i], '02x')
            rd_data_6[i] = format(rd_data_6[i], '02x')
        # Concat string and compare
        rd_data_5 = format(''.join(rd_data_5)).zfill(4)
        rd_data_6 = format(''.join(rd_data_6)).zfill(4)
        # Check data validity
        status = status and rd_data_5 == "0000" and rd_data_6 == "0000"

        # assert rd_data_5 == "0000", f"Data read from register 0x000C is not 0x0000, got: {rd_data_5}" // REVIEW: Do we need this assertion?
        # assert rd_data_6 == "0000", f"Data read from register 0x000D is not 0x0000, got: {rd_data_6}" // REVIEW: Do we need this assertion?

        # Write group 2 and 3 configuration sequence
        self._config_group_2_3()

        # Write group 4 and 5 configuration sequence
        self._config_group_4_5(test_conn)

        # Define write address and data
        wr_addr_4 = 0x0008
        wr_addr_5 = 0x0008
        wr_data_4 = 0x0000
        wr_data_5 = 0x0001
        # Write data to register
        self.write_16bit(wr_addr_4, wr_data_4)
        self.write_16bit(wr_addr_5, wr_data_5)
        
        # Return status
        return status

    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    #                Method for Testing Sensor Functionality                #
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
    # Basic I2C communication
    def test_i2c_comm(self):
        # Run init config sequence
        self.init_config(test_conn=True)
        # Run standby to active sequence
        stby_status = self.stby_to_active(test_conn=True)
        # Wait for 50ms
        print("Test I2C communication interrupt (50000 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(5e6))
        self.intr_event.run_until_complete(sleep_task)
        # Read chip ID
        driver_chipID = self.read_chip_id()
        
        # Print status
        print("[I2C operation] Testing I2C communication on chip with ID: {}".format(driver_chipID))
        # Return chip ID
        return (driver_chipID, stby_status)

    # Sensor temperature read
    def test_temp_read(self):
        # Run init config sequence
        self.init_config()
        # Run standby to active sequence
        stby_status = self.stby_to_active()
        # Wait for 50ms
        print("Test temperature read interrupt (50000 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(5e6))
        self.intr_event.run_until_complete(sleep_task)
        
        # Read data from sensor
        # Temperature (°C)
        rd_data_1 = self.read_16bit(0x0224)
        rd_data_1 = ffi.unpack(rd_data_1, 2)
        # Concat two 2 bytes data into integer
        driver_intTemp = (rd_data_1[0] << 8) + rd_data_1[1]
        driver_intTemp = (driver_intTemp * 0.0625) - 60
        # Voltage (mV)
        rd_data_2 = self.read_16bit(0x021B)
        rd_data_2 = ffi.unpack(rd_data_2, 2)
        # Concat two 2 bytes data into integer
        driver_extTempVolt = (rd_data_2[0] << 8) + rd_data_2[1]
        driver_extTempVolt = driver_extTempVolt * 0.25
        # Current (μA)
        rd_data_3 = self.read_16bit(0x021C)
        rd_data_3 = ffi.unpack(rd_data_3, 2)
        # Concat two 2 bytes data into integer
        driver_extTempAmp = (rd_data_3[0] << 8) + rd_data_3[1]
        driver_extTempAmp = driver_extTempAmp * 1.25
        # Resistance (kΩ)
        driver_extTempRes = driver_extTempVolt / driver_extTempAmp

        # Print status
        print("[I2C operation] Testing sensor operation.\nTemp: {}°C\nVoltage: {} mV\nCurrent: {} μA\nResistance: {} kΩ".format(
            driver_intTemp, driver_extTempVolt, driver_extTempAmp, driver_extTempRes)
        )
        # Return output
        return (driver_intTemp, driver_extTempVolt, driver_extTempAmp, driver_extTempRes, stby_status)

    # Output voltage and coil resistance test
    def test_output_voltage(self):
        # Run init config sequence
        self.init_config()
        # Define write address and data
        wr_addr_1 = 0x005C
        wr_data_1 = 0x0003
        # Write data to register
        self.write_16bit(wr_addr_1, wr_data_1)
        # Run standby to active sequence
        stby_status = self.stby_to_active()
        # Wait for 50ms
        print("Test output voltage interrupt (50000 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(5e6))
        self.intr_event.run_until_complete(sleep_task)

        # Define write address and data
        wr_addr_2 = 0x0032 # OIS_B1
        wr_addr_3 = 0x0033 # OIS_B2
        wr_addr_4 = 0x0034 # AF_B3
        wr_data_2 = 0x0200 # 100 mA
        wr_data_3 = 0x0200 # 100 mA
        wr_data_4 = 0x0200 # 100 mA
        # Write data to register
        self.write_16bit(wr_addr_2, wr_data_2)
        self.write_16bit(wr_addr_3, wr_data_3)
        self.write_16bit(wr_addr_4, wr_data_4)
        # Wait for 10ms
        print("Test output voltage interrupt (10000 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(1e6))
        self.intr_event.run_until_complete(sleep_task)

        # Read data from sensor
        # Sample 5 data and average
        driver_vout_OIS_B1=0
        driver_vout_OIS_B2=0
        driver_vout_AF_B3=0
        for i in range(5):
            # OIS_B1 voltage (V)
            rd_data_1 = self.read_16bit(0x0286)
            rd_data_1 = ffi.unpack(rd_data_1, 2)
            # Concat two 2 bytes data into integer
            driver_vout_OIS_B1_temp = ((rd_data_1[0] << 8) + rd_data_1[1]) * 2052e-6
            driver_vout_OIS_B1 += driver_vout_OIS_B1_temp 
            # OIS_B2 voltage (V)
            rd_data_2 = self.read_16bit(0x0287)
            rd_data_2 = ffi.unpack(rd_data_2, 2)
            # Concat two 2 bytes data into integer
            driver_vout_OIS_B2_temp = ((rd_data_2[0] << 8) + rd_data_2[1]) * 2052e-6
            driver_vout_OIS_B2 += driver_vout_OIS_B2_temp 
            # AF_B3 voltage (V)
            rd_data_3 = self.read_16bit(0x0288)
            rd_data_3 = ffi.unpack(rd_data_3, 2)
            # Concat two 2 bytes data into integer
            driver_vout_AF_B3_temp = ((rd_data_3[0] << 8) + rd_data_3[1]) * 2052e-6
            driver_vout_AF_B3 += driver_vout_AF_B3_temp 
        # Average sample
        driver_vout_OIS_B1 /= 5
        driver_vout_OIS_B2 /= 5
        driver_vout_AF_B3 /= 5

        # Calculate coil resistance
        driver_res_OIS_B1 = driver_vout_OIS_B1 / ((512 / 1023) * 200e-3)
        driver_res_OIS_B2 = driver_vout_OIS_B2 / ((512 / 1023) * 200e-3)
        driver_res_AF_B3 = driver_vout_AF_B3 / ((512 / 1023) * 200e-3)

        # Define write address and data
        wr_addr_5 = 0x0032 # OIS_B1
        wr_addr_6 = 0x0033 # OIS_B2
        wr_addr_7 = 0x0034 # AF_B3
        wr_data_5 = 0x0000 # 0 mA
        wr_data_6 = 0x0000 # 0 mA
        wr_data_7 = 0x0000 # 0 mA
        # Write data to register
        self.write_16bit(wr_addr_5, wr_data_5)
        self.write_16bit(wr_addr_6, wr_data_6)
        self.write_16bit(wr_addr_7, wr_data_7)

        # Print status
        print("[I2C operation] Testing sensor operation.\nOIS_B1 vout: {} V\nOIS_B2 vout: {} V\nAF_B3 vout: {} V\nOIS_B1 resistance: {} Ω\
            \nOIS_B2 resistance: {} Ω\nAF_B3 resistance: {} Ω".format(
            driver_vout_OIS_B1, driver_vout_OIS_B2, driver_vout_AF_B3, driver_res_OIS_B1, driver_res_OIS_B2, driver_res_AF_B3)
        )
        # Return output
        return (driver_vout_OIS_B1, driver_vout_OIS_B2, driver_vout_AF_B3, driver_res_OIS_B1, driver_res_OIS_B2, driver_res_AF_B3, stby_status)

    # Power supply voltage at sensor pins
    def test_supply_sensor_voltage(self):
        # Run init config sequence
        self.init_config()
        # Run standby to active sequence
        stby_status = self.stby_to_active()

        # Define write address and data
        wr_addr_1 = 0x0032 # OIS_B1
        wr_addr_2 = 0x0033 # OIS_B2
        wr_addr_3 = 0x0034 # AF_B3
        wr_data_1 = 0x0200 # 100 mA
        wr_data_2 = 0x0200 # 100 mA
        wr_data_3 = 0x0200 # 100 mA
        # Write data to register
        self.write_16bit(wr_addr_1, wr_data_1)
        self.write_16bit(wr_addr_2, wr_data_2)
        self.write_16bit(wr_addr_3, wr_data_3)
        # Wait for 50ms
        print("Test supply sensor voltage interrupt (50000 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(5e6))
        self.intr_event.run_until_complete(sleep_task)

        # OIS_B1 voltage (V)
        rd_data_1 = self.read_16bit(0x022E)
        rd_data_1 = ffi.unpack(rd_data_1, 2)
        # Concat two 2 bytes data into integer
        driver_vin_VDDA = ((rd_data_1[0] << 8) + rd_data_1[1]) * 684e-6
        # OIS_B2 voltage (V)
        rd_data_2 = self.read_16bit(0x022F)
        rd_data_2 = ffi.unpack(rd_data_2, 2)
        # Concat two 2 bytes data into integer
        driver_vin_VDDP_AF = ((rd_data_2[0] << 8) + rd_data_2[1]) * 2052e-6
        # AF_B3 voltage (V)
        rd_data_3 = self.read_16bit(0x0230)
        rd_data_3 = ffi.unpack(rd_data_3, 2)
        # Concat two 2 bytes data into integer
        driver_vin_VDDP_OIS = ((rd_data_3[0] << 8) + rd_data_3[1]) * 2052e-6

        # Print status
        print("[I2C operation] Testing sensor operation.\nVDDA: {} V\nVDDP_AF: {} V\nVDDP_OIS: {} V".format(
            driver_vin_VDDA, driver_vin_VDDP_AF, driver_vin_VDDP_OIS)
        )
        # Return output
        return (driver_vin_VDDA, driver_vin_VDDP_AF, driver_vin_VDDP_OIS, stby_status)
    
    # AFE sensor connectivity test
    def test_afe_sensor_conn(self):
        # Run init config sequence
        self.init_config()
        # Define write address and data
        wr_addr_1 = 0x005C
        wr_data_1 = 0x0003
        # Write data to register
        self.write_16bit(wr_addr_1, wr_data_1)
        # Run standby to active sequence
        stby_status = self.stby_to_active()
        # Wait for 50ms
        print("Test AFE sensor connection interrupt (50000 us)")
        sleep_task = self.intr_event.create_task(self.intr_handler(5e6))
        self.intr_event.run_until_complete(sleep_task)

        ############################# Part 1 #############################
        # Capture voltage at top of sensor bridge
        # AFE top S1 voltage (V)
        rd_data_1 = self.read_16bit(0x0228)
        rd_data_1 = ffi.unpack(rd_data_1, 2)
        # Concat two 2 bytes data into integer
        driver_afe_top_s1 = ((rd_data_1[0] << 8) + rd_data_1[1]) * 684e-6
        # AFE top S2 voltage (V)
        rd_data_2 = self.read_16bit(0x0229)
        rd_data_2 = ffi.unpack(rd_data_2, 2)
        # Concat two 2 bytes data into integer
        driver_afe_top_s2 = ((rd_data_2[0] << 8) + rd_data_2[1]) * 684e-6
        # AFE top Z1 voltage (V)
        rd_data_3 = self.read_16bit(0x022D)
        rd_data_3 = ffi.unpack(rd_data_3, 2)
        # Concat two 2 bytes data into integer
        driver_afe_top_z1 = ((rd_data_3[0] << 8) + rd_data_3[1]) * 684e-6

        # Capture voltage at positive side terminal
        # AFE top S1 voltage (V)
        rd_data_4 = self.read_16bit(0x022A)
        rd_data_4 = ffi.unpack(rd_data_4, 2)
        # Concat two 2 bytes data into integer
        driver_afe_p_s1 = ((rd_data_4[0] << 8) + rd_data_4[1]) * 342e-6
        # AFE top S2 voltage (V)
        rd_data_5 = self.read_16bit(0x022B)
        rd_data_5 = ffi.unpack(rd_data_5, 2)
        # Concat two 2 bytes data into integer
        driver_afe_p_s2 = ((rd_data_5[0] << 8) + rd_data_5[1]) * 342e-6
        # AFE top Z1 voltage (V)
        rd_data_6 = self.read_16bit(0x022C)
        rd_data_6 = ffi.unpack(rd_data_6, 2)
        # Concat two 2 bytes data into integer
        driver_afe_p_z1 = ((rd_data_6[0] << 8) + rd_data_6[1]) * 342e-6

        # AFE S1 (V)
        rd_data_7 = self.read_16bit(0x01CF)
        rd_data_7 = ffi.unpack(rd_data_7, 2)
        # Convert data from int to binary
        rd_data_7_bin = []
        for i in range(len(rd_data_7)):
            rd_data_7_bin.append(bin(rd_data_7[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Concat bit string and compare
        rd_data_7_bin = format(''.join(rd_data_7_bin))
        # Calculate S1_DIFF voltage
        S1_DIFF_VOLT = twos_to_dec(rd_data_7_bin[4:], 12) * (1.4 / 2048) / 2.807
        driver_afe_n_s1 = driver_afe_p_s1 - S1_DIFF_VOLT

        # AFE S2 (V)
        rd_data_8 = self.read_16bit(0x01D0)
        rd_data_8 = ffi.unpack(rd_data_8, 2)
        # Convert data from int to binary
        rd_data_8_bin = []
        for i in range(len(rd_data_8)):
            rd_data_8_bin.append(bin(rd_data_8[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Concat bit string and compare
        rd_data_8_bin = format(''.join(rd_data_8_bin))
        # Calculate S1_DIFF voltage
        S2_DIFF_VOLT = twos_to_dec(rd_data_8_bin[4:], 12) * (1.4 / 2048) / 2.807
        driver_afe_n_s2 = driver_afe_p_s2 - S2_DIFF_VOLT

        # AFE Z1 (V)
        rd_data_9 = self.read_16bit(0x01D1)
        rd_data_9 = ffi.unpack(rd_data_9, 2)
        # Convert data from int to binary
        rd_data_9_bin = []
        for i in range(len(rd_data_9)):
            rd_data_9_bin.append(bin(rd_data_9[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Concat bit string and compare
        rd_data_9_bin = format(''.join(rd_data_9_bin))
        # Calculate S1_DIFF voltage
        Z1_DIFF_VOLT = twos_to_dec(rd_data_9_bin[4:], 12) * (1.4 / 2048) / 2.807
        driver_afe_n_z1 = driver_afe_p_z1 - Z1_DIFF_VOLT

        ############################# Part 2 #############################
        # Reduce sensor bias current by 25%
        # Define write address and data
        wr_addr_2 = 0x0040
        wr_addr_3 = 0x0041
        wr_addr_4 = 0x0042
        wr_addr_5 = 0x0040
        wr_addr_6 = 0x0041
        wr_addr_7 = 0x0042
        wr_data_2 = 0x0025
        wr_data_3 = 0x0025
        wr_data_4 = 0x002A
        wr_data_5 = 0x002A
        wr_data_6 = 0x002A
        wr_data_7 = 0x0039

        # Write data to register
        self.write_16bit(wr_addr_2, wr_data_2)
        self.write_16bit(wr_addr_3, wr_data_3)
        self.write_16bit(wr_addr_4, wr_data_4)
        self.write_16bit(wr_addr_5, wr_data_5) # REVIEW: How to check whether the sensor is HALL or TMR?
        self.write_16bit(wr_addr_6, wr_data_6) # REVIEW: How to check whether the sensor is HALL or TMR?
        self.write_16bit(wr_addr_7, wr_data_7) # REVIEW: How to check whether the sensor is HALL or TMR?

        # Capture voltage at positive side terminal
        # AFE top S1 voltage (V)
        rd_data_10 = self.read_16bit(0x022A)
        rd_data_10 = ffi.unpack(rd_data_10, 2)
        # Concat two 2 bytes data into integer
        driver_afe_p_s1_inc = ((rd_data_10[0] << 8) + rd_data_10[1]) * 342e-6
        # AFE top S2 voltage (V)
        rd_data_11 = self.read_16bit(0x022B)
        rd_data_11 = ffi.unpack(rd_data_11, 2)
        # Concat two 2 bytes data into integer
        driver_afe_p_s2_inc = ((rd_data_11[0] << 8) + rd_data_11[1]) * 342e-6
        # AFE top Z1 voltage (V)
        rd_data_12 = self.read_16bit(0x022C)
        rd_data_12 = ffi.unpack(rd_data_12, 2)
        # Concat two 2 bytes data into integer
        driver_afe_p_z1_inc = ((rd_data_12[0] << 8) + rd_data_12[1]) * 342e-6

        # AFE S1 (V)
        rd_data_13 = self.read_16bit(0x01CF)
        rd_data_13 = ffi.unpack(rd_data_13, 2)
        # Convert data from int to binary
        rd_data_13_bin = []
        for i in range(len(rd_data_13)):
            rd_data_13_bin.append(bin(rd_data_13[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Concat bit string and compare
        rd_data_13_bin = format(''.join(rd_data_13_bin))
        # Calculate S1_DIFF voltage
        S1_DIFF_VOLT = twos_to_dec(rd_data_13_bin[4:], 12) * (1.4 / 2048) / 2.807
        driver_afe_n_s1_inc = driver_afe_p_s1_inc - S1_DIFF_VOLT

        # AFE S2 (V)
        rd_data_14 = self.read_16bit(0x01D0)
        rd_data_14 = ffi.unpack(rd_data_14, 2)
        # Convert data from int to binary
        rd_data_14_bin = []
        for i in range(len(rd_data_14)):
            rd_data_14_bin.append(bin(rd_data_14[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Concat bit string and compare
        rd_data_14_bin = format(''.join(rd_data_14_bin))
        # Calculate S1_DIFF voltage
        S2_DIFF_VOLT = twos_to_dec(rd_data_14_bin[4:], 12) * (1.4 / 2048) / 2.807
        driver_afe_n_s2_inc = driver_afe_p_s2_inc - S2_DIFF_VOLT

        # AFE Z1 (V)
        rd_data_15 = self.read_16bit(0x01D1)
        rd_data_15 = ffi.unpack(rd_data_15, 2)
        # Convert data from int to binary
        rd_data_15_bin = []
        for i in range(len(rd_data_15)):
            rd_data_15_bin.append(bin(rd_data_15[i])[2:].zfill(8)) # Remove the '0b' string and append with 0
        # Concat bit string and compare
        rd_data_15_bin = format(''.join(rd_data_15_bin))
        # Calculate S1_DIFF voltage
        Z1_DIFF_VOLT = twos_to_dec(rd_data_15_bin[4:], 12) * (1.4 / 2048) / 2.807
        driver_afe_n_z1_inc = driver_afe_p_z1_inc - Z1_DIFF_VOLT

        ############################# Part 3 #############################
        sense_open_s1_p = driver_afe_p_s1_inc / driver_afe_p_s1
        sense_open_s2_p = driver_afe_p_s2_inc / driver_afe_p_s2
        sense_open_z1_p = driver_afe_p_z1_inc / driver_afe_p_z1

        sense_open_s1_n = driver_afe_n_s1_inc / driver_afe_n_s1
        sense_open_s2_n = driver_afe_n_s2_inc / driver_afe_n_s2
        sense_open_z1_n = driver_afe_n_z1_inc / driver_afe_n_z1

        # Print status
        print("[I2C operation] Testing sensor operation.\nsense open s1 p: {}\nsense open s2 p: {}\nsense open z1 p: {}\n\
            sense open s1 n: {}\nsense open s2 n: {}\nsense open z1 n: {}\n".format(
            sense_open_s1_p, sense_open_s2_p, sense_open_z1_p, sense_open_s1_n, sense_open_s2_n, sense_open_z1_n)
        )
        # Return output
        return (sense_open_s1_p, sense_open_s1_n, sense_open_s2_p, sense_open_s2_n, sense_open_z1_p, sense_open_z1_n, stby_status)

    # Low VDDP I2C test
    def test_low_vddp_i2c(self):
        # Wait for 10ms
        sleep_task = self.intr_event.create_task(self.intr_handler(1e6))
        self.intr_event.run_until_complete(sleep_task)

        # Define address
        rd_addr_1 = 0x0000
        # Start I2C sequence
        rd_data_1 = self.read_16bit(rd_addr_1)
        # Convert FFI list into python list
        rd_data_1 = ffi.unpack(rd_data_1, 2)
        # Convert int to hex string
        for i in range(len(rd_data_1)):
            rd_data_1[i] = format(rd_data_1[i], '02x')
        # Concat string
        rd_data_1 = format(''.join(rd_data_1)).zfill(4)

        # Define address
        rd_addr_2 = 0x0000
        rd_addr_3 = 0x0001
        rd_addr_4 = 0x0002
        # Start I2C sequence
        rd_data_2 = self.read_16bit(rd_addr_2)
        rd_data_3 = self.read_16bit(rd_addr_3)
        rd_data_4 = self.read_16bit(rd_addr_4)
        # Convert FFI list into python list
        rd_data_2 = ffi.unpack(rd_data_2, 2)
        rd_data_3 = ffi.unpack(rd_data_3, 2)
        rd_data_4 = ffi.unpack(rd_data_4, 2)
        # Convert int to hex string
        for i in range(len(rd_data_2)):
            rd_data_2[i] = format(rd_data_2[i], '02x')
            rd_data_3[i] = format(rd_data_3[i], '02x')
            rd_data_4[i] = format(rd_data_4[i], '02x')
        # Concat string
        rd_data_2 = format(''.join(rd_data_2)).zfill(4)
        rd_data_3 = format(''.join(rd_data_3)).zfill(4)
        rd_data_4 = format(''.join(rd_data_4)).zfill(4)