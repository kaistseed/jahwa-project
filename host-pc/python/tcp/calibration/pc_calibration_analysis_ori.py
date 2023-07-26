import numpy as np
import matplotlib.pyplot as plt
from tabulate import tabulate
from sklearn.linear_model import LinearRegression
import csv
import math

Active_meas = []
Active_ADC = []
Static_meas = []
Static_ADC = []
Voltage_meas = []
Voltage_ADC = []

Active_spec = 1.0
Static_spec = 1.0
Voltage_spec = 1.0

test_channel = input("Enter channel for test: OIS: 0, AF: 1, VDDM: 2. Default: OIS")
test_channel = int(test_channel)
measure_mode = input("Enter outputs to measaure: All: 0, Active: 1, Static: 2, Voltage: 3")
measure_mode = int(measure_mode)

channel_names = ["OIS", "AF", "VDDM"]
test_channel_name = channel_names[test_channel]

if measure_mode == 0 or measure_mode == 1:
    f = open('./output/test_active_{}.csv'.format(test_channel_name), 'r', encoding='utf-8', newline="")

    reader = csv.reader(f)
    #for line in reader:
    Active_sample_num = 0
    for line in reader:
        Active_sample_num += 1
        for i, x in enumerate(line):
        # print("Index: {} - Value: {}".format(i, x))
            temp = float(x)
            if i == 0:
                Active_meas.append(temp * 1000)
            else:
                Active_ADC.append(temp)

    f.close()


    print(Active_sample_num)
    Active_samples = np.linspace(0, Active_sample_num - 1, Active_sample_num)
    Active_corrected = []
    Active_error = []
    Active_slope = (Active_meas[Active_sample_num - 1] - Active_meas[50]) / (Active_ADC[Active_sample_num - 1] - Active_ADC[50])
    Active_zero = ((Active_ADC[50] * Active_slope) - (Active_meas[50]))
    print(Active_zero, Active_slope)
    for i in range(Active_sample_num):
        Active_corrected.append((Active_ADC[i] * Active_slope) - Active_zero)
        Active_error.append(Active_corrected[i] - Active_meas[i])

if test_channel != 2 and (measure_mode == 0 or measure_mode == 2):
    f = open('./output/test_static_{}.csv'.format(test_channel_name), 'r', encoding='utf-8', newline="")

    reader = csv.reader(f)
    Static_sample_num = 0
    for line in reader:
        Static_sample_num += 1
        for i, x in enumerate(line):
        # print("Index: {} - Value: {}".format(i, x))
            temp = float(x)
            if i == 0:
                Static_meas.append(temp * 1000)
            else:
                Static_ADC.append(temp)
    f.close()


    print(Static_sample_num)
    Static_samples = np.linspace(0, Static_sample_num - 1, Static_sample_num)

    Static_corrected = []
    Static_error = []
    Static_slope = (Static_meas[Static_sample_num - 1] - Static_meas[100]) / (Static_ADC[Static_sample_num - 1] - Static_ADC[100])
    Static_zero = ((Static_ADC[100] * Static_slope) - (Static_meas[100]))
    print(Static_zero, Static_slope)
    for i in range(Static_sample_num):
        Static_corrected.append((Static_ADC[i] * Static_slope) - Static_zero)
        Static_error.append(Static_corrected[i] - Static_meas[i])

if measure_mode == 0 or measure_mode == 3:
    f = open('./output/test_voltage_{}.csv'.format(test_channel_name), 'r', encoding='utf-8', newline="")

    reader = csv.reader(f)
#for line in reader:
    Voltage_sample_num = 0
    for line in reader:
        Voltage_sample_num += 1
        for i, x in enumerate(line):
        # print("Index: {} - Value: {}".format(i, x))
            temp = float(x)
            if i == 0:
                Voltage_meas.append(temp *1000)
            else:
                Voltage_ADC.append(temp)
    f.close()


    print(Voltage_sample_num)
    Voltage_samples = np.linspace(0, Voltage_sample_num - 1, Voltage_sample_num)
    Voltage_corrected = []
    Voltage_error = []
    Voltage_slope = (Voltage_meas[Voltage_sample_num - 300] - Voltage_meas[100]) / (Voltage_ADC[Voltage_sample_num - 300] - Voltage_ADC[100])
    Voltage_zero = ((Voltage_ADC[100] * Voltage_slope) - (Voltage_meas[100]))
    print(Voltage_zero, Voltage_slope)
    for i in range(Voltage_sample_num):
        Voltage_corrected.append((Voltage_ADC[i] * Voltage_slope) - Voltage_zero)
        Voltage_error.append(Voltage_corrected[i]-Voltage_meas[i])

if measure_mode == 0:

    Active_MSE = np.square(Active_error).mean()
    Active_RMSE = math.sqrt(Active_MSE)

    Static_MSE = np.square(Static_error).mean()
    Static_RMSE = math.sqrt(Static_MSE)

    Voltage_MSE = np.square(Voltage_error).mean()
    Voltage_RMSE = math.sqrt(Voltage_MSE)

    if test_channel == 2:
        figure, axis = plt.subplots(2, 2)
    else:
        figure, axis = plt.subplots(2, 3)
    axis[0,1].step(Active_samples, Active_corrected)
    axis[0,1].step(Active_samples, Active_meas)
    axis[0,1].set_title("Active current {}".format(test_channel_name))
    axis[0,1].set_xlabel("Load current [mA]")
    axis[0,1].set_ylabel("Measured current [mA]")

    axis[1,1].step(Active_samples, Active_error, 'tab:green')
    axis[1,1].set_title("Active current error{}".format(test_channel_name))
    axis[1,1].set_xlabel("Load current [mA]")
    axis[1,1].set_ylabel("Error [mA]")
    axis[1,1].axhline(Active_spec, c='red')
    axis[1,1].axhline(-Active_spec, c='red')
    if test_channel != 2:
        axis[0,2].step(Static_samples, Static_corrected)
        axis[0,2].step(Static_samples, Static_meas)
        axis[0,2].set_title("Static current {}".format(test_channel_name))
        axis[0,2].set_xlabel("Load current [uA]")
        axis[0,2].set_ylabel("Measured current [uA]")

        axis[1, 2].step(Static_samples, Static_error, 'tab:green')
        axis[1, 2].set_title("Static current error{}".format(test_channel_name))
        axis[1, 2].set_xlabel("Load current [uA]")
        axis[1, 2].set_ylabel("Error [uA]")
        axis[1, 2].axhline(Static_spec, c='red')
        axis[1, 2].axhline(-Static_spec, c='red')

    axis[0,0].step(Voltage_samples, Voltage_corrected)
    axis[0,0].step(Voltage_samples, Voltage_meas)
    axis[0,0].set_title("Voltage output {}".format(test_channel_name))
    axis[0,0].set_xlabel("DAC code")
    axis[0,0].set_ylabel("Output voltage [mV]")

    axis[1, 0].step(Voltage_samples, Voltage_error, 'tab:green')
    axis[1, 0].set_title("Voltage error{}".format(test_channel_name))
    axis[1, 0].set_xlabel("DAC code")
    axis[1, 0].set_ylabel("Error [mV]")
    axis[1, 0].axhline(Voltage_spec, c='red')
    axis[1, 0].axhline(-Voltage_spec, c='red')

    plt.show()

elif measure_mode == 1:

    figure, axis = plt.subplots(2, 1)
    axis[0].step(Active_samples, Active_corrected)
    axis[0].step(Active_samples, Active_meas)
    axis[0].set_title("Active current {}".format(test_channel_name))
    axis[0].set_xlabel("Load current [mA]")
    axis[0].set_ylabel("Measured current [mA]")

    axis[1].step(Active_samples, Active_error, 'tab:green')
    axis[1].set_title("Active current error{}".format(test_channel_name))
    axis[1].set_xlabel("Load current [mA]")
    axis[1].set_ylabel("Error [mA]")
    axis[1].axhline(Active_spec, c='red')
    axis[1].axhline(-Active_spec, c='red')
    plt.show()
elif measure_mode == 2 and test_channel != 2:
    figure, axis = plt.subplots(2, 1)
    axis[0].step(Static_samples, Static_corrected)
    axis[0].step(Static_samples, Static_meas)
    axis[0].set_title("Static current {}".format(test_channel_name))
    axis[0].set_xlabel("Load current [uA]")
    axis[0].set_ylabel("Measured current [uA]")

    axis[1].step(Static_samples, Static_error, 'tab:green')
    axis[1].set_title("Static current error{}".format(test_channel_name))
    axis[1].set_xlabel("Load current [uA]")
    axis[1].set_ylabel("Error [uA]")
    axis[1].axhline(Static_spec, c='red')
    axis[1].axhline(-Static_spec, c='red')

    plt.show()
elif measure_mode == 3:
    figure, axis = plt.subplots(2, 1)
    axis[0].step(Voltage_samples, Voltage_corrected)
    axis[0].step(Voltage_samples, Voltage_meas)
    axis[0].set_title("Voltage output {}".format(test_channel_name))
    axis[0].set_xlabel("DAC code")
    axis[0].set_ylabel("Output voltage [mV]")

    axis[1].step(Voltage_samples, Voltage_error, 'tab:green')
    axis[1].set_title("Voltage error {}".format(test_channel_name))
    axis[1].set_xlabel("DAC code")
    axis[1].set_ylabel("Error [mV]")
    axis[1].axhline(Voltage_spec, c='red')
    axis[1].axhline(-Voltage_spec, c='red')

    plt.show()