/******************************************************************************
 *
 *
 * @file meissner.c
 *
 * This file contains high-level functions for doing I2C transactions.
 * The functions in this file are designed to be used with the Meissner sensor.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who   Date     Changes
 * ----- ----- ------- -----------------------------------------------
 * 1.00  Dalta 05/29/23 release
 * 2.00  Dalta 06/05/23 refactor
 *
 * </pre>
 *
 *****************************************************************************/
/***************************** Include Files *********************************/
// User-defined library
#include "meissner.h"

/*****************************************************************************/
/*                        Helper Function Definitions                        */
/*****************************************************************************/
/******************************************************************************
*
* Parse 2-byte data to 1-byte data array.
*
* @param	data is the 2-byte data to be parsed
* @param    data_array is the 1-byte data array to store the parsed data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void parse_2_byte_data(uint16_t data, uint8_t *data_array) {
    // Declare local variable
    uint8_t temp[2];

    // Parse 2-byte data to 1-byte data array
    temp[0] = (uint8_t)(data>>8);
    temp[1] = (uint8_t)(data);
    data_array[0] = temp[0];
    data_array[1] = temp[1];
}

/******************************************************************************
*
* Parse 4-byte data to 1-byte data array.
*
* @param	data is the 4-byte data to be parsed
* @param    data_array is the 1-byte data array to store the parsed data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void parse_4_byte_data(uint32_t data, uint8_t *data_array) {
    // Declare local variable
    uint8_t temp[4];

    // Parse 4-byte data to 1-byte data array
    temp[0] = (uint8_t)(data>>24);
    temp[1] = (uint8_t)(data>>16);
    temp[2] = (uint8_t)(data>>8);
    temp[3] = (uint8_t)(data);
    data_array[0] = temp[0];
    data_array[1] = temp[1];
    data_array[2] = temp[2];
    data_array[3] = temp[3];
}
/*****************************************************************************/

/*****************************************************************************/
/*                      I2C API Function Declarations                        */
/*****************************************************************************/
/******************************************************************************
*
* Initialize I2C device.
*
* @param	dev_num is the device number of the I2C device
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_init(int dev_num) {
    device = i2c_open_device(dev_num);
}

/***************** 1-byte Register Address I2C Operations ********************/
/******************************************************************************
*
* Perform I2C 1-byte read transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bytes read
*
* @note		None
*
******************************************************************************/
int i2c_reg1_read_byte(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data) {
    i2c_write(device, dev_addr, &reg_addr, 1);
    i2c_read(device, dev_addr, data, 1);
    return 1;
}

/******************************************************************************
*
* Perform I2C arbitrary byte read transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    length is the number of bytes to read
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bytes read
*
* @note		None
*
******************************************************************************/
int i2c_reg1_read_bytes(uint8_t dev_addr, uint8_t reg_addr, uint8_t length, uint8_t *data) {
    i2c_write(device, dev_addr, &reg_addr, 1);
    i2c_read(device, dev_addr, data, length);
    return length;
}

/******************************************************************************
*
* Perform I2C 1-byte write transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg1_write_byte(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data) {
    uint8_t temp[2];
    temp[0] = reg_addr;
    temp[1] = *data;
    i2c_write(device, dev_addr, temp, 2);
}

/******************************************************************************
*
* Perform I2C arbitrary byte write transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    length is the number of bytes to write
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg1_write_bytes(uint8_t dev_addr, uint8_t reg_addr, uint8_t length, uint8_t *data) {
    int i;
    int len_total = (int)length+1;
    uint8_t temp[len_total];
    temp[0] = reg_addr;
    for (i=1;i<len_total;i++){
        temp[i]=data[i-1];
    }
    i2c_write(device, dev_addr, temp, len_total);
}

/******************************************************************************
*
* Perform I2C 1-bit read transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    bit_start is the bit position to start reading (0-7)
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bits read
*
* @note		None
*
******************************************************************************/
int8_t i2c_reg1_read_bit(uint8_t dev_addr, uint8_t reg_addr, 
                        uint8_t bit_start, uint8_t *data) {
    return i2c_reg1_read_bits(dev_addr, reg_addr, bit_start, (uint8_t) 1, data);
}

/******************************************************************************
*
* Perform I2C arbitrary bit read transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    bit_start is the bit position to start reading (0-7)
* @param    length is the number of bits to read
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bits read
*
* @note		None
*
******************************************************************************/
int8_t i2c_reg1_read_bits(uint8_t dev_addr, uint8_t reg_addr, 
                        uint8_t bit_start, uint8_t length, uint8_t *data) {
    /*
     * 01101001 read byte
     * 76543210 bit numbers
     *    xxx   parameters: bitStart=4, length=3
     *    010   masked
     *   -> 010 shifted
     */
    uint8_t count, b;
    uint8_t mask;
    if ((count = i2c_reg1_read_bytes(dev_addr, reg_addr, 1, &b)) != 0) {
        mask = ((1 << length) - 1) << (bit_start - length + 1);
        b &= mask;
        b >>= (bit_start - length + 1);
        *data = b;
    }
    return count;
}

/******************************************************************************
*
* Perform I2C 1-bit write transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    bit_start is the bit position to start writing (0-7)
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg1_write_bit(uint8_t dev_addr, uint8_t reg_addr, 
                        uint8_t bit_start, uint8_t data) {
    i2c_reg1_write_bits(dev_addr, reg_addr, bit_start, (uint8_t) 1, data);
}

/******************************************************************************
*
* Perform I2C arbitrary bit write transaction with 1-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    bit_start is the bit position to start writing (0-7)
* @param    length is the number of bits to write
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg1_write_bits(uint8_t dev_addr, uint8_t reg_addr,
                        uint8_t bit_start, uint8_t length, uint8_t data) {
    /*
     * 010 value to write
     * 76543210 bit numbers
     *    xxx   parameters: bitStart=4, width=3
     * 00011100 mask byte
     * 10101111 original value (sample)
     * 10100011 original & ~mask
     * 10101011 masked | value
     */
    uint8_t b, temp;
    temp = data;
    if (i2c_reg1_read_bytes(dev_addr, reg_addr, 1, &b) != 0) {
        uint8_t mask = ((1 << length) - 1) << (bit_start - length + 1);
        // shift data into correct position
        temp <<= (bit_start - length + 1);
        // zero all non-important bits in data
        temp &= mask;
        // zero all important bits in existing byte
        b &= ~(mask);
        // combine data with existing byte
        b |= temp;
        i2c_reg1_write_byte(dev_addr, reg_addr, &b);
    }
}

/***************** 2-byte Register Address I2C Operations ********************/
/******************************************************************************
*
* Perform I2C 1-byte read transaction with 2-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bytes read
*
* @note		None
*
******************************************************************************/
int i2c_reg2_read_byte(uint8_t dev_addr, uint16_t reg_addr, uint8_t *data) {
    return i2c_reg2_read_bytes(dev_addr, reg_addr, 1, data);
}

/******************************************************************************
*
* Perform I2C arbitrary byte read transaction with 2-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bytes read
*
* @note		None
*
******************************************************************************/
int i2c_reg2_read_bytes(uint8_t dev_addr, uint16_t reg_addr, uint8_t length, uint8_t *data) {
    uint8_t temp[2];
    temp[0] = (uint8_t)(reg_addr>>8);
    temp[1] = (uint8_t)(reg_addr);
    i2c_write(device, dev_addr, temp, 2);
    i2c_read(device, dev_addr, data, length);
    return length;
}

/******************************************************************************
*
* Perform I2C 1-byte write transaction with 2-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg2_write_byte(uint8_t devAddr, uint16_t regAddr, uint8_t *data) {
    i2c_reg2_write_bytes(devAddr, regAddr, 1, data);
}

/******************************************************************************
*
* Perform I2C 1-byte write transaction with 2-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    length is the number of bytes to write
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg2_write_bytes(uint8_t dev_addr, uint16_t reg_addr, uint8_t length, uint8_t *data) {
    int i;
    int len_total = (int)length+2;
    uint8_t temp[len_total];
    temp[0] = (uint8_t)(reg_addr>>8);
    temp[1] = (uint8_t)(reg_addr);
    for (i=2;i<len_total;i++){
        temp[i]=data[i-2];
    }
    i2c_write(device, dev_addr, temp, len_total);
}

/***************** 4-byte Register Address I2C Operations ********************/
/******************************************************************************
*
* Perform I2C 1-byte read transaction with 4-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bytes read
*
* @note		None
*
******************************************************************************/
int i2c_reg4_read_byte(uint8_t dev_addr, uint32_t reg_addr, uint8_t *data) {
    return i2c_reg4_read_bytes(dev_addr, reg_addr, 1, data);
}

/******************************************************************************
*
* Perform I2C arbitrary byte read transaction with 4-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the read data
*
* @return	number of bytes read
*
* @note		None
*
******************************************************************************/
int i2c_reg4_read_bytes(uint8_t dev_addr, uint32_t reg_addr, uint8_t length, uint8_t *data) {
    uint8_t temp[4];
    temp[0] = (uint8_t)(reg_addr>>24);
    temp[1] = (uint8_t)(reg_addr>>16);
    temp[2] = (uint8_t)(reg_addr>>8);
    temp[3] = (uint8_t)(reg_addr);
    i2c_write(device, dev_addr, temp, 4);
    i2c_read(device, dev_addr, data, length);
    return length;
}

/******************************************************************************
*
* Perform I2C 1-byte write transaction with 4-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg4_write_byte(uint8_t dev_addr, uint32_t reg_addr, uint8_t *data) {
    i2c_reg4_write_bytes(dev_addr, reg_addr, 1, data);
}

/******************************************************************************
*
* Perform I2C arbitrary byte write transaction with 4-byte register address. 
* The data is stored in a 1-byte data array. 
*
* @param	dev_addr is the device address of the I2C device
* @param    reg_addr is the register address of the I2C device
* @param    length is the number of bytes to write
* @param    data is the 1-byte data array to store the write data
*
* @return	None
*
* @note		None
*
******************************************************************************/
void i2c_reg4_write_bytes(uint8_t dev_addr, uint32_t reg_addr, uint8_t length, uint8_t *data) {
    int i;
    int len_total = (int)length+4;
    uint8_t temp[len_total];
    temp[0] = (uint8_t)(reg_addr>>24);
    temp[1] = (uint8_t)(reg_addr>>16);
    temp[2] = (uint8_t)(reg_addr>>8);
    temp[3] = (uint8_t)(reg_addr);
    for (i=4;i<len_total;i++){
        temp[i]=data[i-4];
    }
    i2c_write(device, dev_addr, temp, len_total);
}
/*****************************************************************************/

/*****************************************************************************/
/*                    Meissner API Function Declarations                     */
/*****************************************************************************/
/******************************************************************************
*
* Initialize I2C device for Meissner sensor.
*
* @param	dev_num is the I2C device number
* @param    reg_addr_2_byte is the 2-byte register address of the Meissner
* @param    reg_addr_4_byte is the 4-byte register address of the Meissner
*
* @return	None
*
* @note		None
*
******************************************************************************/
void meissner_init(int dev_num, uint16_t reg_addr_2_byte, uint32_t reg_addr_4_byte) {
    // Initialize I2C device
    i2c_init(dev_num);

    // Set Meissner register address
    meissner_2_byte_reg_addr = reg_addr_2_byte;
    meissner_4_byte_reg_addr = reg_addr_4_byte;
}

/******************************************************************************
*
* Reset Meissner sensor.
*
* @param    None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void meissner_reset() {
    // Declare local variable
    uint8_t temp[2];
    // Declare read and write address
    uint16_t write_addr = 0x000E;
    uint16_t read_addr = 0x0000;
    // Declare write data
    uint8_t write_data[2];
    parse_2_byte_data(0x03C0, write_data);

    // I2C write operation
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr, 2, write_data);

    // Sleep for 500 us
    delay_us(500);

    // I2C read operation
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr, 2, temp);
}

/******************************************************************************
*
* Read Meissner sensor chip ID.
*
* @param    slave_addr is the I2C slave address of the Meissner sensor.
*           by default, the slave address is 0x74 for 2-byte data and
*           0x77 for 4-byte data.
* @param    addr_len is the length of the register address. This can be
*           either 2 or 4 bytes.
* @param    data_len is the length of the data to read. This can be either
*           2 or 4 bytes.
* @param    reg_addr is the register address of the Meissner sensor.
*
* @return	None
*
* @note		data[0] containst the result of the read operation. It can be
*           either 2 or 4 bytes.
*
******************************************************************************/
void meissner_read_i2c(
    uint32_t slave_addr, 
    uint32_t addr_len, 
    uint32_t data_len, 
    uint32_t reg_addr,
    uint32_t *data) {
    // Declare local variable
    uint8_t temp[4];

    // Determine I2C operation based on address length
    if (addr_len == 2) {
        // I2C read operation
        i2c_reg2_read_bytes(slave_addr, reg_addr, data_len, temp);
        // Write data to data array
        data[0] = (uint32_t)(temp[0]<<8 | temp[1]);
    } else if (addr_len == 4) {
        // I2C read operation
        i2c_reg4_read_bytes(slave_addr, reg_addr, data_len, temp);
        // Write data to data array
        data[0] = (uint32_t)(temp[0]<<24 | temp[1]<<16 | temp[2]<<8 | temp[3]);
    }
}

/******************************************************************************
*
* Write Meissner sensor chip ID.
*
* @param    slave_addr is the I2C slave address of the Meissner sensor.
*           by default, the slave address is 0x74 for 2-byte data and
*           0x77 for 4-byte data.
* @param    addr_len is the length of the register address. This can be
*           either 2 or 4 bytes.
* @param    data_len is the length of the data to read. This can be either
*           2 or 4 bytes.
* @param    reg_addr is the register address of the Meissner sensor.
* @param    reg_data is the data to write to the Meissner sensor.
*
* @return	None
*
* @note		None
*
******************************************************************************/
void meissner_write_i2c(
    uint32_t slave_addr, 
    uint32_t addr_len, 
    uint32_t data_len, 
    uint32_t reg_addr,
    uint32_t reg_data) {
    // Declare local variable
    uint8_t temp[4];

    // Determine I2C operation based on address length
    if (addr_len == 2) {
        // Parse data
        parse_2_byte_data(reg_data, temp);
        // I2C write operation
        i2c_reg2_write_bytes(slave_addr, reg_addr, data_len, temp);
    } else if (addr_len == 4) {
        // Parse data
        parse_4_byte_data(reg_data, temp);
        // I2C write operation
        i2c_reg4_write_bytes(slave_addr, reg_addr, data_len, temp);
    }
}

/******************************************************************************
*
* Read Meissner sensor chip ID.
*
* @param    data is the 4-byte data array to store the chip ID
*
* @return	None
*
* @note		data[0] is the first 2 bytes of the chip ID
*
******************************************************************************/
void meissner_read_dev_id(uint32_t *data) {
    // Declare local variable
    uint8_t temp[2];
    // Declare read address
    uint16_t read_addr = 0x0000;

    // I2C read operation
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr, 2, temp);

    // Get chip ID
    data[0] = (uint32_t)(temp[0]<<8 | temp[1]);
}

/******************************************************************************
*
* Read Meissner sensor chip version.
*
* @param    data is the 4-byte data array to store the chip version
*
* @return	None
*
* @note		data[0] is the first 2 bytes of the chip version
*           data[1] is the last 2 bytes of the chip version
*           data[2] is the status of the chip version
*
******************************************************************************/
void meissner_read_dev_version(uint32_t *data) {
    // Declare local variable
    uint8_t temp[4];

    // Declare read address
    uint16_t read_addr_1 = 0x0001;
    uint16_t read_addr_2 = 0x0002;

    // I2C read operation
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_1, 2, temp);
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_2, 2, temp+2);

    // Get chip version
    data[0] = (uint32_t)(temp[0]<<8 | temp[1]);
    data[1] = (uint32_t)(temp[2]<<8 | temp[3]);

    // Compare chip version and set status
    if ((data[0] == 0xA620) && ((data[1] & 0xFF) == 0xA0)) {
        data[2] = 1; // Chip version is correct
    } else {
        data[2] = 0; // Chip version is incorrect
    }
}

/******************************************************************************
*
* Read Meissner sensor unique ID.
*
* @param    data is the 4-byte data array to store the unique ID
*
* @return	None
*
* @note		data[0] is the first 4 bytes of the unique ID
*           data[1] is the last 4 bytes of the unique ID
*
******************************************************************************/
void meissner_read_unique_id(uint32_t *data) {
    // Declare local variable
    uint8_t temp[8];

    // Declare read address
    uint32_t read_addr_1 = 0x40021048;
    uint32_t read_addr_2 = 0x4002104C;

    // I2C read operation
    i2c_reg4_read_bytes(meissner_4_byte_reg_addr, read_addr_1, 4, temp);
    i2c_reg4_read_bytes(meissner_4_byte_reg_addr, read_addr_2, 4, temp+4);

    // Get unique ID
    data[0] = (uint32_t)(temp[0]<<24 | temp[1]<<16 | temp[2]<<8 | temp[3]);
    data[1] = (uint32_t)(temp[4]<<24 | temp[5]<<16 | temp[6]<<8 | temp[7]);
}

/******************************************************************************
*
* Initial configuration for Meissner sensor.
*
* @param    test_conn is the test connection mode. By default, it is 0. If it
*           is 1, the test connection mode is enabled.
*
* @return	None
*
* @note		None
*
******************************************************************************/
void meissner_init_config(uint16_t test_conn) {
    // Get Meissner chip ID
    uint32_t chip_id[1];
    meissner_read_dev_id(chip_id);

    // Reset Meissner sensor
    meissner_reset();

    // Get Meissner chip version
    uint32_t chip_version[3];
    meissner_read_dev_version(chip_version);

    // Define write address and data
    uint16_t write_addr_1 = 0x0009;
    uint8_t write_data_1[2];
    parse_2_byte_data(0x8000, write_data_1);
    // Write data to Meissner sensor
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_1, 2, write_data_1);

    // Group 0 sequence 0
    // Define write address and data
    uint16_t write_iter_grp_0_0 = 11;
    uint16_t write_addr_grp_0_0 = 0x0038;
    uint8_t write_data_grp_0_0[22];
    // Populate write data
    parse_2_byte_data(0x0000, write_data_grp_0_0);
    parse_2_byte_data(0x0000, write_data_grp_0_0+2);
    parse_2_byte_data(0x0000, write_data_grp_0_0+4);
    parse_2_byte_data(0x0000, write_data_grp_0_0+6);
    parse_2_byte_data(0x0009, write_data_grp_0_0+8);
    parse_2_byte_data(0x0009, write_data_grp_0_0+10);
    parse_2_byte_data(0x0000, write_data_grp_0_0+12);
    parse_2_byte_data(0x0000, write_data_grp_0_0+14);
    parse_2_byte_data(0x0031, write_data_grp_0_0+16);
    parse_2_byte_data(0x0031, write_data_grp_0_0+18);
    parse_2_byte_data(0x003A, write_data_grp_0_0+20);
    // Write data to Meissner sensor
    for (uint16_t i = 0; i < write_iter_grp_0_0; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_0_0+i, 2, write_data_grp_0_0+(2*i));
    }

    // Define write address and data
    uint16_t write_addr_2 = 0x004C;
    uint16_t write_addr_3 = 0x004D;
    uint8_t write_data_2[2];
    uint8_t write_data_3[2];
    parse_2_byte_data(0x001F, write_data_2);
    parse_2_byte_data(0x2C2C, write_data_3);
    // Write data to Meissner sensor
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_2, 2, write_data_2);
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_3, 2, write_data_3);

    // Define write address and data
    uint16_t write_addr_4 = 0x0049;
    uint8_t write_data_4[2];
    parse_2_byte_data(0x0601, write_data_4);
    // Write data to Meissner sensor
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_4, 2, write_data_4);

    // Define write address and data
    uint16_t write_addr_5 = 0x004A;
    uint16_t write_addr_6 = 0x004B;
    uint8_t write_data_5[2];
    uint8_t write_data_6[2];
    parse_2_byte_data(0x0010, write_data_5);
    parse_2_byte_data(0x0104, write_data_6);
    // Write data to Meissner sensor
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_5, 2, write_data_5);
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_6, 2, write_data_6);

    // Group 0 sequence 1
    // Define write address and data
    uint16_t write_iter_grp_0_1 = 8;
    uint16_t write_addr_grp_0_1 = 0x0043;
    uint8_t write_data_grp_0_1[16];
    // Populate write data
    parse_2_byte_data(0x0003, write_data_grp_0_1);
    parse_2_byte_data(0x4321, write_data_grp_0_1+2);
    parse_2_byte_data(0x0005, write_data_grp_0_1+4);
    parse_2_byte_data(0x0006, write_data_grp_0_1+6);
    parse_2_byte_data(0x0000, write_data_grp_0_1+8);
    parse_2_byte_data(0x0000, write_data_grp_0_1+10);
    parse_2_byte_data(0x00A3, write_data_grp_0_1+12);
    parse_2_byte_data(0x0000, write_data_grp_0_1+14);
    // Write data to Meissner sensor
    for (uint16_t i = 0; i < write_iter_grp_0_1; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_0_1+i, 2, write_data_grp_0_1+(2*i));
    }

    // Group 0 sequence 2
    // Define write address and data
    uint16_t write_iter_grp_0_2 = 8;
    uint16_t write_addr_grp_0_2 = 0x004E;
    uint8_t write_data_grp_0_2[16];
    // Populate write data
    parse_2_byte_data(0x0000, write_data_grp_0_2);
    parse_2_byte_data(0x0000, write_data_grp_0_2+2);
    parse_2_byte_data(0x0000, write_data_grp_0_2+4);
    parse_2_byte_data(0x000F, write_data_grp_0_2+6);
    parse_2_byte_data(0x58AE, write_data_grp_0_2+8);
    parse_2_byte_data(0x58AE, write_data_grp_0_2+10);
    parse_2_byte_data(0x589A, write_data_grp_0_2+12);
    parse_2_byte_data(0x0923, write_data_grp_0_2+14);
    // Write data to Meissner sensor
    for (uint16_t i = 0; i < write_iter_grp_0_2; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_0_2+i, 2, write_data_grp_0_2+(2*i));
    }

    // Define write address and data
    uint16_t write_addr_7 = 0x0058;
    uint8_t write_data_7[2];
    parse_2_byte_data(0x0000, write_data_7);
    // Write data to Meissner sensor
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_7, 2, write_data_7);

    // Define write address and data
    uint16_t write_addr_8 = 0x005C;
    uint8_t write_data_8[2];
    if (test_conn == 0) {
        parse_2_byte_data(0x0000, write_data_8);
    } else {
        parse_2_byte_data(0x0003, write_data_8);
    }
    // Write data to Meissner sensor
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_8, 2, write_data_8);

    // Define write address and data
    uint16_t write_addr_9 = 0x0066;
    uint16_t write_addr_10 = 0x0067;
    uint16_t write_addr_11 = 0x0068;
    uint8_t write_data_9[2];
    uint8_t write_data_10[2];
    uint8_t write_data_11[2];
    parse_2_byte_data(0x0000, write_data_9);
    parse_2_byte_data(0x0000, write_data_10);
    parse_2_byte_data(0x0000, write_data_11);
    // Write data to Meissner sensor
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_9, 2, write_data_9);
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_10, 2, write_data_10);
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_11, 2, write_data_11);

    // Group 0 patch register
    // Define write address and data
    uint16_t write_iter_grp_0_otp = 10;
    uint16_t write_addr_grp_0_otp[10] = {
        0x0059, 0x005A, 0x005E, 0x005F, 0x0060,
        0x0061, 0x0062, 0x0063, 0x0064, 0x0065
    };
    uint8_t write_data_grp_0_otp[20];
    // Populate write data
    parse_2_byte_data(0x0000, write_data_grp_0_otp);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+2);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+4);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+6);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+8);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+10);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+12);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+14);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+16);
    parse_2_byte_data(0x0000, write_data_grp_0_otp+18);
    // Write data to Meissner sensor
    for (uint16_t i = 0; i < write_iter_grp_0_otp; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_0_otp[i], 2, write_data_grp_0_otp+(2*i));
    }

    // Group 1
    // Define write address and data
    uint16_t write_iter_grp_1 = 5;
    uint16_t write_addr_grp_1[5] = {
        0x0032, 0x0033, 0x0034, 0x0036, 0x0037
    };
    uint8_t write_data_grp_1[10];
    // Populate write data
    parse_2_byte_data(0x0000, write_data_grp_1);
    parse_2_byte_data(0x0000, write_data_grp_1+2);
    parse_2_byte_data(0x0000, write_data_grp_1+4);
    parse_2_byte_data(0x0000, write_data_grp_1+6);
    parse_2_byte_data(0x0000, write_data_grp_1+8);
    // Write data to Meissner sensor
    for (uint16_t i = 0; i < write_iter_grp_1; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_1[i], 2, write_data_grp_1+(2*i));
    }

    // Group 6 and debug
    // Define write address and data
    uint16_t write_iter_grp_6 = 8;
    uint16_t write_addr_grp_6[8] = {
        0x000A, 0x000B, 0x01C2, 0x01C3, 
        0x01C4, 0x01C5, 0x01C6, 0x01C7
    };
    uint8_t write_data_grp_6[16];
    // Populate write data
    parse_2_byte_data(0x0001, write_data_grp_6);
    parse_2_byte_data(0x0033, write_data_grp_6+2);
    parse_2_byte_data(0x0000, write_data_grp_6+4);
    parse_2_byte_data(0x0000, write_data_grp_6+6);
    parse_2_byte_data(0x0000, write_data_grp_6+8);
    parse_2_byte_data(0x0000, write_data_grp_6+10);
    parse_2_byte_data(0x0000, write_data_grp_6+12);
    parse_2_byte_data(0x0000, write_data_grp_6+14);
    // Write data to Meissner sensor
    for (uint16_t i = 0; i < write_iter_grp_6; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_6[i], 2, write_data_grp_6+(2*i));
    }
}

/******************************************************************************
*
* Configuration group 2 and 3 of Meissner sensor
*
* @param    None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void meissner_cfg_grp_2_3() {
    // Group 2
    // Define write address and data
    uint16_t write_iter_grp_2 = 12;
    uint16_t write_addr_grp_2 = 0x0020;
    uint8_t write_data_grp_2[24];
    // Populate write data
    parse_2_byte_data(0x0000, write_data_grp_2);
    parse_2_byte_data(0x0000, write_data_grp_2+2);
    parse_2_byte_data(0x0000, write_data_grp_2+4);
    parse_2_byte_data(0x0000, write_data_grp_2+6);
    parse_2_byte_data(0x0600, write_data_grp_2+8);
    parse_2_byte_data(0x0000, write_data_grp_2+10);
    parse_2_byte_data(0x0000, write_data_grp_2+12);
    parse_2_byte_data(0x0000, write_data_grp_2+14);
    parse_2_byte_data(0x08CC, write_data_grp_2+16);
    parse_2_byte_data(0x08CC, write_data_grp_2+18);
    parse_2_byte_data(0x0000, write_data_grp_2+20);
    parse_2_byte_data(0x0000, write_data_grp_2+22);
    // Write data to Meissner sensor
    for (uint16_t i = 0; i < write_iter_grp_2; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_2+i, 2, write_data_grp_2+(2*i));
    }

    // Group 3
    // Define write address and data
    uint16_t write_iter_grp_3 = 47;
    uint16_t write_addr_grp_3 = 0x0070;
    uint8_t write_data_grp_3[94];
    // Populate write data
    parse_2_byte_data(0x4000, write_data_grp_3); 
    parse_2_byte_data(0x0000, write_data_grp_3+2);
    parse_2_byte_data(0x0000, write_data_grp_3+4);
    parse_2_byte_data(0x4000, write_data_grp_3+6);
    parse_2_byte_data(0x4000, write_data_grp_3+8); 
    parse_2_byte_data(0x0000, write_data_grp_3+10); 
    parse_2_byte_data(0x0000, write_data_grp_3+12); 
    parse_2_byte_data(0xC000, write_data_grp_3+14);
    parse_2_byte_data(0x0000, write_data_grp_3+16); 
    parse_2_byte_data(0x0000, write_data_grp_3+18); 
    parse_2_byte_data(0x0000, write_data_grp_3+20); 
    parse_2_byte_data(0x0000, write_data_grp_3+22);
    parse_2_byte_data(0x0000, write_data_grp_3+24); 
    parse_2_byte_data(0x0000, write_data_grp_3+26); 
    parse_2_byte_data(0x0000, write_data_grp_3+28); 
    parse_2_byte_data(0x0000, write_data_grp_3+30);
    parse_2_byte_data(0x0000, write_data_grp_3+32); 
    parse_2_byte_data(0x0000, write_data_grp_3+34); 
    parse_2_byte_data(0x0000, write_data_grp_3+36); 
    parse_2_byte_data(0x0000, write_data_grp_3+38);
    parse_2_byte_data(0x0000, write_data_grp_3+40);
    parse_2_byte_data(0x0000, write_data_grp_3+42);
    parse_2_byte_data(0x0000, write_data_grp_3+44);
    parse_2_byte_data(0x0000, write_data_grp_3+46);
    parse_2_byte_data(0x0000, write_data_grp_3+48); 
    parse_2_byte_data(0x0000, write_data_grp_3+50); 
    parse_2_byte_data(0x0000, write_data_grp_3+52);
    parse_2_byte_data(0x0000, write_data_grp_3+54);
    parse_2_byte_data(0x0000, write_data_grp_3+56); 
    parse_2_byte_data(0x0000, write_data_grp_3+58);
    parse_2_byte_data(0x0000, write_data_grp_3+60); 
    parse_2_byte_data(0x0000, write_data_grp_3+62);
    parse_2_byte_data(0x0000, write_data_grp_3+64); 
    parse_2_byte_data(0x0000, write_data_grp_3+66);
    parse_2_byte_data(0x0000, write_data_grp_3+68); 
    parse_2_byte_data(0x0000, write_data_grp_3+70);
    parse_2_byte_data(0x0000, write_data_grp_3+72); 
    parse_2_byte_data(0x0000, write_data_grp_3+74); 
    parse_2_byte_data(0x0000, write_data_grp_3+76); 
    parse_2_byte_data(0x0000, write_data_grp_3+78);
    parse_2_byte_data(0x0000, write_data_grp_3+80); 
    parse_2_byte_data(0x0000, write_data_grp_3+82); 
    parse_2_byte_data(0x0000, write_data_grp_3+84); 
    parse_2_byte_data(0x0000, write_data_grp_3+86);
    parse_2_byte_data(0x0000, write_data_grp_3+88); 
    parse_2_byte_data(0x0000, write_data_grp_3+90); 
    parse_2_byte_data(0x0000, write_data_grp_3+92);
    // Write data to registers
    for (int i = 0; i < write_iter_grp_3; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_3+i, 2, write_data_grp_3+(2*i));
    }
}

/******************************************************************************
*
* Configuration group 4 and 5 of Meissner sensor
*
* @param    test_conn is the test connection mode. By default, it is 0. If it
*           is 1, the test connection mode is enabled.
*
* @return	None
*
* @note		None
*
******************************************************************************/
void meissner_cfg_grp_4_5(uint16_t test_conn) {
    // Define write address and data
    uint16_t write_addr_1 = 0x00BF;
    uint8_t write_data_1[2];
    if (test_conn == 0) {
        parse_2_byte_data(0x0001, write_data_1);
    } else {
        parse_2_byte_data(0x0000, write_data_1);
    }
    // Write data to registers
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_1, 2, write_data_1);

    // Group 4
    // Define write address and data
    uint16_t write_iter_grp_4 = 71;
    uint16_t write_addr_grp_4 = 0x00C0;
    uint8_t write_data_grp_4[142];
    // Populate write data
    parse_2_byte_data(0x1122, write_data_grp_4);
    parse_2_byte_data(0x2108, write_data_grp_4+2);
    parse_2_byte_data(0xEC08, write_data_grp_4+4); 
    parse_2_byte_data(0xA12C, write_data_grp_4+6); 
    parse_2_byte_data(0x10E1, write_data_grp_4+8); 
    parse_2_byte_data(0x0000, write_data_grp_4+10); 
    parse_2_byte_data(0xDDB5, write_data_grp_4+12); 
    parse_2_byte_data(0x91B8, write_data_grp_4+14); 
    parse_2_byte_data(0x91B8, write_data_grp_4+16); 
    parse_2_byte_data(0x00D2, write_data_grp_4+18); 
    parse_2_byte_data(0x7D06, write_data_grp_4+20); 
    parse_2_byte_data(0xDDB5, write_data_grp_4+22); 
    parse_2_byte_data(0x00DC, write_data_grp_4+24); 
    parse_2_byte_data(0x2000, write_data_grp_4+26); 
    parse_2_byte_data(0x0000, write_data_grp_4+28); 
    parse_2_byte_data(0x0000, write_data_grp_4+30); 
    parse_2_byte_data(0x0000, write_data_grp_4+32); 
    parse_2_byte_data(0x0000, write_data_grp_4+34); 
    parse_2_byte_data(0x01E1, write_data_grp_4+36); 
    parse_2_byte_data(0x0000, write_data_grp_4+38); 
    parse_2_byte_data(0x0003, write_data_grp_4+40); 
    parse_2_byte_data(0x0000, write_data_grp_4+42); 
    parse_2_byte_data(0x19CD, write_data_grp_4+44); 
    parse_2_byte_data(0xE781, write_data_grp_4+46); 
    parse_2_byte_data(0x12AB, write_data_grp_4+48); 
    parse_2_byte_data(0x0E0E, write_data_grp_4+50); 
    parse_2_byte_data(0xCC1C, write_data_grp_4+52); 
    parse_2_byte_data(0x01D7, write_data_grp_4+54); 
    parse_2_byte_data(0xFE29, write_data_grp_4+56); 
    parse_2_byte_data(0xBAE4, write_data_grp_4+58); 
    parse_2_byte_data(0x4A67, write_data_grp_4+60); 
    parse_2_byte_data(0x1B54, write_data_grp_4+62); 
    parse_2_byte_data(0xE673, write_data_grp_4+64); 
    parse_2_byte_data(0x0895, write_data_grp_4+66); 
    parse_2_byte_data(0xC1C1, write_data_grp_4+68); 
    parse_2_byte_data(0x00C1, write_data_grp_4+70); 
    parse_2_byte_data(0xED85, write_data_grp_4+72); 
    parse_2_byte_data(0xF76B, write_data_grp_4+74); 
    parse_2_byte_data(0x0011, write_data_grp_4+76); 
    parse_2_byte_data(0x0766, write_data_grp_4+78); 
    parse_2_byte_data(0x3B24, write_data_grp_4+80); 
    parse_2_byte_data(0x0F00, write_data_grp_4+82); 
    parse_2_byte_data(0x000E, write_data_grp_4+84); 
    parse_2_byte_data(0x001C, write_data_grp_4+86); 
    parse_2_byte_data(0x000E, write_data_grp_4+88);  
    parse_2_byte_data(0x8664, write_data_grp_4+90); 
    parse_2_byte_data(0x39D3, write_data_grp_4+92); 
    parse_2_byte_data(0x1000, write_data_grp_4+94); 
    parse_2_byte_data(0x005A, write_data_grp_4+96); 
    parse_2_byte_data(0x002B, write_data_grp_4+98); 
    parse_2_byte_data(0x3949, write_data_grp_4+100); 
    parse_2_byte_data(0x8432, write_data_grp_4+102); 
    parse_2_byte_data(0x0330, write_data_grp_4+104); 
    parse_2_byte_data(0x80FB, write_data_grp_4+106); 
    parse_2_byte_data(0x0F0F, write_data_grp_4+108); 
    parse_2_byte_data(0x0005, write_data_grp_4+110); 
    parse_2_byte_data(0x0005, write_data_grp_4+112); 
    parse_2_byte_data(0x0000, write_data_grp_4+114); 
    parse_2_byte_data(0xC241, write_data_grp_4+116); 
    parse_2_byte_data(0x1DCA, write_data_grp_4+118); 
    parse_2_byte_data(0x0000, write_data_grp_4+120); 
    parse_2_byte_data(0x0000, write_data_grp_4+122); 
    parse_2_byte_data(0x0000, write_data_grp_4+124); 
    parse_2_byte_data(0x0000, write_data_grp_4+126); 
    parse_2_byte_data(0x0000, write_data_grp_4+128); 
    parse_2_byte_data(0x0000, write_data_grp_4+130); 
    parse_2_byte_data(0x0000, write_data_grp_4+132); 
    parse_2_byte_data(0x0000, write_data_grp_4+134); 
    parse_2_byte_data(0x0000, write_data_grp_4+136); 
    parse_2_byte_data(0x03FF, write_data_grp_4+138); 
    parse_2_byte_data(0x000A, write_data_grp_4+140);
    // Write data to registers
    for (int i = 0; i < write_iter_grp_4; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_4+i, 2, write_data_grp_4+(2*i));
    }

    // Define write address and data
    uint16_t write_addr_2 = 0x0125;
    uint8_t write_data_2[2];
    if (test_conn == 0) {
        parse_2_byte_data(0x1182, write_data_1);
    } else {
        parse_2_byte_data(0x0000, write_data_1);
    }
    // Write data to registers
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_2, 2, write_data_2);

    // Group 5
    // Define write address and data
    uint16_t write_iter_grp_5 = 127;
    uint16_t write_addr_grp_5 = 0x0126;
    uint8_t write_data_grp_5[254];
    // Populate write data
    parse_2_byte_data(0x9DB2, write_data_grp_5);
    parse_2_byte_data(0x5375, write_data_grp_5+2);
    parse_2_byte_data(0x3B63, write_data_grp_5+4); 
    parse_2_byte_data(0xD915, write_data_grp_5+6); 
    parse_2_byte_data(0x01E1, write_data_grp_5+8); 
    parse_2_byte_data(0x0000, write_data_grp_5+10); 
    parse_2_byte_data(0x0000, write_data_grp_5+12); 
    parse_2_byte_data(0x0000, write_data_grp_5+14); 
    parse_2_byte_data(0x0000, write_data_grp_5+16); 
    parse_2_byte_data(0x0002, write_data_grp_5+18); 
    parse_2_byte_data(0x9DB2, write_data_grp_5+20); 
    parse_2_byte_data(0x5375, write_data_grp_5+22); 
    parse_2_byte_data(0x3B63, write_data_grp_5+24); 
    parse_2_byte_data(0xD915, write_data_grp_5+26); 
    parse_2_byte_data(0x01E1, write_data_grp_5+28); 
    parse_2_byte_data(0x0000, write_data_grp_5+30); 
    parse_2_byte_data(0x0000, write_data_grp_5+32); 
    parse_2_byte_data(0x0000, write_data_grp_5+34); 
    parse_2_byte_data(0x0000, write_data_grp_5+36); 
    parse_2_byte_data(0x0002, write_data_grp_5+38); 
    parse_2_byte_data(0x5375, write_data_grp_5+40); 
    parse_2_byte_data(0x0000, write_data_grp_5+42); 
    parse_2_byte_data(0x5375, write_data_grp_5+44); 
    parse_2_byte_data(0x0000, write_data_grp_5+46); 
    parse_2_byte_data(0x0E0E, write_data_grp_5+48); 
    parse_2_byte_data(0x2000, write_data_grp_5+50); 
    parse_2_byte_data(0x0000, write_data_grp_5+52); 
    parse_2_byte_data(0x0000, write_data_grp_5+54); 
    parse_2_byte_data(0x0000, write_data_grp_5+56); 
    parse_2_byte_data(0x0000, write_data_grp_5+58); 
    parse_2_byte_data(0x2000, write_data_grp_5+60); 
    parse_2_byte_data(0x0000, write_data_grp_5+62); 
    parse_2_byte_data(0x0000, write_data_grp_5+64); 
    parse_2_byte_data(0x0000, write_data_grp_5+66); 
    parse_2_byte_data(0x0000, write_data_grp_5+68); 
    parse_2_byte_data(0x0250, write_data_grp_5+70); 
    parse_2_byte_data(0x0000, write_data_grp_5+72); 
    parse_2_byte_data(0x3393, write_data_grp_5+74); 
    parse_2_byte_data(0x0000, write_data_grp_5+76); 
    parse_2_byte_data(0x1C4E, write_data_grp_5+78); 
    parse_2_byte_data(0xE572, write_data_grp_5+80); 
    parse_2_byte_data(0x09D4, write_data_grp_5+82); 
    parse_2_byte_data(0x0E0E, write_data_grp_5+84); 
    parse_2_byte_data(0xCC1C, write_data_grp_5+86); 
    parse_2_byte_data(0x01EC, write_data_grp_5+88); 
    parse_2_byte_data(0xFE14, write_data_grp_5+90); 
    parse_2_byte_data(0xC311, write_data_grp_5+92); 
    parse_2_byte_data(0x46E0, write_data_grp_5+94); 
    parse_2_byte_data(0x312B, write_data_grp_5+96); 
    parse_2_byte_data(0xD1CB, write_data_grp_5+98); 
    parse_2_byte_data(0x0CC9, write_data_grp_5+100); 
    parse_2_byte_data(0xC1C1, write_data_grp_5+102); 
    parse_2_byte_data(0x0EC1, write_data_grp_5+104); 
    parse_2_byte_data(0x0250, write_data_grp_5+106); 
    parse_2_byte_data(0x0000, write_data_grp_5+108); 
    parse_2_byte_data(0x3393, write_data_grp_5+110); 
    parse_2_byte_data(0x0000, write_data_grp_5+112); 
    parse_2_byte_data(0x1C4E, write_data_grp_5+114); 
    parse_2_byte_data(0xE572, write_data_grp_5+116); 
    parse_2_byte_data(0x09D4, write_data_grp_5+118); 
    parse_2_byte_data(0x1C0E, write_data_grp_5+120); 
    parse_2_byte_data(0xC1CC, write_data_grp_5+122); 
    parse_2_byte_data(0x01EC, write_data_grp_5+124); 
    parse_2_byte_data(0xFE14, write_data_grp_5+126); 
    parse_2_byte_data(0xC311, write_data_grp_5+128); 
    parse_2_byte_data(0x46E0, write_data_grp_5+130); 
    parse_2_byte_data(0x312B, write_data_grp_5+132); 
    parse_2_byte_data(0xD1CB, write_data_grp_5+134); 
    parse_2_byte_data(0x0CC9, write_data_grp_5+136); 
    parse_2_byte_data(0xC1C1, write_data_grp_5+138); 
    parse_2_byte_data(0xF62C, write_data_grp_5+140); 
    parse_2_byte_data(0xF338, write_data_grp_5+142); 
    parse_2_byte_data(0xF62C, write_data_grp_5+144); 
    parse_2_byte_data(0xF338, write_data_grp_5+146); 
    parse_2_byte_data(0x1111, write_data_grp_5+148); 
    parse_2_byte_data(0x08DA, write_data_grp_5+150); 
    parse_2_byte_data(0x1932, write_data_grp_5+152); 
    parse_2_byte_data(0x08DA, write_data_grp_5+154); 
    parse_2_byte_data(0x1932, write_data_grp_5+156); 
    parse_2_byte_data(0xFF00, write_data_grp_5+158); 
    parse_2_byte_data(0x0008, write_data_grp_5+160); 
    parse_2_byte_data(0x000F, write_data_grp_5+162); 
    parse_2_byte_data(0x0008, write_data_grp_5+164); 
    parse_2_byte_data(0x84BB, write_data_grp_5+166); 
    parse_2_byte_data(0x3B64, write_data_grp_5+168); 
    parse_2_byte_data(0x1000, write_data_grp_5+170); 
    parse_2_byte_data(0x008F, write_data_grp_5+172); 
    parse_2_byte_data(0x004F, write_data_grp_5+174); 
    parse_2_byte_data(0x1000, write_data_grp_5+176); 
    parse_2_byte_data(0x008F, write_data_grp_5+178); 
    parse_2_byte_data(0x004F, write_data_grp_5+180); 
    parse_2_byte_data(0x6DB7, write_data_grp_5+182); 
    parse_2_byte_data(0x8C31, write_data_grp_5+184); 
    parse_2_byte_data(0x0333, write_data_grp_5+186); 
    parse_2_byte_data(0x802F, write_data_grp_5+188);  
    parse_2_byte_data(0xF0F0, write_data_grp_5+190); 
    parse_2_byte_data(0x6DB7, write_data_grp_5+192); 
    parse_2_byte_data(0x8C31, write_data_grp_5+194); 
    parse_2_byte_data(0x0333, write_data_grp_5+196);  
    parse_2_byte_data(0x802F, write_data_grp_5+198); 
    parse_2_byte_data(0xF0F0, write_data_grp_5+200); 
    parse_2_byte_data(0x0001, write_data_grp_5+202); 
    parse_2_byte_data(0x0001, write_data_grp_5+204); 
    parse_2_byte_data(0x0000, write_data_grp_5+206); 
    parse_2_byte_data(0xC45B, write_data_grp_5+208); 
    parse_2_byte_data(0x1BAB, write_data_grp_5+210); 
    parse_2_byte_data(0x0000, write_data_grp_5+212); 
    parse_2_byte_data(0x0000, write_data_grp_5+214); 
    parse_2_byte_data(0x0000, write_data_grp_5+216); 
    parse_2_byte_data(0x0000, write_data_grp_5+218); 
    parse_2_byte_data(0x0000, write_data_grp_5+220); 
    parse_2_byte_data(0x0000, write_data_grp_5+222); 
    parse_2_byte_data(0x0000, write_data_grp_5+224); 
    parse_2_byte_data(0x0000, write_data_grp_5+226); 
    parse_2_byte_data(0x0000, write_data_grp_5+228); 
    parse_2_byte_data(0x0000, write_data_grp_5+230); 
    parse_2_byte_data(0x0000, write_data_grp_5+232); 
    parse_2_byte_data(0x0000, write_data_grp_5+234); 
    parse_2_byte_data(0x0000, write_data_grp_5+236); 
    parse_2_byte_data(0x0000, write_data_grp_5+238); 
    parse_2_byte_data(0x0000, write_data_grp_5+240); 
    parse_2_byte_data(0x0000, write_data_grp_5+242); 
    parse_2_byte_data(0x0000, write_data_grp_5+244); 
    parse_2_byte_data(0x0000, write_data_grp_5+246); 
    parse_2_byte_data(0x03FF, write_data_grp_5+248); 
    parse_2_byte_data(0x03FF, write_data_grp_5+250); 
    parse_2_byte_data(0x000F, write_data_grp_5+252);
    // Write data to registers
    for (int i = 0; i < write_iter_grp_5; i++) {
        i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_grp_5+i, 2, write_data_grp_5+(2*i));
    }
}

/******************************************************************************
*
* Set Meissner sensor from standby to active mode
*
* @param    test_conn is the test connection mode. By default, it is 0. If it
*           is 1, the test connection mode is enabled.
* @param    data is the 4-byte data array to store I2C readings and status
*
* @return	None
*
* @note		data[0] is the stored status of 0x000C and 0x000D read operation.
*           data[1] is the stored status of 0x0009 read operation.
*           data[2] is the stored status of 0x0009 read operation.
*           data[3] is the stored status of 0x000C and 0x000D read operation.
*
******************************************************************************/
void meissner_stby_to_active(uint16_t test_conn, uint32_t *data) {
    // Declare local variable
    uint8_t temp[4];

    // Declare read address
    uint16_t read_addr_1 = 0x000C;
    uint16_t read_addr_2 = 0x000D;
    // I2C read operation
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_1, 2, temp);
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_2, 2, temp+2);
    // Compare read data with expected data
    if ((temp == 0x0000) && ((temp+2) == 0x000)) {
        data[0] = 1; // Correct data
    } else {
        data[0] = 0; // Incorrect data
    }

    // Define write address and data
    uint16_t write_addr_1 = 0x0006;
    uint16_t write_addr_2 = 0x0007;
    uint8_t write_data_1[2];
    uint8_t write_data_2[2];
    // Populate write data
    parse_2_byte_data(0x03FF, write_data_1);
    parse_2_byte_data(0x0001, write_data_2);
    // Write data to registers
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_1, 2, write_data_1);
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_2, 2, write_data_2);

    // Wait for 10ms
    delay_ms(10);

    // Declare read address
    uint16_t read_addr_3 = 0x0009;
    // I2C read operation
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_3, 2, temp);
    // Check the data validity by comparing reading result with expected value in binary format
    if (((temp[1] & 0x03) == 0x03) && ((temp[1] & 0x04) == 0x01) &&
        ((temp[1] & 0x08) == 0x01) && ((temp[1] & 0x20) == 0x01) &&
        ((temp[1] & 0x80) == 0x01)) {
        data[1] = 1; // Correct data
    } else {
        data[1] = 0; // Incorrect data
    }

    // Define write address and data
    uint16_t write_addr_3 = 0x0008;
    uint8_t write_data_3[2];
    // Populate write data
    parse_2_byte_data(0x0001, write_data_3);
    // Write data to registers
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_3, 2, write_data_3);

    // Declare read address
    uint16_t read_addr_4 = 0x0009;
    // I2C read operation
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_4, 2, temp);
    // Check the data validity by comparing reading result with expected value in binary format 
    if ((temp[1] & 0x10) == 0x1) {
        data[2] = 1; // Correct data
    } else {
        data[2] = 0; // Incorrect data
    }

    // Declare read address
    uint16_t read_addr_5 = 0x000C;
    uint16_t read_addr_6 = 0x000D;
    // I2C read operation
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_5, 2, temp);
    i2c_reg2_read_bytes(meissner_2_byte_reg_addr, read_addr_6, 2, temp+2);
    // Compare read data with expected data
    if ((temp == 0x0000) && ((temp+2) == 0x0000)) {
        data[3] = 1; // Correct data
    } else {
        data[3] = 0; // Incorrect data
    }

    // Call meissner_cfg_grp_2_3 function
    meissner_cfg_grp_2_3();

    // Call meissner_cfg_grp_4_5 function
    meissner_cfg_grp_4_5(test_conn);

    // Define write address and data
    uint16_t write_addr_4 = 0x0008;
    uint16_t write_addr_5 = 0x0008;
    uint8_t write_data_4[2];
    uint8_t write_data_5[2];
    // Populate write data
    parse_2_byte_data(0x0000, write_data_4);
    parse_2_byte_data(0x0001, write_data_5);
    // Write data to registers
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_4, 2, write_data_4);
    i2c_reg2_write_bytes(meissner_2_byte_reg_addr, write_addr_5, 2, write_data_5);
}

