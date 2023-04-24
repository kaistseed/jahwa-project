########################################################################
#                          [ Python Program ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/15/2023
# File Name             : calculator_server.py                                           
#                                                                                
# Target Device         : PYNQ-Z1                                                     
# Tool Version          : Python >= 3.6                                          
#       
########################################################################

###################################################
##                Import Libraries               ##
###################################################
# Python Standard Library
import grpc
import time
import threading
from concurrent import futures

# gRPC generated python libraries
import protolib.calculator_pb2 as calculator_pb2
import protolib.calculator_pb2_grpc as calculator_pb2_grpc

###################################################
##                  gRPC Function                ##
###################################################
class CalculatorService(calculator_pb2_grpc.CalculatorServiceServicer):
    def __init__(self):
        self.request_buffer = []
        self.is_processing = False

    def Add(self, request, context):
        print("Add request received")
        self.request_buffer.append(request)
        return calculator_pb2.AddResponse(result=request.a + request.b)
    
    def Multiply(self, request, context):
        print("Multiply request received")
        self.request_buffer.append(request)
        return calculator_pb2.MultiplyResponse(result=request.a * request.b)
    
    def StartProcessing(self):
        while True:
            time.sleep(0.1)

            if len(self.request_buffer) > 0 and not self.is_processing:
                t = threading.Thread(target=self.ProcessRequests)
                t.start()
    
    def ProcessRequests(self):
        self.is_processing = True

        while len(self.request_buffer) > 0:
            request = self.request_buffer.pop(0)

            if type(request) == calculator_pb2.AddRequest:
                print("Add request processed")
            elif type(request) == calculator_pb2.MultiplyRequest:
                print("Multiply request processed")
        
        self.is_processing = False

###################################################
##                  Main Function                ##
###################################################
if __name__ == '__main__': 
    # Create a gRPC server
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    calculator_pb2_grpc.add_CalculatorServiceServicer_to_server(CalculatorService(), server)

    # Listen on port 50051
    print('Starting server. Listening on port 50051.')
    server.add_insecure_port('[::]:50051')
    server.start()

    # Start processing requests
    CalculatorService().StartProcessing()

    # Keep the server running
    try:
        while True:
            time.sleep(86400)
    except KeyboardInterrupt:
        server.stop(0)

        
