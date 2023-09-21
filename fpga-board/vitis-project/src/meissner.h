/******************************************************************************
 *
 *
 * @file meissner.h
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
#ifndef MEISSNER_H_
#define MEISSNER_H_
#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
// Basic Xilinx library
#include "xil_types.h"

// User-defined library
#include "i2c.h"
#include "timer.h"
/*****************************************************************************/

/*****************************************************************************/
/*                       Helper Function Declarations                        */
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
void parse_2_byte_data(uint16_t data, uint8_t *data_array);

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
void parse_4_byte_data(uint32_t data, uint8_t *data_array);

/*****************************************************************************/

/*****************************************************************************/
/*                      I2C API Function Declarations                        */
/*****************************************************************************/
// Declare variables for I2C device
static i2c device;

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
void i2c_init(int dev_num);

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
int i2c_reg1_read_byte(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data);

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
int i2c_reg1_read_bytes(uint8_t dev_addr, uint8_t reg_addr, uint8_t length, uint8_t *data);

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
void i2c_reg1_write_byte(uint8_t dev_addr, uint8_t reg_addr, uint8_t *data);

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
void i2c_reg1_write_bytes(uint8_t dev_addr, uint8_t reg_addr, uint8_t length, uint8_t *data);

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
                        uint8_t bit_start, uint8_t *data);

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
                        uint8_t bit_start, uint8_t length, uint8_t *data);

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
                        uint8_t bit_start, uint8_t data);

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
                        uint8_t bit_start, uint8_t length, uint8_t data);

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
int i2c_reg2_read_byte(uint8_t dev_addr, uint16_t reg_addr, uint8_t *data);

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
int i2c_reg2_read_bytes(uint8_t dev_addr, uint16_t reg_addr, uint8_t length, uint8_t *data);

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
void i2c_reg2_write_byte(uint8_t devAddr, uint16_t regAddr, uint8_t *data);

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
void i2c_reg2_write_bytes(uint8_t dev_addr, uint16_t reg_addr, uint8_t length, uint8_t *data);

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
int i2c_reg4_read_byte(uint8_t dev_addr, uint32_t reg_addr, uint8_t *data);

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
int i2c_reg4_read_bytes(uint8_t dev_addr, uint32_t reg_addr, uint8_t length, uint8_t *data);

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
void i2c_reg4_write_byte(uint8_t dev_addr, uint32_t reg_addr, uint8_t *data);

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
void i2c_reg4_write_bytes(uint8_t dev_addr, uint32_t reg_addr, uint8_t length, uint8_t *data);
/*****************************************************************************/

/*****************************************************************************/
/*                    Meissner API Function Declarations                     */
/*****************************************************************************/
// Declare Meissner-related variables
static uint16_t meissner_2_byte_reg_addr;
static uint32_t meissner_4_byte_reg_addr;

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
void meissner_init(int dev_num, uint16_t reg_addr_2_byte, uint32_t reg_addr_4_byte);

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
void meissner_reset();

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
    uint32_t *data);

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
    uint32_t reg_data);

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
void meissner_read_dev_id(uint32_t *data);

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
void meissner_read_dev_version(uint32_t *data); 

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
void meissner_read_unique_id(uint32_t *data);

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
void meissner_init_config(uint16_t test_conn);

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
void meissner_cfg_grp_2_3();

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
void meissner_cfg_grp_4_5(uint16_t test_conn);

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
void meissner_stby_to_active(uint16_t test_conn, uint32_t *data);
/*****************************************************************************/

#endif
#ifdef __cplusplus
}
#endif /* MEISSNER_H_ */