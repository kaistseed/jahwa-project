/******************************************************************************
 *
 *
 * @file main.c
 *
 * Softprocessor code (MicroBlaze) for Jahwa Project - PYNQ Microblaze.
 * This code contains the main function which is used to perform the following:
 * 1. Basic I2C read/write operations to Meissner sensor.
 * 2. I2C read/write sequence from pattern sent by the host.
 * 3. Generate a controllable clock signal for triggering laser.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who   Date     Changes
 * ----- ----- ------- -----------------------------------------------
 * 1.00  Dalta 06/06/23 refactor
 *
 * </pre>
 *
 *****************************************************************************/
/*****************************************************************************/
/*                             Library Imports                               */
/*****************************************************************************/
// Basic Xilinx Library
#include "xgpio.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_exception.h"

// User-defined library
#include "spi.h"
#include "gpio.h"
#include "timer.h"
#include "meissner.h"
#include "circular_buffer.h"
#include "axi_clock_divider.h"

/*****************************************************************************/
/*                          Constant Definitions                             */
/*****************************************************************************/
/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
// GPIO device ID
#define GPIO_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID
// I2C device ID
#define IIC_DEVICE_ID   XPAR_AXI_IIC_0_DEVICE_ID
// Timer device ID
#define GLOBAL_TIMER_DEV_ID (XPAR_XTMRCTR_NUM_INSTANCES-1)
#define DELAY_DEV_ID (XPAR_XTMRCTR_NUM_INSTANCES-2)
#define LOCAL_TIMER_DEV_ID (XPAR_XTMRCTR_NUM_INSTANCES-3)
// Clock divider base address
#define CLK_DIV_BASEADDR XPAR_AXI_CLOCK_DIVIDER_0_S00_AXI_BASEADDR
#define CLK_DIV_START_REG AXI_CLOCK_DIVIDER_S00_AXI_SLV_REG0_OFFSET
#define CLK_DIV_SCALE_REG AXI_CLOCK_DIVIDER_S00_AXI_SLV_REG1_OFFSET
#define CLK_DIV_ACTV_CNT_IN_REG AXI_CLOCK_DIVIDER_S00_AXI_SLV_REG2_OFFSET
#define CLK_DIV_ACTV_CNT_OUT_REG AXI_CLOCK_DIVIDER_S00_AXI_SLV_REG3_OFFSET

/*
* The following constant is used to address the GPIO output register.
* In this case, there are two LEDs and two PMODs on the GPIO. 
* Also, set the channel to 1 since only channel 1 is used.
*/
// Define GPIO channel
#define GPIO_CHANNEL 1

/*
* The following constant is used to determine the operation of 
* the microblaze system. 
*/
// Define operation mode
// GPIO operations
#define GPIO_WRITE_LED 0x01
#define GPIO_TEST_LED 0x02
#define GPIO_WRITE_ADC 0x03
#define GPIO_WRITE_SDN1 0x04
#define GPIO_WRITE_SDN2 0x05
#define GPIO_WRITE_SDN3 0x06
#define GPIO_WRITE_RELAY1 0x07
#define GPIO_WRITE_RELAY2 0x08
// I2C operations
#define I2C_MEISSNER_RESET 0x11
#define I2C_MEISSNER_INIT_CFG 0x12
#define I2C_MEISSNER_STBY_TO_ACT 0x13
#define I2C_MEISSNER_READ 0x14
#define I2C_MEISSNER_WRITE 0x15
#define I2C_MEISSNER_PATTERN_LOAD 0x16
#define I2C_MEISSNER_PATTERN_RUN 0x17
#define I2C_MEISSNER_PATTERN_CHECK_STATUS 0x18
#define I2C_MEISSNER_PATTERN_GET_DATA 0x19
#define I2C_MEISSNER_CHIP_ID 0x1A
#define I2C_MEISSNER_VERSION 0x1B
#define I2C_MEISSNER_UNIQUE_ID 0x1C
// SPI operations
#define SPI_CONFIG_DAC 0x21
#define SPI_READ_ADC 0x22
// Laser trigger operations
#define LASER_TRIGGER 0x31
// Timer operations
#define TIMER_GET_CNT_VAL 0x41
#define TIMER_TEST_DELAY 0x42
// Pattern operations
#define PATTERN_LOAD 0x51
#define PATTERN_RUN 0x52
#define PATTERN_GET_DATA 0x53

/*
* The following constant is used to determine the buffer length that is used
* to store the data received from Microblaze peripheral (I2C).
*/
// Define buffer length
#define BUFFER_LENGTH 128
#define PATTERN_BUFFER_MAX_LENGTH 32768

/*****************************************************************************/
/*                  Macros (Inline Functions) Definitions                    */
/*****************************************************************************/
#ifdef PRE_2_00A_APPLICATION
/*
 * The following macros are provided to allow an application to compile that
 * uses an older version of the driver (pre 2.00a) which did not have a channel
 * parameter. Note that the channel parameter is fixed as channel 1.
 */
#define XGpio_SetDataDirection(InstancePtr, DirectionMask) \
        XGpio_SetDataDirection(InstancePtr, GPIO_CHANNEL, DirectionMask)

#define XGpio_DiscreteRead(InstancePtr) \
        XGpio_DiscreteRead(InstancePtr, GPIO_CHANNEL)

#define XGpio_DiscreteWrite(InstancePtr, Mask) \
        XGpio_DiscreteWrite(InstancePtr, GPIO_CHANNEL, Mask)

#define XGpio_DiscreteSet(InstancePtr, Mask) \
        XGpio_DiscreteSet(InstancePtr, GPIO_CHANNEL, Mask)
#endif

/*****************************************************************************/
/*                           Variable Definition                             */
/*****************************************************************************/
// // SPI Instance
// static spi Spi;

// GPIO instance
XGpio Gpio;

/*****************************************************************************/
/*                              Main Function                                */
/*****************************************************************************/
/******************************************************************************
*
* The purpose of this function is to illustrate how to use the timer counter
* as a timer and generate interrupts. This function sets up the timer counter
* to generate interrupts every second. The interrupt handler for the timer
* counter then toggles the LED.
*
* @return	XST_FAILURE to indicate that the GPIO Initialization had
*		failed.
*
* @note		This function will not return if the test is running.
*
******************************************************************************/
int main(void) {
    // Declare local variables
    u32 start_time, end_time;
    int mb_command;
    int xil_status;
    // Allocate memory for data buffer using static variable
    u32 mb_data_host[BUFFER_LENGTH];
    u32 mb_data_periphery[BUFFER_LENGTH];
    float mb_data_periphery_float[BUFFER_LENGTH];

    /*****************************************************************************/
    /*                               GPIO Setup                                  */
    /*****************************************************************************/
    // Initialize LED I/O
    led_io_init();
    // Initialize ADC I/O
    adc_io_init();
    // Initialize SDN I/O
    sdn_1_io_init();
    sdn_2_io_init();
    sdn_3_io_init();
    // Initialize relay I/O
    relay_io_init();

    /*****************************************************************************/
    /*                           Meissner I2C Setup                              */
    /*****************************************************************************/
    // Initialize Meissner I2C
    meissner_init(IIC_DEVICE_ID, 0x74, 0x77);

    // Declare variables related to Meissner I2C
    u32 mem_idx = 1;
    u32 pattern_count = 0; // For pattern check status
    u32 wr_pattern_buf_len = 0; // Length of write pattern buffer
    u32 rd_pattern_buf_len = 0; // Length of read pattern buffer
    static u32 wr_pattern_buf[PATTERN_BUFFER_MAX_LENGTH]; // Write pattern buffer
    static u32 rd_pattern_buf[PATTERN_BUFFER_MAX_LENGTH]; // Read pattern buffer

    /*****************************************************************************/
    /*                                SPI Setup                                  */
    /*****************************************************************************/
    // Define clock phase and polarity
    unsigned int clk_phase = 0;
    unsigned int clk_polarity = 0;

    // Initialize SPI
    spi_init(clk_phase, clk_polarity);

    /*****************************************************************************/
    /*                               Timer Setup                                 */
    /*****************************************************************************/
    // Calibrate delay_us function
    callibrate_timer(20);

    /*****************************************************************************/
    /*                                Main Loop                                  */
    /*****************************************************************************/
    while(1) {
        // Wait for command from host
        while(MAILBOX_CMD_ADDR == 0x00);
        mb_command = MAILBOX_CMD_ADDR;

        // Perform operation based on command
        switch(mb_command) {
            /*********************************************************************/
            /*                         GPIO Operations                           */
            /*********************************************************************/
            case GPIO_WRITE_LED:
                // Get data from host
                mb_data_host[0] = MAILBOX_DATA(0);
                // Control LED operation based on data
                if(mb_data_host[0] == 1) {
                    // Set LED0 to high
                    led_0_on();
                } else if(mb_data_host[0] == 2) {
                    // Set LED1 to high
                    led_1_on();
                } else if(mb_data_host[0] == 3) {
                    // Set LED2 to high
                    led_2_on();
                } else if(mb_data_host[0] == 4) {
                    // Set LED3 to high
                    led_3_on();
                } else if(mb_data_host[0] == 5) {
                    // Set all LED to high
                    led_0_on();
                    led_1_on();
                    led_2_on();
                    led_3_on();
                } else {
                    // Set all LED to low
                    led_0_off();
                    led_1_off();
                    led_2_off();
                    led_3_off();
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case GPIO_TEST_LED:
                // Loop through LED0 and LED1
                for(int i=0; i<5; i++) {
                    // Set LED0 to high
                    led_0_on();
                    // Wait 100 ms
                    delay_ms(100);
                    // Set LED1 to high
                    led_1_on();
                    // Wait 100 ms
                    delay_ms(100);
                    // Set LED2 to high
                    led_2_on();
                    // Wait 100 ms
                    delay_ms(100);
                    // Set LED3 to high
                    led_3_on();
                    // Wait 100 ms
                    delay_ms(100);
                    // Set LED0 to low
                    led_0_off();
                    // Wait 100 ms
                    delay_ms(100);
                    // Set LED1 to low
                    led_1_off();
                    // Wait 100 ms
                    delay_ms(100);
                    // Set LED2 to low
                    led_2_off();
                    // Wait 100 ms
                    delay_ms(100);
                    // Set LED3 to low
                    led_3_off();
                    // Wait 100 ms
                    delay_ms(100);
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case GPIO_WRITE_ADC:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0);
                // Control ADC operation based on data
                // Turn on ADC
                if (mb_data_host[0] == 1) {
                    adc_io_on();
                } 
                // Turn off ADC
                else if (mb_data_host[0] == 0) {
                    adc_io_off();
                }
                // Undefined command
                else {
                    // Do nothing
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case GPIO_WRITE_SDN1:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0);
                // Control SDN IO operation based on data
                // Turn on SDN1
                if (mb_data_host[0] == 1) {
                    sdn_1_io_on();
                }
                // Turn off SDN1
                else if (mb_data_host[0] == 0) {
                    sdn_1_io_off();
                }
                // Undefined command
                else {
                    // Do nothing
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;
            
            case GPIO_WRITE_SDN2:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0);
                // Control SDN IO operation based on data
                // Turn on SDN2
                if (mb_data_host[0] == 1) {
                    sdn_2_io_on();
                }
                // Turn off SDN1
                else if (mb_data_host[0] == 0) {
                    sdn_2_io_off();
                }
                // Undefined command
                else {
                    // Do nothing
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;
            
            case GPIO_WRITE_SDN3:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0);
                // Control SDN IO operation based on data
                // Turn on SDN3
                if (mb_data_host[0] == 1) {
                    sdn_3_io_on();
                }
                // Turn off SDN1
                else if (mb_data_host[0] == 0) {
                    sdn_3_io_off();
                }
                // Undefined command
                else {
                    // Do nothing
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case GPIO_WRITE_RELAY1:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0);
                // Control relay IO operation based on data
                // Turn on relay1
                if (mb_data_host[0] == 1) {
                    relay_1_io_on();
                }
                // Turn off relay1
                else if (mb_data_host[0] == 0) {
                    relay_1_io_off();
                }
                // Undefined command
                else {
                    // Do nothing
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case GPIO_WRITE_RELAY2:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0);
                // Control relay IO operation based on data
                // Turn on relay2
                if (mb_data_host[0] == 1) {
                    relay_2_io_on();
                }
                // Turn off relay2
                else if (mb_data_host[0] == 0) {
                    relay_2_io_off();
                }
                // Undefined command
                else {
                    // Do nothing
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            /*********************************************************************/
            /*                         I2C Operations                            */
            /*********************************************************************/ 
            case I2C_MEISSNER_RESET:
                // Reset Meissner
                meissner_reset();
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_INIT_CFG:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0); // Test connection (0 or 1)
                // Initialize Meissner configuration
                meissner_init_config(mb_data_host[0]);
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_STBY_TO_ACT:
                // Get data from host
                mb_data_host[0] = (u16) MAILBOX_DATA(0); // Test connection (0 or 1)
                // Standby to active mode
                meissner_stby_to_active(mb_data_host[0], mb_data_periphery);
                // Write data to mailbox
                for(int i=0; i<4; i++) {
                    MAILBOX_DATA(i) = mb_data_periphery[i];
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_READ:
                // Get data from host
                mb_data_host[0] = MAILBOX_DATA(0); // slave address
                mb_data_host[1] = MAILBOX_DATA(1); // address length (2 bytes or 4 bytes)
                mb_data_host[2] = MAILBOX_DATA(2); // data length (2 bytes or 4 bytes)
                mb_data_host[3] = MAILBOX_DATA(3); // register address
                // Read data from Meissner
                meissner_read_i2c(
                    mb_data_host[0],
                    mb_data_host[1],
                    mb_data_host[2],
                    mb_data_host[3],
                    mb_data_periphery
                );
                // Write data to mailbox    
                MAILBOX_DATA(0) = mb_data_periphery[0];
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_WRITE:
                // Get data from host
                mb_data_host[0] = MAILBOX_DATA(0); // slave address
                mb_data_host[1] = MAILBOX_DATA(1); // address length (2 bytes or 4 bytes)
                mb_data_host[2] = MAILBOX_DATA(2); // data length (2 bytes or 4 bytes)
                mb_data_host[3] = MAILBOX_DATA(3); // register address
                mb_data_host[4] = MAILBOX_DATA(4); // register data
                // Write data to Meissner
                meissner_write_i2c(
                    mb_data_host[0],
                    mb_data_host[1],
                    mb_data_host[2],
                    mb_data_host[3],
                    mb_data_host[4]
                );
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_PATTERN_LOAD:
                // Get data from host
                wr_pattern_buf[0] = MAILBOX_DATA(0); // block count
                wr_pattern_buf[1] = MAILBOX_DATA(1); // write interval us
                wr_pattern_buf[2] = MAILBOX_DATA(2); // dekay from write to measure us
                wr_pattern_buf[3] = MAILBOX_DATA(3); // measure interval us
                // Get write register address from host
                for(int i=0; i<wr_pattern_buf[0]; i++) {
                    wr_pattern_buf[4+i] = MAILBOX_DATA(4+i);
                }
                // Get write register data from host
                for(int i=0; i<wr_pattern_buf[0]; i++) {
                    wr_pattern_buf[4+wr_pattern_buf[0]+i] = MAILBOX_DATA(4+wr_pattern_buf[0]+i);
                }
                // Get read register address from host
                for(int i=0; i<(2*wr_pattern_buf[0]); i++) {
                    wr_pattern_buf[4+2*wr_pattern_buf[0]+i] = MAILBOX_DATA(4+2*wr_pattern_buf[0]+i);
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_PATTERN_RUN:
                // Reset pattern count
                pattern_count = 0;

                // Run pattern as many times as block count value
                for(int i=0; i<wr_pattern_buf[0]; i++) {
                    int interval_time_start_lsb = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                    int interval_time_start_msb = counter_get_value(GLOBAL_TIMER_DEV_ID, 1);
                    // Start timer counter
                    counter_start_us(DELAY_DEV_ID, 0, wr_pattern_buf[1]);
                    
                    // Write data to I2C slave
                    meissner_write_i2c(
                        0x74, // slave address
                        2, // address length (2 bytes)
                        2, // data length (2 bytes)
                        wr_pattern_buf[4+i], // register address
                        wr_pattern_buf[4+wr_pattern_buf[0]+i] // register data
                    );

                    int write_time_start_lsb = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                    int write_time_start_msb = counter_get_value(GLOBAL_TIMER_DEV_ID, 1);
                    // Delay for write to measure delay
                    delay_us(wr_pattern_buf[2]);
                    int write_time_end_lsb = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                    int write_time_end_msb = counter_get_value(GLOBAL_TIMER_DEV_ID, 1);
                    
                    // Read data from I2C slave
                    meissner_read_i2c(
                        0x74, // slave address
                        2, // address length (2 bytes)
                        2, // data length (2 bytes)
                        wr_pattern_buf[4+2*wr_pattern_buf[0]+i], // register address
                        mb_data_periphery // data buffer
                    );
                    // Write data to read pattern buffer
                    rd_pattern_buf[2*i] = mb_data_periphery[0];
                    
                    int measure_time_start_lsb = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                    int measure_time_start_msb = counter_get_value(GLOBAL_TIMER_DEV_ID, 1);
                    // Delay for measure interval
                    delay_us(wr_pattern_buf[3]);
                    int measure_time_end_lsb = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                    int measure_time_end_msb = counter_get_value(GLOBAL_TIMER_DEV_ID, 1);
                    
                    // Read second data from I2C slave
                    meissner_read_i2c(
                        0x74, // slave address
                        2, // address length (2 bytes)
                        2, // data length (2 bytes)
                        wr_pattern_buf[4+2*wr_pattern_buf[0]+i+1], // register address
                        mb_data_periphery // data buffer
                    );
                    // Write data to read pattern buffer
                    rd_pattern_buf[(2*i)+1] = mb_data_periphery[0];

                    // Wait for timer counter to finish
                    while (counter_is_expired(DELAY_DEV_ID, 0) != 1);

                    // Stop timer counter
                    counter_stop(DELAY_DEV_ID, 0);

                    int interval_time_end_lsb = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                    int interval_time_end_msb = counter_get_value(GLOBAL_TIMER_DEV_ID, 1);

                    // Increment pattern count
                    pattern_count++;

                    // Write pattern count to mailbox
                    MAILBOX_DATA(0) = pattern_count;

                    // Write time to mailbox
                    // Interval time
                    MAILBOX_DATA(100) = interval_time_start_lsb;
                    MAILBOX_DATA(101) = interval_time_start_msb;
                    MAILBOX_DATA(102) = interval_time_end_lsb;
                    MAILBOX_DATA(103) = interval_time_end_msb;
                    // Write time
                    MAILBOX_DATA(104) = write_time_start_lsb;
                    MAILBOX_DATA(105) = write_time_start_msb;
                    MAILBOX_DATA(106) = write_time_end_lsb;
                    MAILBOX_DATA(107) = write_time_end_msb;
                    // Measure time
                    MAILBOX_DATA(108) = measure_time_start_lsb;
                    MAILBOX_DATA(109) = measure_time_start_msb;
                    MAILBOX_DATA(110) = measure_time_end_lsb;
                    MAILBOX_DATA(111) = measure_time_end_msb;
                }

                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_PATTERN_CHECK_STATUS:
                // Test 1: I2C write time
                start_time = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                meissner_write_i2c(
                        0x74, // slave address
                        2, // address length (2 bytes)
                        2, // data length (2 bytes)
                        0x000E, // register address
                        0x03C0 // register data
                    );
                end_time = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                // Write data to mailbox
                MAILBOX_DATA(1) = end_time - start_time;

                // Test 2: I2C read time
                start_time = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                meissner_read_i2c(
                        0x74, // slave address
                        2, // address length (2 bytes)
                        2, // data length (2 bytes)
                        0x0000, // register address
                        mb_data_periphery // data buffer
                    );
                end_time = counter_get_value(GLOBAL_TIMER_DEV_ID, 0);
                // Write data to mailbox
                MAILBOX_DATA(2) = end_time - start_time;

            case I2C_MEISSNER_PATTERN_GET_DATA:
                // Get data from host
                rd_pattern_buf_len = MAILBOX_DATA(0);
                // Write data to mailbox
                for(int i=0; i<(2*rd_pattern_buf_len); i++) {
                    MAILBOX_DATA(i+1) = rd_pattern_buf[i];
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_CHIP_ID:
                // Read chip ID
                meissner_read_dev_id(mb_data_periphery);
                // Write data to mailbox
                MAILBOX_DATA(0) = mb_data_periphery[0];
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_VERSION:
                // Read version
                meissner_read_dev_version(mb_data_periphery);
                // Write data to mailbox
                MAILBOX_DATA(0) = mb_data_periphery[0];
                MAILBOX_DATA(1) = mb_data_periphery[1];
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case I2C_MEISSNER_UNIQUE_ID:
                // Read unique ID
                meissner_read_unique_id(mb_data_periphery);
                // Write data to mailbox
                MAILBOX_DATA(0) = mb_data_periphery[0];
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            /*********************************************************************/
            /*                         SPI Operations                            */
            /*********************************************************************/
            case SPI_CONFIG_DAC:
                // Read data from host
                mb_data_host[0] = MAILBOX_DATA(0); // channel number
                mb_data_host[1] = MAILBOX_DATA(1); // channel code

                // Configure DAC
                config_dac_code(
                    mb_data_host[0],
                    mb_data_host[1]
                );
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case SPI_READ_ADC:
                // Read data from host
                mb_data_host[0] = MAILBOX_DATA(0); // number of samples
                mb_data_host[1] = MAILBOX_DATA(1); // interval between samples (ms)

                // Read ADC
                read_adc(
                    mb_data_host[0],
                    mb_data_host[1],
                    mb_data_periphery,
                    mb_data_periphery_float
                );

                // Write data to mailbox
                // 8 because 8 ADC channels
                // Integer data
                for(int i=0; i<8; i++) {
                    MAILBOX_DATA(i*3) = mb_data_periphery[i*3];
                    MAILBOX_DATA(i*3+1) = mb_data_periphery[i*3+1];
                    MAILBOX_DATA(i*3+2) = mb_data_periphery[i*3+2];
                }

                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;
            
            /*********************************************************************/
            /*                    Laser Trigger Operations                       */
            /*********************************************************************/ 
            case LASER_TRIGGER:
                // Get data from host
                mb_data_host[0] = MAILBOX_DATA(0); // Clock divisor value
                mb_data_host[1] = MAILBOX_DATA(1); // Number of pulses
                // Write divisor value to slave register 0
                AXI_CLOCK_DIVIDER_mWriteReg(
                    CLK_DIV_BASEADDR, 
                    CLK_DIV_SCALE_REG,
                    mb_data_host[0]
                );
                // Write number of pulses (active count) to slave register 1
                AXI_CLOCK_DIVIDER_mWriteReg(
                    CLK_DIV_BASEADDR, 
                    CLK_DIV_ACTV_CNT_IN_REG,
                    mb_data_host[1]
                );
                // Start laser trigger
                AXI_CLOCK_DIVIDER_mWriteReg(
                    CLK_DIV_BASEADDR, 
                    CLK_DIV_START_REG,
                    1
                );
                // Wait for laser trigger to finish
                while(AXI_CLOCK_DIVIDER_mReadReg(CLK_DIV_BASEADDR, CLK_DIV_ACTV_CNT_OUT_REG) < mb_data_host[1]);
                // Stop laser trigger
                AXI_CLOCK_DIVIDER_mWriteReg(
                    CLK_DIV_BASEADDR, 
                    CLK_DIV_START_REG,
                    0
                );
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            /*********************************************************************/
            /*                        Timer Operations                           */
            /*********************************************************************/
            case TIMER_GET_CNT_VAL:
                // Get data from host 
                mb_data_host[0] = MAILBOX_DATA(0); // device ID
                mb_data_host[1] = MAILBOX_DATA(1); // timer ID
                // Get counter value
                mb_data_periphery[0] = counter_get_value(mb_data_host[0], mb_data_host[1]);
                // Write data to mailbox
                MAILBOX_DATA(0) = mb_data_periphery[0];
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case TIMER_TEST_DELAY:
                // Test 1: 10us delay
                start_time = counter_get_value(2, 0);
                delay_us(10);
                end_time = counter_get_value(2, 0);
                mb_data_periphery[0] = start_time - end_time;
                // Test 2: 100us delay
                start_time = counter_get_value(2, 0);
                delay_us(100);
                end_time = counter_get_value(2, 0);
                mb_data_periphery[1] = start_time - end_time;
                // Test 3: 1ms delay
                start_time = counter_get_value(2, 0);
                delay_ms(1);
                end_time = counter_get_value(2, 0);
                mb_data_periphery[2] = start_time - end_time;
                // Test 4: 10ms delay
                start_time = counter_get_value(2, 0);
                delay_ms(10);
                end_time = counter_get_value(2, 0);
                mb_data_periphery[3] = start_time - end_time;
                // Test 5: 100ms delay
                start_time = counter_get_value(2, 0);
                delay_ms(100);
                end_time = counter_get_value(2, 0);
                mb_data_periphery[4] = start_time - end_time;
                // Test 6: 1s delay
                start_time = counter_get_value(2, 0);
                delay_ms(1000);
                end_time = counter_get_value(2, 0);
                mb_data_periphery[5] = start_time - end_time;
                // Write data to mailbox
                MAILBOX_DATA(0) = mb_data_periphery[0];
                MAILBOX_DATA(1) = mb_data_periphery[1];
                MAILBOX_DATA(2) = mb_data_periphery[2];
                MAILBOX_DATA(3) = mb_data_periphery[3];
                MAILBOX_DATA(4) = mb_data_periphery[4];
                MAILBOX_DATA(5) = mb_data_periphery[5];
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            /****************************************************************/
            /*                      Pattern Operations                      */
            /****************************************************************/
            case PATTERN_LOAD:
                // Get number of packets from host
                wr_pattern_buf_len = MAILBOX_DATA(0);
                // Get memory index from host
                mem_idx = MAILBOX_DATA(1);
                // Get data from host
                for(int i=0; i<wr_pattern_buf_len; i++) {
                    // int mb_idx = 24000 + i;
                    // wr_pattern_buf[i] = MAILBOX_DATA(mb_idx+1);
                    wr_pattern_buf[i] = MAILBOX_DATA(i+2);
                    // wr_pattern_buf[i*mem_idx] = MAILBOX_DATA(i+2);
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case PATTERN_RUN:
                // Reset pattern count
                pattern_count = 0;
                // Multiply data in pattern buffer by 2 and write to read pattern buffer
                for(int i=0; i<wr_pattern_buf_len; i++) {
                    rd_pattern_buf[i] = wr_pattern_buf[i] * 2;
                    // Increment pattern count
                    pattern_count++;
                    // Write pattern count to mailbox
                    MAILBOX_DATA(0) = pattern_count;
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            case PATTERN_GET_DATA:
                // Get number of packets from host
                rd_pattern_buf_len = MAILBOX_DATA(0);
                // Get memory index from host
                mem_idx = MAILBOX_DATA(1);
                // Write data to mailbox
                for(int i=0; i<rd_pattern_buf_len; i++) {
                    MAILBOX_DATA(i+2) = rd_pattern_buf[i];
                }
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;

            /*********************************************************************/
            /*                        Other Operations                           */
            /*********************************************************************/
            default:
                // Clear command
                MAILBOX_CMD_ADDR = 0x00;
                break;
        }
    }
}
