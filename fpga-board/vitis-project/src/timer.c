/******************************************************************************
 *  Copyright (c) 2018, Xilinx, Inc.
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  1.  Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *
 *  2.  Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *
 *  3.  Neither the name of the copyright holder nor the names of its
 *      contributors may be used to endorse or promote products derived from
 *      this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 *  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 *  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 *  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 *  OR BUSINESS INTERRUPTION). HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 *  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 *  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 *  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *****************************************************************************/
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
#include "xparameters.h"
#include "timer.h"

#ifdef XPAR_XTMRCTR_NUM_INSTANCES
#include "xtmrctr.h"
static XTmrCtr TimerCounterInst[XPAR_XTMRCTR_NUM_INSTANCES];
XTmrCtr* TimerCounterInstPtr = &TimerCounterInst[0];
extern XTmrCtr_Config XTmrCtr_ConfigTable[XPAR_XTMRCTR_NUM_INSTANCES];

/*****************************************************************************/
/*                          Constant Definitions                             */
/*****************************************************************************/
/*
 * The following constants are fixed for all applications in this project.
 * The constants include the device ID for delay timer and global timer.
*/
// Global timer device and counter ID
// AXI Timer 2 is used for global timer
#define GLOBAL_TIMER_DEV_ID (XPAR_XTMRCTR_NUM_INSTANCES-1)
#define GLOBAL_TIMER_CTR_ID_LSB 0
#define GLOBAL_TIMER_CTR_ID_MSB 1

// Delay timer device and counter ID
// AXI Timer 1 is used for delay timer
#define DELAY_DEV_ID (XPAR_XTMRCTR_NUM_INSTANCES-2)
#define DELAY_CTR_ID 1

// Local timer device and counter ID
// AXI Timer 0 is used for local timer
// #define LOCAL_TIMER_DEV_ID (XPAR_XTMRCTR_NUM_INSTANCES-3)
#define LOCAL_TIMER_DEV_ID 0
#define LOCAL_TIMER_0_ID 0
#define LOCAL_TIMER_1_ID 1    

/*****************************************************************************/
/*                Low Level Timer API Function Definitions                   */
/*****************************************************************************/
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
timer timer_open_device(unsigned int device) {
    // Declare local variables
    int status;
    u16 device_id;

    // Check device id
    if (device < XPAR_XTMRCTR_NUM_INSTANCES) {
        device_id = device;
    } else {
        int found = 0;
        // Go through all timer devices
        for (u16 i=0; i<XPAR_XTMRCTR_NUM_INSTANCES; i++) {
            // Check if device is timer
            if (XTmrCtr_ConfigTable[i].BaseAddress == device) {
                found = 1;
                device_id = i;
                break;
            }
        }
        // If device is not found
        if (!found) {
            return -1;
        }
    }

    // Initialize timer device
    status = XTmrCtr_Initialize(&TimerCounterInst[device_id], device_id);
    if (status != XST_SUCCESS) {
        return -1;
    }

    // Perform self-test
    // Counter 0
    status = XTmrCtr_SelfTest(&TimerCounterInst[device_id], 0);
    if (status != XST_SUCCESS) {
        return -1;
    }
    // Counter 1
    status = XTmrCtr_SelfTest(&TimerCounterInst[device_id], 1);
    if (status != XST_SUCCESS) {
        return -1;
    }

    // Set timer configuration
    // Counter 0
    // Check if timer is global timer
    if (device == GLOBAL_TIMER_DEV_ID) {
        XTmrCtr_SetOptions(&TimerCounterInst[device_id], 0, XTC_CASCADE_MODE_OPTION |
            XTC_AUTO_RELOAD_OPTION | XTC_CSR_LOAD_MASK);
    } else {
        XTmrCtr_SetOptions(&TimerCounterInst[device_id], 0,
            XTC_AUTO_RELOAD_OPTION | XTC_CSR_LOAD_MASK);
    }
    // Counter 1
    XTmrCtr_SetOptions(&TimerCounterInst[device_id], 1, 
        XTC_AUTO_RELOAD_OPTION | XTC_CSR_LOAD_MASK);

    // Return device id
    return (timer)device_id;
}

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
void timer_close_device(timer device_id) {
    // Stop timer
    XTmrCtr_Stop(&TimerCounterInst[device_id], 0);
    XTmrCtr_Stop(&TimerCounterInst[device_id], 1);
    XTmrCtr_ClearStats(&TimerCounterInst[device_id]);
}

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
unsigned int timer_get_num_devices() {
    return XPAR_XTMRCTR_NUM_INSTANCES;
}

/******************************************************************************
*
* Initializes global timer device. By default, this function is called before
* main() function due to the constructor attribute.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
__attribute__((constructor))
static void init_global_timer() {
    // Declare local variables
    static int initialized = 0;

    // Initialize global timer if not initialized
    if (initialized == 0) {
        timer_open_device(GLOBAL_TIMER_DEV_ID);
        initialized = 1;
    }

    // Set timer reload value
    // 32-bit LSB counter
    XTmrCtr_SetResetValue(
        &TimerCounterInst[GLOBAL_TIMER_DEV_ID], 
        GLOBAL_TIMER_CTR_ID_LSB, 
        XTC_MAX_LOAD_VALUE
    );
    // 32-bit MSB counter
    XTmrCtr_SetResetValue(
        &TimerCounterInst[GLOBAL_TIMER_DEV_ID], 
        GLOBAL_TIMER_CTR_ID_MSB, 
        XTC_MAX_LOAD_VALUE
    );

    // Reset timer
    XTmrCtr_Reset(&TimerCounterInst[GLOBAL_TIMER_DEV_ID], GLOBAL_TIMER_CTR_ID_LSB);
    XTmrCtr_Reset(&TimerCounterInst[GLOBAL_TIMER_DEV_ID], GLOBAL_TIMER_CTR_ID_MSB);

    // Start timer
    XTmrCtr_Start(&TimerCounterInst[GLOBAL_TIMER_DEV_ID], GLOBAL_TIMER_CTR_ID_LSB);
}

/******************************************************************************
*
* Initializes delay timer device. By default, this function is called before
* main() function due to the constructor attribute.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
__attribute__((constructor)) 
static void init_delay_timer() {
    // Declare local variables
    static int initialized = 0;

    // Initialize delay timer if not initialized
    if (initialized == 0) {
        timer_open_device(DELAY_DEV_ID);
        initialized = 1;
    }
}

/******************************************************************************
*
* Initializes timer device. By default, this function is called before
* main() function due to the constructor attribute.
*
* @param	None
*
* @return	None
*
* @note		None
*
******************************************************************************/
__attribute__((constructor))
static void init_timer(unsigned int dev_id) {
    // Declare local variables
    static int initialized = 0;

    // Initialize timer if not initialized
    if (initialized == 0) {
        timer_open_device(dev_id);
        initialized = 1;
    }
}

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
void timer_delay(unsigned int cycles) {
    // Set timer reload value
    XTmrCtr_SetResetValue(&TimerCounterInst[DELAY_DEV_ID], DELAY_CTR_ID, cycles);

    // Reset timer
    XTmrCtr_Reset(&TimerCounterInst[DELAY_DEV_ID], DELAY_CTR_ID);

    // Start timer
    XTmrCtr_Start(&TimerCounterInst[DELAY_DEV_ID], DELAY_CTR_ID);

    // Wait for timer to expire
    while (XTmrCtr_IsExpired(&TimerCounterInst[DELAY_DEV_ID], DELAY_CTR_ID) == 0);

    // Stop timer
    XTmrCtr_Stop(&TimerCounterInst[DELAY_DEV_ID], DELAY_CTR_ID);
}

/*****************************************************************************/
/*                High Level Timer API Function Definitions                  */
/*****************************************************************************/
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
int timer_calib_us(unsigned int num_of_point) {
    // Declare local variables
    int timer_min = 6;
    int timer_max = 100;
    int timer_step;
    int start_time;
    int end_time;
    int ref_cycles;
    int calib_cycles[num_of_point];
    int cycles_per_us;
    int avg_calib_cycles;
    int sum = 0;

    // Get cycles per microsecond
    cycles_per_us = (XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ / 1000000);

    // Calculate timer step
    timer_step = (timer_max - timer_min) / num_of_point;

    // Calibrate timer
    for (int i = 0; i < num_of_point; i++) {
        // Calculate reference cycles
        ref_cycles = (timer_min + (i * timer_step)) * cycles_per_us;
        // Get actual cycles
        start_time = counter_get_value(2, 0);
        delay_us(timer_min+(i*timer_step));
        end_time = counter_get_value(2, 0);
        // Calculate calibration cycles
        calib_cycles[i] = (start_time - end_time) - ref_cycles;
    }

    // Calculate average calibration cycles
    for (int i = 0; i < num_of_point; i++) {
        sum += calib_cycles[i];
    }
    avg_calib_cycles = sum / num_of_point;

    // Return average calibration cycles
    return avg_calib_cycles;
}

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
int timer_calib_ms(unsigned int num_of_point) {
    // Declare local variables
    int timer_min = 1;
    int timer_max = 1000;
    int timer_step;
    int start_time;
    int end_time;
    int ref_cycles;
    int calib_cycles[num_of_point];
    int cycles_per_ms;
    int avg_calib_cycles;
    int sum = 0;

    // Get cycles per millisecond
    cycles_per_ms = (XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ / 1000);

    // Calculate timer step
    timer_step = (timer_max - timer_min) / num_of_point;

    // Calibrate timer
    for (int i = 0; i < num_of_point; i++) {
        // Calculate reference cycles
        ref_cycles = (timer_min + (i * timer_step)) * cycles_per_ms;
        // Get actual cycles
        start_time = counter_get_value(2, 0);
        delay_ms(timer_min+(i*timer_step));
        end_time = counter_get_value(2, 0);
        // Calculate calibration cycles
        calib_cycles[i] = (start_time - end_time) - ref_cycles;
    }

    // Calculate average calibration cycles
    for (int i = 0; i < num_of_point; i++) {
        sum += calib_cycles[i];
    }
    avg_calib_cycles = sum / num_of_point;

    // Return average calibration cycles
    return avg_calib_cycles;
}

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
void callibrate_timer(unsigned int num_of_point) {
    // Callibrate microsecond delay
    delay_us_calib_cycles = timer_calib_us(num_of_point);
    delay_ms_calib_cycles = timer_calib_ms(num_of_point);
}

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
void counter_start_us(timer dev_id, unsigned int ctr_id, unsigned int max_count_us) {
    // Calculate cycles per microsecond
    unsigned int cycles_per_us;
    cycles_per_us = (XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ / 1000000);

    // Initialize timer device
    init_timer(dev_id);

    // Set timer reload value
    XTmrCtr_SetResetValue(&TimerCounterInst[dev_id], ctr_id, max_count_us * cycles_per_us);

    // Reset timer
    XTmrCtr_Reset(&TimerCounterInst[dev_id], ctr_id);

    // Start timer
    XTmrCtr_Start(&TimerCounterInst[dev_id], ctr_id);
}

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
void counter_start_ms(timer dev_id, unsigned int ctr_id, unsigned int max_count_ms) {
    // Declare local variables
    unsigned int cycles_per_ms;
    cycles_per_ms = (XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ / 1000);

    // Initialize timer device
    init_timer(dev_id);

    // Set timer reload value
    XTmrCtr_SetResetValue(&TimerCounterInst[dev_id], ctr_id, max_count_ms * cycles_per_ms);

    // Reset timer
    XTmrCtr_Reset(&TimerCounterInst[dev_id], ctr_id);

    // Start timer
    XTmrCtr_Start(&TimerCounterInst[dev_id], ctr_id);
}

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
unsigned int counter_is_expired(timer dev_id, unsigned int ctr_id) {
    // Declare local variables
    unsigned int expired;

    // Check if counter has expired
    expired = XTmrCtr_IsExpired(&TimerCounterInst[dev_id], ctr_id);

    // Return expired
    return expired;
}

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
void counter_stop(timer dev_id, unsigned int ctr_id) {
    // Stop timer
    XTmrCtr_Stop(&TimerCounterInst[dev_id], ctr_id);
}

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
unsigned int counter_get_value(timer dev_id, unsigned int ctr_id) {
    // Declare local variables
    unsigned int ctr_value;

    // Get counter value
    ctr_value = XTmrCtr_GetValue(&TimerCounterInst[dev_id], ctr_id);

    // Return counter value
    return ctr_value;
}

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
void delay_us(unsigned int us) {
    // Declare local variables
    unsigned int cycles_per_us;
    unsigned int total_cycles;
    unsigned int calibrated_cycles;

    // Calculate cycles per microsecond
    cycles_per_us = (XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ / 1000000);

    // Calculate total cycles
    total_cycles = (us * cycles_per_us);

    // Get calibrated cycles
    if (total_cycles > delay_us_calib_cycles) {
        calibrated_cycles = total_cycles - delay_us_calib_cycles;
    } else {
        calibrated_cycles = 0;
    }

    // Initialize delay timer
    init_delay_timer();

    // Delay in microseconds
    timer_delay(calibrated_cycles);
}

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
void delay_ms(unsigned int ms) {
    // Declare local variables
    unsigned int cycles_per_ms;
    unsigned int total_cycles;
    unsigned int calibrated_cycles;

    // Calculate cycles per millisecond
    cycles_per_ms = (XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ / 1000);

    // Calculate total cycles
    total_cycles = (ms * cycles_per_ms);

    // Get calibrated cycles
    if (total_cycles > delay_ms_calib_cycles) {
        calibrated_cycles = total_cycles - delay_ms_calib_cycles;
    } else {
        calibrated_cycles = 0;
    }

    // Initialize delay timer
    init_delay_timer();

    // Delay in milliseconds
    timer_delay(calibrated_cycles);
}
/*****************************************************************************/
#endif
