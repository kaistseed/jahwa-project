##################################################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Michal Gorywoda and Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 07/25/2023
# File Name             : pc_calibration_analysis.py                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6                                          
#       
##################################################################################################

##################################################################################################
#                                        Import Libraries                                        #
##################################################################################################
import csv
import math 
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression

##################################################################################################
#                               Define Function for Processing Data                              #
##################################################################################################
def process_data(output_dir, channel_num, measure_mode):
    ##############################################################################################
    #                                     Active Measurement                                     #
    ##############################################################################################
    if ((measure_mode == 0) or (measure_mode == 1)):
        # Declare variable for counting number of samples
        active_sample_num = 0
        
        # Open raw data file
        f = open(output_dir + '/test_active_{}.csv'.format(channel_name[channel_num]), 'r', encoding='utf-8', newline="")
        reader = csv.reader(f)

        # Iterate through each line of the raw data file and store the data
        for line in reader:
            active_sample_num += 1
            for i, x in enumerate(line):
                temp = float(x)
                if i == 0:
                    active_meas.append(temp * 1000)
                else:
                    active_adc.append(temp)

        # Close raw data file
        f.close()

        # Prepare data for plotting
        active_samples.extend(np.linspace(0, active_sample_num - 1, active_sample_num))

        # Calculate slope and intercept for linear regression
        active_slope = (active_meas[active_sample_num - 1] - active_meas[50]) / (active_adc[active_sample_num - 1] - active_adc[50])
        active_zero = ((active_ADC[50] * active_slope) - (active_meas[50]))

        # Add slope and intercept to list
        active_curve_param.append(active_slope)
        active_curve_param.append(active_zero)
        
        # Print slope and intercept
        print("Active slope: {}".format(active_slope))
        print("Active zero: {}".format(active_zero))

        # Calculate corrected data and error
        for i in range(active_sample_num):
            active_corrected.append((active_adc[i] * active_slope) - active_zero)
            active_error.append(active_corrected[i] - active_meas[i])

    ##############################################################################################
    #                                     Static Measurement                                     #
    ##############################################################################################
    if (((measure_mode == 0) or (measure_mode == 2)) and (channel_num != 2)):
        # Declare variable for counting number of samples
        static_sample_num = 0

        # Open raw data file
        f = open(output_dir + '/test_static_{}.csv'.format(channel_name[channel_num]), 'r', encoding='utf-8', newline="")
        reader = csv.reader(f)

        # Iterate through each line of the raw data file and store the data
        for line in reader:
            static_sample_num += 1
            for i, x in enumerate(line):
                temp = float(x)
                if i == 0:
                    static_meas.append(temp * 1000)
                else:
                    static_adc.append(temp)

        # Close raw data file
        f.close()

        # Prepare data for plotting
        static_samples.extend(np.linspace(0, static_sample_num - 1, static_sample_num))

        # Calculate slope and intercept for linear regression
        static_slope = (static_meas[static_sample_num - 1] - static_meas[100]) / (static_adc[static_sample_num - 1] - static_adc[100])
        static_zero = ((static_adc[100] * static_slope) - (static_meas[100]))

        # Add slope and intercept to list
        static_curve_param.append(static_slope)
        static_curve_param.append(static_zero)

        # Print slope and intercept
        print("Static slope: {}".format(static_slope))
        print("Static zero: {}".format(static_zero))

        # Calculate corrected data and error
        for i in range(static_sample_num):
            static_corrected.append((static_adc[i] * static_slope) - static_zero)
            static_error.append(static_corrected[i] - static_meas[i])

    ##############################################################################################
    #                                     Voltage Measurement                                    #
    ##############################################################################################
    if ((measure_mode == 0) or (measure_mode == 3)):
        # Declare variable for counting number of samples
        voltage_sample_num = 0

        # Open raw data file
        f = open(output_dir + '/test_voltage_{}.csv'.format(channel_name[channel_num]), 'r', encoding='utf-8', newline="")
        reader = csv.reader(f)

        # Iterate through each line of the raw data file and store the data
        for line in reader:
            voltage_sample_num += 1
            for i, x in enumerate(line):
                temp = float(x)
                if i == 0:
                    voltage_meas.append(temp * 1000)
                else:
                    voltage_adc.append(temp)

        # Close raw data file
        f.close()

        # Prepare data for plotting
        voltage_samples.extend(np.linspace(0, voltage_sample_num - 1, voltage_sample_num))
        print("Voltage samples length: {}".format(len(voltage_samples)))

        # Calculate slope and intercept for linear regression
        voltage_slope = (voltage_meas[voltage_sample_num - 300] - voltage_meas[100]) / (voltage_adc[voltage_sample_num - 300] - voltage_adc[100])
        voltage_zero = ((voltage_adc[100] * voltage_slope) - (voltage_meas[100]))

        # Add slope and intercept to list
        voltage_curve_param.append(voltage_slope)
        voltage_curve_param.append(voltage_zero)

        # Print slope and intercept
        print("Voltage slope: {}".format(voltage_slope))
        print("Voltage zero: {}".format(voltage_zero))

        # Calculate corrected data and error
        for i in range(voltage_sample_num):
            voltage_corrected.append((voltage_adc[i] * voltage_slope) - voltage_zero)
            voltage_error.append(voltage_corrected[i] - voltage_meas[i])

##################################################################################################
#                           Define Function for Plotting Processed Data                          #
##################################################################################################
def plot_data(output_dir, channel_num, measure_mode):
    ##############################################################################################
    #                                    All Measurement Mode                                    #
    ##############################################################################################
    if (measure_mode == 0):
        # Calculate active error
        active_mse = np.square(active_error).mean()
        active_rmse = math.sqrt(active_mse)

        # Calculate static error
        static_mse = np.square(static_error).mean()
        static_rmse = math.sqrt(static_mse)

        # Calculate voltage error
        voltage_mse = np.square(voltage_error).mean()
        voltage_rmse = math.sqrt(voltage_mse)

        # Define plot layout
        if (channel_num == 2):
            fig, axis = plt.subplots(2, 2)
        else:
            fig, axis = plt.subplots(2, 3)

        # Voltage measurement plot
        # Voltage vs DAC code
        axis[0,0].step(voltage_samples, voltage_corrected)
        axis[0,0].step(voltage_samples, voltage_meas)
        axis[0,0].set_title("Voltage output {}".format(channel_name[channel_num]))
        axis[0,0].set_xlabel("DAC code")
        axis[0,0].set_ylabel("Output voltage [mV]")
        # Voltage error vs DAC code
        axis[1,0].step(voltage_samples, voltage_error, 'tab:green')
        axis[1,0].set_title("Voltage error {}".format(channel_name[channel_num]))
        axis[1,0].set_xlabel("DAC code")
        axis[1,0].set_ylabel("Error [mV]")
        axis[1,0].axhline(voltage_spec, c='red')
        axis[1,0].axhline(-voltage_spec, c='red')

        # Active measurement plot
        # Measured vs load current
        axis[0,1].step(active_samples, active_corrected)
        axis[0,1].step(active_samples, active_meas)
        axis[0,1].set_title("Active current {}".format(channel_name[channel_num]))
        axis[0,1].set_xlabel("Load current [mA]")
        axis[0,1].set_ylabel("Measured current [mA]")
        # Error vs load current
        axis[1,1].step(active_samples, active_error, 'tab:green')
        axis[1,1].set_title("Active current error {}".format(channel_name[channel_num]))
        axis[1,1].set_xlabel("Load current [mA]")
        axis[1,1].set_ylabel("Error [mA]")
        axis[1,1].axhline(active_spec, c='red')
        axis[1,1].axhline(-active_spec, c='red')

        # Static measurement plot
        if (channel_num != 2):
            # Static current vs load current
            axis[0,2].step(static_samples, static_corrected)
            axis[0,2].step(static_samples, static_meas)
            axis[0,2].set_title("Static current {}".format(channel_name[channel_num]))
            axis[0,2].set_xlabel("Load current [uA]")
            axis[0,2].set_ylabel("Measured current [uA]")
            # Error vs load current
            axis[1,2].step(static_samples, static_error, 'tab:green')
            axis[1,2].set_title("Static current error {}".format(channel_name[channel_num]))
            axis[1,2].set_xlabel("Load current [uA]")
            axis[1,2].set_ylabel("Error [uA]")
            axis[1,2].axhline(static_spec, c='red')
            axis[1,2].axhline(-static_spec, c='red')

        # Save plot
        plt.savefig(output_dir + '/all_calibration_result_{}.png'.format(channel_name[channel_num]))
        plt.show()
    
    ##############################################################################################
    #                                   Active Measurement Mode                                  #
    ##############################################################################################
    elif (measure_mode == 1):
        # Define plot layout
        fig, axis = plt.subplots(2, 1)

        # Active measurement plot
        # Measured vs load current
        axis[0].step(active_samples, active_corrected)
        axis[0].step(active_samples, active_meas)
        axis[0].set_title("Active current {}".format(channel_name[channel_num]))
        axis[0].set_xlabel("Load current [mA]")
        axis[0].set_ylabel("Measured current [mA]")
        # Error vs load current
        axis[1].step(active_samples, active_error, 'tab:green')
        axis[1].set_title("Active current error {}".format(channel_name[channel_num]))
        axis[1].set_xlabel("Load current [mA]")
        axis[1].set_ylabel("Error [mA]")
        axis[1].axhline(active_spec, c='red')
        axis[1].axhline(-active_spec, c='red')

        # Save plot
        plt.savefig(output_dir + '/active_calibration_result_{}.png'.format(channel_name[channel_num]))
        plt.show()

    ##############################################################################################
    #                                   Static Measurement Mode                                  #
    ##############################################################################################
    elif (measure_mode == 2):
        # Define plot layout
        fig, axis = plt.subplots(2, 1)

        # Static measurement plot
        # Static current vs load current
        axis[0].step(static_samples, static_corrected)
        axis[0].step(static_samples, static_meas)
        axis[0].set_title("Static current {}".format(channel_name[channel_num]))
        axis[0].set_xlabel("Load current [uA]")
        axis[0].set_ylabel("Measured current [uA]")
        # Error vs load current
        axis[1].step(static_samples, static_error, 'tab:green')
        axis[1].set_title("Static current error {}".format(channel_name[channel_num]))
        axis[1].set_xlabel("Load current [uA]")
        axis[1].set_ylabel("Error [uA]")
        axis[1].axhline(static_spec, c='red')
        axis[1].axhline(-static_spec, c='red')

        # Save plot
        plt.savefig(output_dir + '/static_calibration_result_{}.png'.format(channel_name[channel_num]))
        plt.show()

    ##############################################################################################
    #                                  Voltage Measurement Mode                                  #
    ##############################################################################################
    elif (measure_mode == 3):
        # Define plot layout
        fig, axis = plt.subplots(2, 1)

        # Print voltage samples
        print("Voltage samples length: {}".format(len(voltage_samples)))
        print("Voltage corrected length: {}".format(len(voltage_corrected)))
        print("Voltage measured length: {}".format(len(voltage_meas)))

        # Voltage measurement plot
        # Voltage vs DAC code
        axis[0].step(voltage_samples, voltage_corrected)
        axis[0].step(voltage_samples, voltage_meas)
        axis[0].set_title("Voltage output {}".format(channel_name[channel_num]))
        axis[0].set_xlabel("DAC code")
        axis[0].set_ylabel("Output voltage [mV]")
        # Voltage error vs DAC code
        axis[1].step(voltage_samples, voltage_error, 'tab:green')
        axis[1].set_title("Voltage error {}".format(channel_name[channel_num]))
        axis[1].set_xlabel("DAC code")
        axis[1].set_ylabel("Error [mV]")
        axis[1].axhline(voltage_spec, c='red')
        axis[1].axhline(-voltage_spec, c='red')

        # Save plot
        plt.savefig(output_dir + '/voltage_calibration_result_{}.png'.format(channel_name[channel_num]))
        plt.show()

    ##############################################################################################
    #                                   Other Measurement Mode                                   #
    ##############################################################################################
    else:
        raise ValueError("Invalid measurement mode")

##################################################################################################
#                                    Declare Global Variables                                    #
##################################################################################################
# Active measurement
active_samples = []
active_meas = []
active_adc = []
active_corrected = []
active_error = []
active_curve_param = []
active_spec = 1.0
# Static measurement
static_samples = []
static_meas = []
static_adc = []
static_corrected = []
static_error = []
static_curve_param = []
static_spec = 1.0
# Voltage measurement
voltage_samples = []
voltage_meas = []
voltage_adc = []
voltage_corrected = []
voltage_error = []
voltage_curve_param = []
voltage_spec = 1.0

# Declare channel name
channel_name = {
    0: "OIS",
    1: "AF",
    2: "VDDM"
}

# Declare measurement mode
measure_name = {
    0: "All",
    1: "Active",
    2: "Static",
    3: "Voltage"
}

##################################################################################################
#                                          Main Function                                         #
##################################################################################################
if __name__ == "__main__":
    # Receive channel number and measurement mode from user
    channel_num = int(input("Enter channel number (0: OIS, 1: AF, 2: VDDM): "))
    measure_mode = int(input("Enter measurement mode (0: All, 1: Active, 2: Static, 3: Voltage): "))
    
    # FIXME: Remove this
    voltage_input = float(input("Enter voltage input (V): "))

    # Set output directory
    output_dir = './output'
    
    # Process data
    process_data(output_dir, channel_num, measure_mode)

    # FIXME: Remove this
    # Get DAC code from voltage input by using curve parameter
    voltage_slope = voltage_curve_param[0]
    voltage_zero = voltage_curve_param[1]
    voltage_dac_code = ((voltage_input * 1000) + voltage_zero) / voltage_slope
    print("Voltage DAC code: {}".format(voltage_dac_code))

    # Plot data
    plot_data(output_dir, channel_num, measure_mode)


