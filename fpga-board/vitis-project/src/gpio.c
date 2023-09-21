/******************************************************************************
 *
 *
 * @file gpio.c
 *
 * This file contains functions for controlling GPIO devices. It contains both
 * low-level functions for reading and writing to GPIO registers, as well as
 * higher-level functions for controlling specific GPIO devices.
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
#include "gpio.h"

/*****************************************************************************/
/*                   LED I/O Related Function Definitions                    */
/*****************************************************************************/
/******************************************************************************
*
* This function is used to initialize LED GPIO device.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_io_init(void) {
    // Declare variables
    int xil_status;

    // Initialize LED GPIO device
    xil_status = XGpio_Initialize(&led_io, LED_IO_DEVICE_ID);
    if (xil_status != XST_SUCCESS) {
        xil_printf("Error: LED GPIO initialization failed.\n\r");
    }
}

/******************************************************************************
*
* This function is used to turn on LED 0.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_0_on(void) {
    // Set LED 0 to on
    XGpio_DiscreteWrite(&led_io, LED_CHANNEL, LED_0);
}

/******************************************************************************
*
* This function is used to turn off LED 0.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_0_off(void) {
    // Set LED 0 to off
    XGpio_DiscreteClear(&led_io, LED_CHANNEL, LED_0);
}

/******************************************************************************
*
* This function is used to turn on LED 1.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_1_on(void) {
    // Set LED 1 to on
    XGpio_DiscreteWrite(&led_io, LED_CHANNEL, LED_1);
}

/******************************************************************************
*
* This function is used to turn off LED 1.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_1_off(void) {
    // Set LED 1 to off
    XGpio_DiscreteClear(&led_io, LED_CHANNEL, LED_1);
}

/******************************************************************************
*
* This function is used to turn on LED 2.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_2_on(void) {
    // Set LED 2 to on
    XGpio_DiscreteWrite(&led_io, LED_CHANNEL, LED_2);
}

/******************************************************************************
*
* This function is used to turn off LED 2.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_2_off(void) {
    // Set LED 2 to off
    XGpio_DiscreteClear(&led_io, LED_CHANNEL, LED_2);
}

/******************************************************************************
*
* This function is used to turn on LED 3.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_3_on(void) {
    // Set LED 3 to on
    XGpio_DiscreteWrite(&led_io, LED_CHANNEL, LED_3);
}

/******************************************************************************
*
* This function is used to turn off LED 3.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void led_3_off(void) {
    // Set LED 2 to off
    XGpio_DiscreteClear(&led_io, LED_CHANNEL, LED_3);
}

/*****************************************************************************/
/*                   ADC I/O Related Function Definitions                    */
/*****************************************************************************/
/******************************************************************************
*
* This function is used to initialize ADC GPIO device.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void adc_io_init(void) {
    // Declare variables
    int xil_status;

    // Initialize LED GPIO device
    xil_status = XGpio_Initialize(&adc_io, ADC_IO_DEVICE_ID);
    if (xil_status != XST_SUCCESS) {
        xil_printf("Error: ADC GPIO initialization failed.\n\r");
    }
}

/******************************************************************************
*
* This function is used to turn on ADC.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void adc_io_on(void) {
    // Set ADC to on
    XGpio_DiscreteWrite(&adc_io, ADC_CHANNEL, ADC_0);
}

/******************************************************************************
*
* This function is used to turn off ADC.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void adc_io_off(void) {
    // Set ADC to off
    XGpio_DiscreteClear(&adc_io, ADC_CHANNEL, ADC_0);
}

/*****************************************************************************/
/*                   SDN I/O Related Function Definitions                    */
/*****************************************************************************/
/******************************************************************************
*
* This function is used to initialize SDN 1 GPIO device.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_1_io_init(void) {
    // Declare variables
    int xil_status;

    // Initialize LED GPIO device
    xil_status = XGpio_Initialize(&sdn_1_io, SDN_1_IO_DEVICE_ID);
    if (xil_status != XST_SUCCESS) {
        xil_printf("Error: SDN 1 GPIO initialization failed.\n\r");
    }
}

/******************************************************************************
*
* This function is used to turn on SDN 1.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_1_io_on(void) {
    // Set SDN 1 to on
    XGpio_DiscreteWrite(&sdn_1_io, SDN_1_CHANNEL, SDN_1);
}

/******************************************************************************
*
* This function is used to turn off SDN 1.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_1_io_off(void) {
    // Set SDN 1 to off
    XGpio_DiscreteClear(&sdn_1_io, SDN_1_CHANNEL, SDN_1);
}

/******************************************************************************
*
* This function is used to initialize SDN 2 GPIO device.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_2_io_init(void) {
    // Declare variables
    int xil_status;

    // Initialize LED GPIO device
    xil_status = XGpio_Initialize(&sdn_2_io, SDN_2_IO_DEVICE_ID);
    if (xil_status != XST_SUCCESS) {
        xil_printf("Error: SDN 2 GPIO initialization failed.\n\r");
    }
}

/******************************************************************************
*
* This function is used to initialize SDN 3 GPIO device.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_3_io_init(void) {
    // Declare variables
    int xil_status;

    // Initialize LED GPIO device
    xil_status = XGpio_Initialize(&sdn_3_io, SDN_3_IO_DEVICE_ID);
    if (xil_status != XST_SUCCESS) {
        xil_printf("Error: SDN 3 GPIO initialization failed.\n\r");
    }
}

/******************************************************************************
*
* This function is used to turn on SDN 2.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_2_io_on(void) {
    // Set SDN 2 to on
    XGpio_DiscreteWrite(&sdn_2_io, SDN_2_CHANNEL, SDN_2);
}

/******************************************************************************
*
* This function is used to turn off SDN 2.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_2_io_off(void) {
    // Set SDN 2 to off
    XGpio_DiscreteClear(&sdn_2_io, SDN_2_CHANNEL, SDN_2);
}

/******************************************************************************
*
* This function is used to turn on SDN 3.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_3_io_on(void) {
    // Set SDN 3 to on
    XGpio_DiscreteWrite(&sdn_3_io, SDN_3_CHANNEL, SDN_3);
}

/******************************************************************************
*
* This function is used to turn off SDN 3.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void sdn_3_io_off(void) {
    // Set SDN 3 to off
    XGpio_DiscreteClear(&sdn_3_io, SDN_3_CHANNEL, SDN_3);
}

/*****************************************************************************/
/*                  Relay I/O Related Function Definitions                   */
/*****************************************************************************/
/******************************************************************************
*
* This function is used to initialize relay GPIO device.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void relay_io_init(void) {
    // Declare variables
    int xil_status;

    // Initialize LED GPIO device
    xil_status = XGpio_Initialize(&relay_io, RELAY_IO_DEVICE_ID);
    if (xil_status != XST_SUCCESS) {
        xil_printf("Error: relay GPIO initialization failed.\n\r");
    }
}

/******************************************************************************
*
* This function is used to turn on relay 1.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void relay_1_io_on(void) {
    // Set relay 1 to on
    XGpio_DiscreteWrite(&relay_io, RELAY_1_CHANNEL, RELAY_1);
}

/******************************************************************************
*
* This function is used to turn off relay 1.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void relay_1_io_off(void) {
    // Set relay 1 to off
    XGpio_DiscreteClear(&relay_io, RELAY_1_CHANNEL, RELAY_1);
}

/******************************************************************************
*
* This function is used to turn on relay 2.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void relay_2_io_on(void) {
    // Set relay 2 to on
    XGpio_DiscreteWrite(&relay_io, RELAY_2_CHANNEL, RELAY_2);
}

/******************************************************************************
*
* This function is used to turn off relay 2.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
void relay_2_io_off(void) {
    // Set relay 2 to off
    XGpio_DiscreteClear(&relay_io, RELAY_2_CHANNEL, RELAY_2);
}