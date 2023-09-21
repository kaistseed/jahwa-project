/******************************************************************************
 *
 *
 * @file gpio.h
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
#ifndef _GPIO_H_
#define _GPIO_H_
#ifdef __cplusplus 
extern "C" {
#endif

/*****************************************************************************/
/*                             Import Libraries                              */
/*****************************************************************************/
#include "xgpio.h"
#include "xil_types.h"
#include "xparameters.h"

/*****************************************************************************/
/*                              Define Constant                              */
/*****************************************************************************/
// GPIO device IDs
#define LED_IO_DEVICE_ID  XPAR_GPIO_0_DEVICE_ID
#define ADC_IO_DEVICE_ID  XPAR_GPIO_1_DEVICE_ID
#define SDN_1_IO_DEVICE_ID  XPAR_GPIO_2_DEVICE_ID
#define SDN_2_IO_DEVICE_ID  XPAR_GPIO_3_DEVICE_ID
#define SDN_3_IO_DEVICE_ID  XPAR_GPIO_4_DEVICE_ID
#define RELAY_IO_DEVICE_ID  XPAR_GPIO_5_DEVICE_ID

// LED I/O masks
#define LED_0 0x01
#define LED_1 0x02
#define LED_2 0x04
#define LED_3 0x08

// ADC I/O masks
#define ADC_0 0x01

// SDN I/O masks
#define SDN_1 0x01
#define SDN_2 0x01
#define SDN_3 0x01

// Relay I/O masks
#define RELAY_1 0x01
#define RELAY_2 0x01

// GPIO channel
#define LED_CHANNEL 1
#define ADC_CHANNEL 1
#define SDN_1_CHANNEL 1
#define SDN_2_CHANNEL 1
#define SDN_3_CHANNEL 1
#define RELAY_1_CHANNEL 1
#define RELAY_2_CHANNEL 2

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
// GPIO instance
XGpio led_io;
XGpio adc_io;
XGpio sdn_1_io;
XGpio sdn_2_io;
XGpio sdn_3_io;
XGpio relay_io;

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
void led_io_init(void);

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
void led_0_on(void);

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
void led_0_off(void);

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
void led_1_on(void);

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
void led_1_off(void);

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
void led_2_on(void);

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
void led_2_off(void);

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
void led_3_on(void);

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
void led_3_off(void);

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
void adc_io_init(void);

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
void adc_io_on(void);

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
void adc_io_off(void);

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
void sdn_1_io_init(void);

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
void sdn_2_io_init(void);

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
void sdn_3_io_init(void);

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
void sdn_1_io_on(void);

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
void sdn_1_io_off(void);

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
void sdn_2_io_on(void);

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
void sdn_2_io_off(void);

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
void sdn_3_io_on(void);

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
void sdn_3_io_off(void);

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
void relay_io_init(void);

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
void relay_1_io_on(void);

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
void relay_1_io_off(void);

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
void relay_2_io_on(void);

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
void relay_2_io_off(void);

#ifdef __cplusplus
}
#endif
#endif /* _GPIO_H_ */