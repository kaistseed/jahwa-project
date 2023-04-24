########################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/20/2023
# File Name             : meissner.py                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6                                          
#       
########################################################################

###################################################
##                Import Libraries               ##         
###################################################
# Python library
import grpc

# gRPC generated python library
import protolib.meissner.meissner_pb2 as meissner_pb2
import protolib.meissner.meissner_pb2_grpc as meissner_pb2_grpc

###################################################
##             Define Meissner Class             ##         
###################################################
class MeissnerClient(object):
    def __init__(self, *args, **kwargs):
        # Define host IP address and port
        self.host = kwargs.get('ip_addr') if kwargs.get('ip_addr') is not None else '192.168.2.99'
        self.port = kwargs.get('port_num') if kwargs.get('port_num') is not None else 50051
        
        # Instantiate a gRPC channel
        self.channel = grpc.insecure_channel(
            '{}:{}'.format(self.host, self.port))
        
        # Bind the client and the server
        self.stub = meissner_pb2_grpc.MeissnerStub(self.channel)

    ###############################################
    ##             Basic I2C Commands            ##         
    ###############################################
    # Read I2C method
    def read_i2c(self, address, length):
        # Create request
        request = meissner_pb2.ReadI2CPacket(
            address=address, 
            length=length
        )
        # Wait for response
        response = self.stub.ReadI2C(request)
        # Return response
        return response

    # Write I2C method
    def write_i2c(self, address, length, data):
        # Create request
        request = meissner_pb2.WriteI2CPacket(
            address=address,
            length=length,
            data=data
        )
        # Wait for response
        response = self.stub.WriteI2C(request)
        # Return response
        return response

    ###############################################
    ##           Meissner Test Commands          ##         
    ###############################################
    # Reset sensor method
    def reset_sensor(self):
        # Create request
        request = meissner_pb2.ResetSensorPacket()
        # Wait for response
        response = self.stub.ResetSensor(request)
        # Return response
        return response
    
    # Read sensor id method
    def read_sensor_id(self):
        # Create request
        request = meissner_pb2.ReadSensorIDPacket()
        # Wait for response
        response = self.stub.ReadSensorID(request)
        # Return response
        return response
    
    # Read sensor version method
    def read_sensor_version(self):
        # Create request
        request = meissner_pb2.ReadSensorVersionPacket()
        # Wait for response
        response = self.stub.ReadSensorVersion(request)
        # Return response
        return response
    
    # Read sensor unique id method
    def read_sensor_unique_id(self):
        # Create request
        request = meissner_pb2.ReadSensorUniqueIDPacket()
        # Wait for response
        response = self.stub.ReadSensorUniqueID(request)
        # Return response
        return response
    
    # Test I2C connection method
    def test_i2c_connection(self):
        # Create request
        request = meissner_pb2.TestI2CConnectionPacket()
        # Wait for response
        response = self.stub.TestI2CConnection(request)
        # Return response
        return response
    
    # Test sensor temperature method
    def test_sensor_temperature(self):
        # Create request
        request = meissner_pb2.TestSensorTemperaturePacket()
        # Wait for response
        response = self.stub.TestSensorTemperature(request)
        # Return response
        return response
    
    # Test sensor supply voltage method
    def test_sensor_supply_voltage(self):
        # Create request
        request = meissner_pb2.TestSensorSupplyVoltagePacket()
        # Wait for response
        response = self.stub.TestSensorSupplyVoltage(request)
        # Return response
        return response
    
    # Test sensor output voltage method
    def test_sensor_output_voltage(self):
        # Create request
        request = meissner_pb2.TestSensorOutputVoltagePacket()
        # Wait for response
        response = self.stub.TestSensorOutputVoltage(request)
        # Return response
        return response
    
    # Test AFE sensor connectivity method
    def test_afe_sensor_connectivity(self):
        # Create request
        request = meissner_pb2.TestAFESensorConnectivityPacket()
        # Wait for response
        response = self.stub.TestAFESensorConnectivity(request)
        # Return response
        return response
    
    ###############################################
    ##           Pattern-Based Commands          ##         
    ###############################################
    # Pattern load  
    def pattern_load_start(self, pattern):
        raise NotImplementedError
    
    # Pattern load end method
    def pattern_load_stop(self):
        raise NotImplementedError

    # Pattern run method
    def pattern_run(self):
        raise NotImplementedError
    
    # Pattern check status method
    def pattern_check_status(self):
        raise NotImplementedError
    
    # Pattern get data method
    def pattern_get_data(self):
        raise NotImplementedError