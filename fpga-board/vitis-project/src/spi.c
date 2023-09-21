/******************************************************************************
 *
 *
 * @file spi.c
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
/*****************************************************************************/
/*                             Import Libraries                              */
/*****************************************************************************/
#include "spi.h"
#include "gpio.h"
#include "timer.h"

#ifdef XPAR_XSPI_NUM_INSTANCES
#include "xspi_l.h"
#include "xspi.h"

/*****************************************************************************/
/*                              Define Constant                              */
/*****************************************************************************/
// GPIO device IDs
#define SPI_DEVICE_ID  XPAR_SPI_0_DEVICE_ID

/*****************************************************************************/
/*                            Declare Variables                              */
/*****************************************************************************/
static XSpi xspi[XPAR_XSPI_NUM_INSTANCES];
XSpi *xspi_ptr = &xspi[0];
extern XSpi_Config XSpi_ConfigTable[];

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
spi spi_open_device(unsigned int device) {
    int status;
    u16 dev_id;
    unsigned int base_address;
    u32 control;

    if (device < XPAR_XSPI_NUM_INSTANCES) {
        dev_id = (u16) device;
    }
    else {
        int found = 0;
        for (u16 i = 0; i < XPAR_XSPI_NUM_INSTANCES; ++i) {
            if (XSpi_ConfigTable[i].BaseAddress == device) {
                found = 1;
                dev_id = i;
                break;
            }
        }
        if (!found)
            return -1;
    }
    status = XSpi_Initialize(&xspi[dev_id], dev_id);
    if (status != XST_SUCCESS) {
        return -1;
    }
    base_address = xspi[dev_id].BaseAddr;
    // Soft reset SPI
    XSpi_WriteReg(base_address, XSP_SRR_OFFSET, 0xA);
    // Master mode
    control = XSpi_ReadReg(base_address, XSP_CR_OFFSET);
    // Master Mode
    control |= XSP_CR_MASTER_MODE_MASK;
    // Enable SPI
    control |= XSP_CR_ENABLE_MASK;
    // Slave select manually
    control |= XSP_INTR_SLAVE_MODE_MASK;
    // Enable Transmitter
    control &= ~XSP_CR_TRANS_INHIBIT_MASK;
    // Write configuration word
    XSpi_WriteReg(base_address, XSP_CR_OFFSET, control);

    return (spi) dev_id;
}

/******************************************************************************
*
* This function is used to configure the clock phase and polarity of the SPI
* device. It is done by setting 3rd (CPOL) and 4th (CPHA) of the control
* register.
*
* @param	device is number (id) of the SPI device that will be configured
*
* @return	device id (spi) if successful, otherwise -1
*
* @note		by default, the clock phase is 0 and clock polarity is 0.
*
******************************************************************************/
spi spi_configure(spi dev_id, unsigned int clk_phase,
                  unsigned int clk_polarity) {
    u32 control;
    unsigned int base_address = xspi[dev_id].BaseAddr;
    // Soft reset SPI
    XSpi_WriteReg(base_address, XSP_SRR_OFFSET, 0xA);
    // Master mode
    control = XSpi_ReadReg(base_address, XSP_CR_OFFSET);
    // Master Mode
    control |= XSP_CR_MASTER_MODE_MASK;
    // Enable SPI
    control |= XSP_CR_ENABLE_MASK;
    // Slave select manually
    control |= XSP_INTR_SLAVE_MODE_MASK;
    // Enable Transmitter
    control &= ~XSP_CR_TRANS_INHIBIT_MASK;
    // XSP_CR_CLK_PHASE_MASK
    if (clk_phase) {
        control |= XSP_CR_CLK_PHASE_MASK;
    }
    // XSP_CR_CLK_POLARITY_MASK
    if (clk_polarity) {
        control |= XSP_CR_CLK_POLARITY_MASK;
    }
    // Write configuration word
    XSpi_WriteReg(base_address, XSP_CR_OFFSET, control);
    return dev_id;
}

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
* @return	None
*
* @note		by default, the clock phase is 0 and clock polarity is 0.
*
******************************************************************************/
void spi_init(unsigned int clk_phase,
              unsigned int clk_polarity) {
    spi_device = spi_open_device(SPI_DEVICE_ID);
    spi_configure(spi_device, clk_phase, clk_polarity);
}

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
                  uint16_t *read_data, unsigned int length) {
    // Declare local variables
    unsigned int i;
    unsigned volatile char j;
    uint8_t slave_mask;
    unsigned int base_address = xspi[dev_id].BaseAddr;

    // Set slave select
    slave_mask = ~(1 << slave_id);
    XSpi_WriteReg(base_address, XSP_SSR_OFFSET, slave_mask);

    // Start transfer
    for (i = 0; i < length; i++) {
        XSpi_WriteReg(base_address, XSP_DTR_OFFSET, write_data[i]);
    }
    while (((XSpi_ReadReg(base_address, XSP_SR_OFFSET) & 0x04)) != 0x04);

    // delay for 50 clock cycles
    j = 50;
    while (j--);

    for (i = 0; i < length; i++) {
        read_data[i] = XSpi_ReadReg(base_address, XSP_DRR_OFFSET);
    }
    XSpi_WriteReg(base_address, XSP_SSR_OFFSET, 0xff);
}

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
void spi_close(spi dev_id) {
    XSpi_ClearStats(&xspi[dev_id]);
}

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
unsigned int spi_get_num_devices(void) {
    return XPAR_XSPI_NUM_INSTANCES;
}

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
void config_dac_code(unsigned int channel_num, unsigned int channel_code){
    // Declare local variables
    uint8_t spi_data_msb, spi_data_lsb;
    uint16_t spi_data;
    unsigned int dac_slave_id = 0;

    // Populate spi_data
    switch(channel_num){
        case 0:
            spi_data_msb = (0x01 << 4) | ((channel_code >> 8) & 0x0f);
            spi_data_lsb = channel_code & 0xff;
            break;
        case 1:
            spi_data_msb = (0x05 << 4) | ((channel_code >> 8) & 0x0f);
            spi_data_lsb = channel_code & 0xff;
            break;
        case 2:
            spi_data_msb = (0x09 << 4) | ((channel_code >> 8) & 0x0f);
            spi_data_lsb = channel_code & 0xff;
            break;
        default:
            spi_data_msb = 0;
            spi_data_lsb = 0;
            break;
    }
    spi_data = (spi_data_msb << 8) | spi_data_lsb;

    // Write to DAC
    spi_transfer(spi_device, dac_slave_id, &spi_data, NULL, 1);
}

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
* @param    adc_value is the pointer to the array that will be used to store
*           the ADC value
*
* @param    adc_id is the pointer to the array that will be used to store the
*           ADC ID
*
* @param    adc_voltage is the pointer to the array that will be used to store
*           the ADC voltage
* 
* @param    adc_softspan is the pointer to the array that will be used to store
*           the ADC softspan
*
* @return	None
*
* @note		This function will return raw ADC value, ADC ID, ADC voltage, and
*           ADC softspan.
*
******************************************************************************/
void read_adc(unsigned int sample_num, unsigned int interval_ms, 
    uint32_t *int_data, float *float_data) {
    // Declare local variables
    unsigned int adc_slave_id = 1;
    unsigned int adc_channel = 8;
    unsigned int num_of_trx = 12;
    uint16_t softspan_cfg[2] = {0xB6DB, 0x6DDB};
    uint16_t halfword;
    uint16_t buffer[num_of_trx];
    uint16_t raw_data[num_of_trx*2];
    uint32_t adc_id[adc_channel];
    uint32_t temp_adc_value;
    uint32_t adc_value[adc_channel]; 
    uint32_t adc_softspan[adc_channel];
    float adc_voltage[adc_channel]; 

    // Reset adc buffer
    for (int i=0; i<adc_channel; i++) {
        adc_id[i] = 0;
        adc_value[i] = 0;
        adc_softspan[i] = 0;
        adc_voltage[i] = 0;
    }

    // Sample ADC value multiple times (oversampling)
    for (int i=0; i<sample_num; i++) {
        // Reset buffer
        for (int j=0; j<num_of_trx; j++) {
            buffer[j] = 0;
        }

        // Reset raw_data
        for (int j=0; j<num_of_trx*2; j++) {
            raw_data[j] = 0;
        }

        // Configure ADC softspan
        spi_transfer(spi_device, adc_slave_id, (uint16_t*)softspan_cfg, NULL, 2);

        // Turn on and off ADC
        adc_io_on();
        delay_ms(10);
        adc_io_off();
        delay_ms(10);
        
        // Read ADC value
        uint16_t adc_read_reg = 0xDBB6;
        spi_transfer(spi_device, adc_slave_id, &adc_read_reg, (uint16_t*)buffer, num_of_trx);

        // Parse ADC value
        for (int j=0; j<num_of_trx; j++) {
            halfword = buffer[j];
            raw_data[j*2] = halfword >> 8;
            raw_data[j*2+1] = halfword & 0xff;
        }

        // Accumulate ADC value
        for (int j=0; j<adc_channel; j++) {
            // Compute other ADC data (get data only from first sample)
            if (i==0) {
                adc_id[j] = raw_data[(j*3)+2] >> 3;
                adc_softspan[j] = raw_data[(j*3)+2] & 0x07;
                adc_voltage[j] = (float)adc_value[j] / 65536.0 * 4.096;
            }
            // ADC Value
            temp_adc_value = (raw_data[j*3] << 8) | (raw_data[(j*3)+1] & 0xff);
            adc_value[j] += temp_adc_value;
        }

        // Delay sampling
        delay_ms(interval_ms);
    }

    // // Reset buffer
    // for (int j=0; j<num_of_trx; j++) {
    //     buffer[j] = 0;
    // }

    // // Reset raw_data
    // for (int j=0; j<num_of_trx*2; j++) {
    //     raw_data[j] = 0;
    // }

    // // Turn on and off ADC
    // adc_io_on();
    // delay_ms(10);
    // adc_io_off();
    // delay_ms(10);
    
    // // Read ADC value
    // uint16_t adc_read_reg = 0xDBB6;
    // spi_transfer(spi_device, adc_slave_id, &adc_read_reg, (uint16_t*)buffer, num_of_trx);

    // // Parse ADC value
    // for (int j=0; j<num_of_trx; j++) {
    //     halfword = buffer[j];
    //     raw_data[j*2] = halfword >> 8;
    //     raw_data[j*2+1] = halfword & 0xff;
    // }

    // // Average ADC value and compute all other data
    // for (int i=0; i<adc_channel; i++) {
    //     adc_value[i] = (raw_data[i*3] << 8) | (raw_data[(i*3)+1] & 0xff);
    //     adc_id[i] = raw_data[(i*3)+2] >> 3;
    //     adc_softspan[i] = raw_data[(i*3)+2] & 0x07;
    //     adc_voltage[i] = (float)adc_value[i] / 65536.0 * 4.096;
    // }

    // Average ADC value and compute all other data
    for (int i=0; i<adc_channel; i++) {
        adc_value[i] /= sample_num;
    }

    // Populate int data buffer
    for (int i=0; i<adc_channel; i++) {
        int_data[i*3] = adc_value[i];
        int_data[i*3+1] = adc_id[i];
        int_data[i*3+2] = adc_softspan[i];
    }

    // Populate float data buffer
    for (int i=0; i<adc_channel; i++) {
        float_data[i] = adc_voltage[i];
    }
}

#endif
