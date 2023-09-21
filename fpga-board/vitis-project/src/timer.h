/******************************************************************************
 *
 *
 * @file timer.c
 *
 * Implementing timer related functions for Jahwa Project - PYNQ Microblaze,
 * 
 *
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who   Date     Changes
 * ----- ----- ------- -----------------------------------------------
 * 1.00  Dalta 04/12/23 release
 * 2.00  Dalta 06/05/23 refactor
 *
 * </pre>
 *
 *****************************************************************************/
#ifndef _TIMER_H_
#define _TIMER_H_
#ifdef __cplusplus
extern "C" {
#endif
// Basic Xilinx library
#include "xil_types.h"
#include <xparameters.h>

#ifdef XPAR_XTMRCTR_NUM_INSTANCES

/********************** AXI Timer Register Mapping ***************************/
// TCSR0 Timer 0 Control and Status Register
#define TCSR0 0x00
// TLR0 Timer 0 Load Register
#define TLR0 0x04
// TCR0 Timer 0 Counter Register
#define TCR0 0x08
// TCSR1 Timer 1 Control and Status Register
#define TCSR1 0x10
// TLR1 Timer 1 Load Register
#define TLR1 0x14
// TCR1 Timer 1 Counter Register
#define TCR1 0x18
/*****************************************************************************/

/*****************************************************************************/
/*                Low Level Timer API Function Declarations                  */
/*****************************************************************************/
// Declare timer type
typedef int timer;

/*****************************************************************************
*
* Initializes a specific timer counter instance/driver. This function
* must be called before other functions of the driver are called. This function
* also performs self-test to check hardware build.
*
* @param	device is either the device ID of the timer to be worked on or a 
*           a base address of the device.
*
* @return	device_id is the device ID of the timer device instance
*
* @note		by default, the timer is configured to count down from the maximum
*           value to 0. The timer is also configured to automatically reload
*           when it reaches 0.
*
******************************************************************************/
timer timer_open_device(unsigned int dev_id);

/******************************************************************************
*
* Stops all timers instance inside the given device. It also clears the
* counters configurations.
*
* @param	device_id is device ID of the timer device instance
*
* @return	None
*
* @note		None
*
******************************************************************************/
void timer_close_device(timer dev_id);

/******************************************************************************
*
* Get the number of timer devices in the system.
*
* @param	None
*
* @return	XPAR_XTMRCTR_NUM_INSTANCES which is the number of timer devices
*           in the system.
*
* @note		None
*
******************************************************************************/
unsigned int timer_get_num_devices(void);

/******************************************************************************
*
* Starts the delay timer. This function will halt the program for the given
* number of cycles.
*
* @param	cycles is the number of cycles to delay
*
* @return	None
*
* @note		None
*
******************************************************************************/
void timer_delay(unsigned int cycles);

/*****************************************************************************/
/*                High Level Timer API Function Definitions                  */
/*****************************************************************************/
// Declare calibration constant
static uint32_t delay_us_calib_cycles;
static uint32_t delay_ms_calib_cycles;

/******************************************************************************
*
* Performs timer calibration for microsecond delay function. 
* This function will return the number of calibration cycles to get accurate
* microsecond delay.
*
* @param	None
*
* @return	The number of calibration cycles
*
* @note		None
*
******************************************************************************/
int timer_calib_us(unsigned int num_of_point);

/******************************************************************************
*
* Performs timer calibration for millisecond delay function. 
* This function will return the number of calibration cycles to get accurate
* millisecond delay.
*
* @param	None
*
* @return	The number of calibration cycles
*
* @note		None
*
******************************************************************************/
int timer_calib_ms(unsigned int num_of_point);

/******************************************************************************
*
* Performs timer calibration for get accurate microsecond and millisecond
* delay. This function must be called before using the delay functions.
*
* @param	None
*
* @return	The number of calibration cycles
*
* @note		None
*
******************************************************************************/
void callibrate_timer(unsigned int num_of_point);

/******************************************************************************
*
* Starts the free running counter. This function will start the free running
* counter with the specified max count value. The counter will automatically
* reload when it reaches 0.
*
* @param	dev_id is the device ID of the timer device
* @param    ctr_id is the counter ID of the timer device. By default, each
*           timer device has 2 counters. So, the valid values are 0 and 1.
* @param    us is the max count value in microseconds
*
* @return	None
*
* @note		Need to add compensation for the function call overhead
*
******************************************************************************/
void counter_start_us(timer dev_id, unsigned int ctr_id, unsigned int max_count_us);

/******************************************************************************
*
* Starts the free running counter. This function will start the free running
* counter with the specified max count value. The counter will automatically
* reload when it reaches 0.
*
* @param	dev_id is the device ID of the timer device
* @param    ctr_id is the counter ID of the timer device. By default, each
*           timer device has 2 counters. So, the valid values are 0 and 1.
* @param    ms is the max count value in milliseconds
*
* @return	None
*
* @note		Need to add compensation for the function call overhead
*
******************************************************************************/
void counter_start_ms(timer dev_id, unsigned int ctr_id, unsigned int max_count_ms);

/******************************************************************************
*
* Checks if the free running counter has expired.
*
* @param	dev_id is the device ID of the timer device
* @param    ctr_id is the counter ID of the timer device. By default, each
*           timer device has 2 counters. So, the valid values are 0 and 1.
*
* @return	1 if counter has expired, 0 otherwise
*
* @note		None
*
******************************************************************************/
unsigned int counter_is_expired(timer dev_id, unsigned int ctr_id);

/******************************************************************************
*
* Stops the free running counter.
*
* @param	dev_id is the device ID of the timer device
* @param    ctr_id is the counter ID of the timer device. By default, each
*           timer device has 2 counters. So, the valid values are 0 and 1.
*
* @return	None
*
* @note		None
*
******************************************************************************/
void counter_stop(timer dev_id, unsigned int ctr_id);

/******************************************************************************
*
* Get the current value of the free running counter. The returned value can be
* either counter value or max count - counter value depending on the mode of
* the counter (increment or decrement).
*
* @param	dev_id is the device ID of the timer device
* @param    ctr_id is the counter ID of the timer device. By default, each
*           timer device has 2 counters. So, the valid values are 0 and 1.
*
* @return	ctr_value is the current value of the counter
*
* @note		None
*
******************************************************************************/
unsigned int counter_get_value(timer dev_id, unsigned int ctr_id);

/******************************************************************************
*
* Starts the delay timer. This function will halt the program for the given
* number of nanoseconds.
*
* @param	ns is the number of nanoseconds to delay
* @param    comp_count is the number of cycles to compensate for the function.
*           This is used to compensate for the function call overhead.
*           By default, the actual count will be substracted by comp_count.
*
* @return	None
*
* @note		Need to add compensation for the function call overhead
*
******************************************************************************/
void delay_ns(unsigned int ns, unsigned int comp_count);

/******************************************************************************
*
* Starts the delay timer. This function will halt the program for the given
* number of microseconds.
*
* @param	us is the number of microseconds to delay
* @param    comp_count is the number of cycles to compensate for the function.
*           This is used to compensate for the function call overhead.
*           By default, the actual count will be substracted by comp_count.
*
* @return	None
*
* @note		Need to add compensation for the function call overhead
*
******************************************************************************/
void delay_us(unsigned int us);

/******************************************************************************
*
* Starts the delay timer. This function will halt the program for the given
* number of milliseconds.
*
* @param	ms is the number of milliseconds to delay
* @param    comp_count is the number of cycles to compensate for the function.
*           This is used to compensate for the function call overhead.
*           By default, the actual count will be substracted by comp_count.
*
* @return	None
*
* @note		Need to add compensation for the function call overhead
*
******************************************************************************/
void delay_ms(unsigned int ms);
/*****************************************************************************/

#endif
#ifdef __cplusplus
}
#endif
#endif /* _TIMER_H_ */