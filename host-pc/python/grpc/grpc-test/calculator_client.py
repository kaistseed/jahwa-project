########################################################################
#                          [ Python Program ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/15/2023
# File Name             : calculator_client.py                                           
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
import asyncio

# gRPC generated python libraries
import protolib.calculator_pb2 as calculator_pb2
import protolib.calculator_pb2_grpc as calculator_pb2_grpc  

###################################################
##                  gRPC Function                ##         
###################################################
async def send_requests():
    # Create a gRPC channel
    async with grpc.aio.insecure_channel('localhost:50051') as channel:
        # Create a stub (client)
        stub = calculator_pb2_grpc.CalculatorServiceStub(channel)

        # Send multiple multiply requests
        tasks = []
        for i in range(10):
            tasks.append(stub.Multiply(calculator_pb2.MultiplyRequest(a=i, b=i)))

        # Send multiple add requests
        for i in range(10):
            tasks.append(stub.Add(calculator_pb2.AddRequest(a=i, b=i)))
        
        # Wait for all the requests to complete
        responses = await asyncio.gather(*tasks)

        # Print the responses
        for response in responses:
            print(response)

###################################################
##                  Main Function                ##
###################################################
if __name__ == '__main__':
    # Run the function
    asyncio.run(send_requests())


