/******************************************************************************
 *
 *
 * @file spi.h
 *
 * This file contains functions for performing SPI transactions to between
 * PYNQ board and ADC-DAC module in the Jahwa DAQ daughter board
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who   Date     Changes
 * ----- ----- ------- -----------------------------------------------
 * 1.00  Dalta 06/19/23 release
 *
 * </pre>
 *
 *****************************************************************************/
#ifndef _SPI_H_
#define _SPI_H_
#ifdef __cplusplus 
extern "C" {
#endif

/*****************************************************************************/
/*                             Import Libraries                              */
/*****************************************************************************/
#include "xil_types.h"
#include "xparameters.h"

/*****************************************************************************/
/*                            Declare Variables                              */
/*****************************************************************************/
// Define type for SPI device
typedef int spi;

// Declare variables for I2C device
static spi spi_device;

/*****************************************************************************/
/*                      Low Level Function Definitions                       */
/*****************************************************************************/
/******************************************************************************
*
* This function configures the SPI device with the specified device number.
* The SPI device is configured to be a master with manual slave select.
*
* @param	device is number (id) of the SPI device that will be opened
*
* @return	device id (spi) if successful, otherwise -1
*
* @note		this function sets the SPI device to master mode, and enables
*			the device.
*
******************************************************************************/
spi spi_open_device(unsigned int device);

/******************************************************************************
*
* This function is used to configure the clock phase and polarity of the SPI
* device. It is done by setting 3rd (CPOL) and 4th (CPHA) of the control
* register.
*
* @param	device is number (id) of the SPI device that will be configured
*
* @param	clk_phase is the clock phase of the SPI device
*
* @param	clk_polarity is the clock polarity of the SPI device
*
* @return	device id (spi) if successful, otherwise -1
*
* @note		by default, the clock phase is 0 and clock polarity is 0.
*
******************************************************************************/
spi spi_configure(spi dev_id, unsigned int clk_phase,
                  unsigned int clk_polarity);

/******************************************************************************
*
* This function is used to configure the clock phase and polarity of the SPI
* device. It is done by setting 3rd (CPOL) and 4th (CPHA) of the control
* register.
*
* @param	clk_phase is the clock phase of the SPI device
*
* @param	clk_polarity is the clock polarity of the SPI device
*
* @return	None
*
* @note		by default, the clock phase is 0 and clock polarity is 0.
*
******************************************************************************/
void spi_init(unsigned int clk_phase,
              unsigned int clk_polarity);

/******************************************************************************
*
* This function is used to perform SPI transactions. It can be used to
* transmit and receive data to/from SPI device. The SPI device must be
* configured before using this function.
*
* @param	dev_id is number (id) of the SPI device that will be used for
*           transactions
*
* @param	slave_id is the slave select line that will be used for the
*           transaction if there are multiple slave devices connected to the
*           SPI bus
*
* @param	write_data is the data that will be transmitted to the SPI device
*
* @param	read_data is the data that will be received from the SPI device
*
* @param	length is the number of packets (16-bit) that will be 
*           transmitted/received
*
* @return	None
*
* @note		None
*
******************************************************************************/
void spi_transfer(spi dev_id, unsigned int slave_id, const uint16_t *write_data, 
                  uint16_t *read_data, unsigned int length);

/******************************************************************************
*
* This function is used to close the SPI device.
*
* @param	dev_id is the device id of the SPI device that will be closed
*
* @return	None    
*
* @note		None
*
******************************************************************************/
void spi_close(spi dev_id);

/******************************************************************************
*
* This function is used return the number of SPI devices in the system.
*
* @param	None
*
* @return	number of SPI devices in the system    
*
* @note		None
*
******************************************************************************/
unsigned int spi_get_num_devices(void);

/*****************************************************************************/
/*                     DAC Related Function Definitions                      */
/*****************************************************************************/
/******************************************************************************
*
* Configure DAC device by writing DAC code to DAC register.
*
* @param    channel_num is the channel number of the DAC device. This can be
*           either 0, 1, or 2.
*
* @param    channel_code is code that will be written to the DAC register.
*
* @return	None
*
* @note		
*
******************************************************************************/
void config_dac_code(unsigned int channel_num, unsigned int channel_code);

/*****************************************************************************/
/*                     ADC Related Function Definitions                      */
/*****************************************************************************/
/******************************************************************************
*
* This function is used to read value from ADC device. It supports oversampling
* to increase the resolution of the ADC device.
*
* @param    sample_num is the number of samples that will be taken from the
*           ADC device (oversampling)
* 
* @param    interval_ms is the interval between each sample in milliseconds
*
* @param    int_data is the array that will be used to store integer result
*           from the ADC device (ADC value, ADC ID, ADC softspan)
*
* @param    float_data is the array that will be used to store float result
*           from the ADC device (ADC voltage)
*
*
* @return	None
*
* @note		This function will return raw ADC value, ADC ID, ADC voltage, and
*           ADC softspan.
*
******************************************************************************/
void read_adc(unsigned int sample_num, unsigned int interval_ms, 
    uint32_t *int_data, float *float_data);

#ifdef __cplusplus
}
#endif
#endif /* _SPI_H_ */