##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/17/2023
# File Name             : spi.py                                           
#                                                                                
# Target Device         : FPGA                                      
# Tool Version          : Python >= 3.6                                          
#       
##############################################################################

##############################################################################
#                              Import Libraries                              #
##############################################################################
# Python library
import cffi
import time

##############################################################################
#                              Define SPI Class                              #
##############################################################################
# Initiate C Foreign Function Interface
ffi = cffi.FFI()

# SPI driver class
class SPI:
    ##########################################################################
    #                            SPI Basic Methods                           #
    ##########################################################################
    # Initialize SPI class
    def __init__(self, master, cpol, cpha, adc_io=None):
        # Instance of SPI master
        self.master = master

        # Set SPI mode
        self.spi_mode = 0 if (cpol == 0) else 1
        if (self.spi_mode == 0):
            self.master.write(0x60,0b00_00000110)
        else:
            self.master.write(0x60,0b00_00011110) 

        # Set ADC IO object (chip select)
        self.adc_io = adc_io

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
        self.master.write(0x70, slave_mask)
            
        # Send command to slave
        while (count < read_len):
            # Reset AXI quad SPI RX FIFO
            if (self.spi_mode == 0):
                self.master.write(0x60,0b00_11100110)
                self.master.write(0x60,0b00_10000110)
            else:
                self.master.write(0x60,0b00_11111110)
                self.master.write(0x60,0b00_10011110)

            # Write data to master TX FIFO
            tx_data  = (reg_addr)
            #print(tx_data)
            self.master.write(0x68,tx_data)

            # Read data from master RX FIFO
            rx_data = self.master.read(0x6C)
            
            # Append data to output buffer
            out_buffer.append(rx_data)
            
            # Increment counter and address
            count += 1
            #slave_reg_addr += 1
        
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
        self.master.write(0x70, slave_mask)
        
        # Reset AXI quad SPI RX FIFO
        if (self.spi_mode == 0):
            self.master.write(0x60,0b00_11100110)
            self.master.write(0x60,0b00_10000110)
        else:
            self.master.write(0x60,0b00_11111110)
            self.master.write(0x60,0b00_10011110)
        
        # Write data to master TX FIFO
        tx_data  = ((reg_addr) << 8) | data
        self.master.write(0x68,tx_data)
        
        # Set chip select to high (disable slave)
        self.master.write(0x70,0b1111_1111)
        
    def spi_send_bytes(self, data, read_len, slave_num):
        """
            Method for writing to SPI slave
            -------------------------------------
            Parameters
            reg_addr: SPI slave register address
            data: Data to be written to SPI slave
        """
        count = 0
        byte_num = 0
        # Set chip select to low (enable slave)
        slave_mask = ~(1 << slave_num)
        self.master.write(0x70, slave_mask)
        
        # Send command to slave
        while (count < read_len):
            # Reset AXI quad SPI RX FIFO
            if (self.spi_mode == 0):
                self.master.write(0x60,0b00_11100110)
                self.master.write(0x60,0b00_10000110)
            else:
                self.master.write(0x60,0b00_11111110)
                self.master.write(0x60,0b00_10011110)

            # Write data to master TX FIFO
            tx_data  = (data[byte_num + 1]<<8)|(data[byte_num] & 0xFF)
            self.master.write(0x68,tx_data)

            byte_num += 2
            count += 1
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
    
    ##########################################################################
    #                   Methods for Controlling DAC and ADC                  #
    ##########################################################################
    # Configure DAC channel 0 method
    def config_dac_ch_0(self, channel_code):
        # Print message
        print("Configuring DAC channel 0...")
        # Convert channel code from hex to integer
        ch0_code = int(channel_code, 16)
        # Set MSB and LSB
        MSB = (0x01 << 4) | ((ch0_code >> 8) & 0x0F)
        LSB = ch0_code & 0xFF
        # Write to DAC
        self.spi_write(MSB, LSB, 0)

    # Configure DAC channel 1 method
    def config_dac_ch_1(self, channel_code):
        # Print message
        print("Configuring DAC channel 1...")
        # Convert channel code from hex to integer
        ch1_code = int(channel_code, 16)
        # Set MSB and LSB
        MSB = (0x05 << 4) | ((ch1_code >> 8) & 0x0F)
        LSB = ch1_code & 0xFF
        # Write to DAC
        self.spi_write(MSB, LSB, 0)

    # Configure DAC channel 2 method
    def config_dac_ch_2(self, channel_code):
        # Print message
        print("Configuring DAC channel 2...")
        # Convert channel code from hex to integer
        ch2_code = int(channel_code, 16)
        # Set MSB and LSB
        MSB = (0x09 << 4) | ((ch2_code >> 8) & 0x0F)
        LSB = ch2_code & 0xFF
        # Write to DAC
        self.spi_write(MSB, LSB, 0)

    # Read ADC method
    def read_adc(self):
        # Check if ADC IO object is defined
        assert self.adc_io is not None, "ADC IO object is not defined!"

        # Print message
        print("Reading ADC...")

        # Declare internal variable
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

        # Initialize ADC
        self.spi_send_bytes(softspan_config, 2, 1)
        self.adc_io.write(0x1, 0x1)
        time.sleep(0.01)
        self.adc_io.write(0x0, 0x1)
        time.sleep(0.001)

        # Read ADC data
        buffer = self.spi_read(0xDBB6, num_of_trx, 1)

        # Parse ADC data
        for i in range(num_of_trx):
            halfword = buffer[i]
            raw_data[cnt] = halfword >> 8
            cnt += 1
            raw_data[cnt] = halfword & 0xFF
            cnt += 1

        # Convert raw data to ADC value
        for i in range(adc_channel):
            adc_value[i] = (raw_data[(i*3)] << 8) | (raw_data[(i*3)+1] & 0xFF)
            adc_id[i] = raw_data[(i*3)+2] >> 3
            adc_softspan[i] = raw_data[(i*3)+2] & 0x07
            adc_voltage[i] = ((adc_value[i])/65536.0) * 4.096

        # Return value
        return adc_value, adc_id, adc_voltage, adc_softspan