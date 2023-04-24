########################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/21/2023
# File Name             : meissner.py                                           
#                                                                                
# Target Device         : PYNQ-Z1                                                     
# Tool Version          : Python >= 3.6                                          
#       
########################################################################

###################################################
##                Import Libraries               ##         
###################################################
# Python library
import time
import grpc

# gRPC generated python library
import protolib.meissner.meissner_pb2 as meissner_pb2
import protolib.meissner.meissner_pb2_grpc as meissner_pb2_grpc

###################################################
##             Define Meissner Class             ##         
###################################################
class MeissnerService(meissner_pb2_grpc.MeissnerServicer):
    def __init__(self, *args, **kwargs):
        # Get PYNQ Meissner I2C object
        self.pynq_meissner = kwargs.get('pynq_meissner') if kwargs.get('pynq_meissner') is not None else None
        assert self.pynq_meissner is not None, "PYNQ Meissner I2C object is not defined!"

    ###############################################
    ##             Basic I2C Commands            ##         
    ###############################################
    # Read I2C method
    def ReadI2C(self, request, context):
        raise NotImplementedError
    
    # Write I2C method
    def WriteI2C(self, request, context):
        raise NotImplementedError

    ###############################################
    ##           Meissner Test Commands          ##         
    ###############################################
    # Reset sensor method
    def ResetSensor(self, request, context):
        # Start time
        start_time = str(time.time())
        # Reset sensor
        try:
            self.pynq_meissner.reset_sensor_single()
            success = True
        except:
            print("Reset sensor failed! Please try again.")
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Reset sensor', 
            'start_time': start_time, 
            'end_time': end_time, 
            'success': success
        }
        
        return meissner_pb2.ResetSensorResponse(**response)
    
    # Read sensor ID method
    def ReadSensorID(self, request, context):
        # Start time
        start_time = str(time.time())
        # Read sensor ID
        try:
            sensor_id = self.pynq_meissner.read_chip_id()
            success = True
        except:
            print("Read sensor ID failed! Please try again.")
            sensor_id = ''
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Read sensor ID', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_id': sensor_id, 
            'success': success
        }
        
        return meissner_pb2.ReadSensorIDResponse(**response)
    
    # Read sensor version method
    def ReadSensorVersion(self, request, context):
        # Start time
        start_time = str(time.time())
        # Read sensor version
        try:
            sensor_version = self.pynq_meissner.read_chip_ver()
            sensor_version = sensor_version[0] + sensor_version[1]
            success = sensor_version[2]
            if not(success):
                print("Assertion failed! Please check the sensor version.")
        except:
            print("Read sensor version failed! Please try again.")
            sensor_version = ''
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Read sensor version', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_version': sensor_version, 
            'success': success
        }
        
        return meissner_pb2.ReadSensorVersionResponse(**response)
    
    # Read sensor unique ID method
    def ReadSensorUniqueID(self, request, context):
        # Start time
        start_time = str(time.time())
        # Read sensor unique ID
        try:
            sensor_unique_id = self.pynq_meissner.read_unique_id()
            sensor_unique_id = sensor_unique_id[0] + sensor_unique_id[1]
            success = True
        except:
            print("Read sensor unique ID failed! Please try again.")
            sensor_unique_id = ''
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Read sensor unique ID', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_unique_id': sensor_unique_id, 
            'success': success
        }
        
        return meissner_pb2.ReadSensorUniqueIDResponse(**response)
    
    # Test I2C connection method
    def TestI2CConnection(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test I2C connection
        try:
            sensor_id = self.pynq_meissner.test_i2c_comm()
            success = sensor_id[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test I2C connection failed! Please try again.")
            sensor_id = ['']
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test I2C connection', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sensor_id': sensor_id[0], 
            'success': success
        }
        
        return meissner_pb2.TestI2CConnectionResponse(**response)
    
    # Test sensor temperature method
    def TestSensorTemperature(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test sensor temperature
        try:
            sensor_temperature = self.pynq_meissner.test_temp_read()
            success = sensor_temperature[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test sensor temperature failed! Please try again.")
            sensor_temperature = [0.0, 0.0, 0.0, 0.0]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test sensor temperature', 
            'start_time': start_time, 
            'end_time': end_time, 
            'int_temp': sensor_temperature[0],
            'ext_voltage': sensor_temperature[1],
            'ext_current': sensor_temperature[2],
            'ext_resistance': sensor_temperature[3],
            'success': success
        }
        
        return meissner_pb2.TestSensorTemperatureResponse(**response)
    
    # Test sensor supply voltage method
    def TestSensorSupplyVoltage(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test sensor supply voltage
        try:
            sensor_supply_voltage = self.pynq_meissner.test_supply_sensor_voltage()
            success = sensor_supply_voltage[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test sensor supply voltage failed! Please try again.")
            sensor_supply_voltage = [0.0, 0.0, 0.0]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test sensor supply voltage', 
            'start_time': start_time, 
            'end_time': end_time, 
            'vdda': sensor_supply_voltage[0],
            'vddp_af': sensor_supply_voltage[1],
            'vddp_ois': sensor_supply_voltage[2], 
            'success': success
        }
        
        return meissner_pb2.TestSensorSupplyVoltageResponse(**response)
    
    # Test sensor output voltage method
    def TestSensorOutputVoltage(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test sensor output voltage
        try:
            sensor_output_voltage = self.pynq_meissner.test_output_voltage()
            success = sensor_output_voltage[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test sensor output voltage failed! Please try again.")
            sensor_output_voltage = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0,]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test sensor output voltage', 
            'start_time': start_time, 
            'end_time': end_time, 
            'vout_ois_b1': sensor_output_voltage[0],
            'vout_ois_b2': sensor_output_voltage[1],
            'vout_af_b3': sensor_output_voltage[2],
            'res_ois_b1': sensor_output_voltage[3],
            'res_ois_b2': sensor_output_voltage[4],
            'res_af_b3': sensor_output_voltage[5],
            'success': success
        }
        
        return meissner_pb2.TestSensorOutputVoltageResponse(**response)
    
    # Test AFE sensor connectivity method
    def TestAFESensorConnectivity(self, request, context):
        # Start time
        start_time = str(time.time())
        # Test AFE sensor connectivity
        try:
            sensor_connectivity = self.pynq_meissner.test_afe_connectivity()
            success = sensor_connectivity[-1]
            if not(success):
                print("Standby to active mode failed! Please try again.")
        except:
            print("Test AFE sensor connectivity failed! Please try again.")
            sensor_connectivity = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0,]
            success = False
        # End time
        end_time = str(time.time())

        # Return response
        response = {
            'operation_name': 'Test AFE sensor connectivity', 
            'start_time': start_time, 
            'end_time': end_time, 
            'sense_open_s1_p': sensor_connectivity[0], 
            'sense_open_s1_n': sensor_connectivity[1],
            'sense_open_s2_p': sensor_connectivity[2],
            'sense_open_s2_n': sensor_connectivity[3],
            'sense_open_z1_p': sensor_connectivity[4],
            'sense_open_z1_n': sensor_connectivity[5],
            'success': success
        }
        
        return meissner_pb2.TestAFESensorConnectivityResponse(**response)

    ###############################################
    ##           Pattern-Based Commands          ##         
    ###############################################
    # Pattern loading method
    def PatternLoading(self, request, context):
        raise NotImplementedError("Pattern loading not implemented yet.")
    
    # Pattern run method
    def PatternRun(self, request, context):
        raise NotImplementedError("Pattern run not implemented yet.")
    
    # Pattern check status method
    def PatternCheckStatus(self, request, context):
        raise NotImplementedError("Pattern check status not implemented yet.")
    
    # Pattern get data method
    def PatternGetData(self, request, context):
        raise NotImplementedError("Pattern get data not implemented yet.")