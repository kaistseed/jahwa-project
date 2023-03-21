########################################################################
#                          [ Python Program ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/21/2023
# File Name             : streaming_server.py                                           
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
from pathlib import Path
from tabulate import tabulate
from concurrent import futures

# PYNQ Library
from pynq import GPIO
from pynq import Overlay
from pynq.lib import AxiGPIO
from pynq.lib.iic import AxiIIC

# gRPC generated Python library
import protolib.spi.spi_pb2 as spi_pb2
import protolib.spi.spi_pb2_grpc as spi_pb2_grpc
import protolib.gpio.gpio_pb2 as gpio_pb2
import protolib.gpio.gpio_pb2_grpc as gpio_pb2_grpc
import protolib.meissner.meissner_pb2 as meissner_pb2
import protolib.meissner.meissner_pb2_grpc as meissner_pb2_grpc

# User-defined library
from library.grpc.spi import *
from library.grpc.gpio import *
from library.grpc.meissner import *
from library.pynq.pyspi import *
from library.pynq.pymeissner import *

###################################################
##             Define Helper Function            ##         
###################################################
def serve(*args, **kwargs):
    # Define host IP address and port
    host = kwargs.get('ip_addr') if kwargs.get('ip_addr') is not None else 'localhost'
    port = kwargs.get('port_num') if kwargs.get('port_num') is not None else 50051

    # Instantiate a gRPC server
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))

    # Bind the client and the server
    # SPI gRPC
    spi_service = kwargs.get('spi_service') if kwargs.get('spi_service') is not None else None
    assert spi_service is not None, "SPI gRPC service is not defined!"
    spi_pb2_grpc.add_SPIServicer_to_server(spi_service, server)

    # GPIO gRPC
    gpio_service = kwargs.get('gpio_service') if kwargs.get('gpio_service') is not None else None
    assert gpio_service is not None, "GPIO gRPC service is not defined!"
    gpio_pb2_grpc.add_GPIOServicer_to_server(gpio_service, server)

    # Meissner gRPC
    meissner_service = kwargs.get('meissner_service') if kwargs.get('meissner_service') is not None else None
    assert meissner_service is not None, "Meissner gRPC service is not defined!"
    meissner_pb2_grpc.add_MeissnerServicer_to_server(meissner_service, server)

    # Start the server
    server.add_insecure_port('{}:{}'.format(host, port))
    server.start()

    # Keep the server running
    try:
        server.wait_for_termination()
    except KeyboardInterrupt:
        server.stop(0)

###################################################
##                  Main Program                 ##         
###################################################
if __name__ == '__main__':
    print("=====================================================")
    print("=               Loading FPGA Overlay                =")
    print("=====================================================")
    # Load overlay
    ol = Overlay('bitstream/spi_iic_interrupt_v3.bit')
    # Print overlay information
    ip_block_list = []
    for i, items in enumerate(ol.ip_dict.items()):
        ip_block_list.append([i+1, items[0]])
    print(tabulate(
        ip_block_list, 
        headers=["IP Block Number", "IP Block Name"], 
        tablefmt="fancy_grid", 
        numalign="left"
    ))
    print()

    print("=====================================================")
    print("=             Configuring AXI GPIO IP               =")
    print("=====================================================")
    # Get AXI GPIO IP
    pynq_adc_io_ip = ol.ip_dict['axi_gpio_0'] 
    pynq_sdn_1_io_ip = ol.ip_dict['axi_gpio_1']
    pynq_sdn_2_io_ip = ol.ip_dict['axi_gpio_2']
    pynq_sdn_3_io_ip = ol.ip_dict['axi_gpio_3']
    # Map GPIO IP to AXI GPIO Class
    pynq_adc_io = AxiGPIO(pynq_adc_io_ip).channel1
    pynq_sdn_1_io = AxiGPIO(pynq_sdn_1_io_ip).channel1
    pynq_sdn_2_io = AxiGPIO(pynq_sdn_2_io_ip).channel1
    pynq_sdn_3_io = AxiGPIO(pynq_sdn_3_io_ip).channel1
    # Print status
    print("Successfully configured AXI GPIO IP")
    print()

    print("=====================================================")
    print("=             Configuring AXI QSPI IP               =")
    print("=====================================================")
    # Get AXI SPI IP
    spi_control = ol.axi_quad_spi_0
    # Map AXI SPI IP to SPI class
    pynq_spi = SPI(spi_control, 0, 0) # (spi_control, cpol, cpha)
    # Print status
    print("Successfully configured AXI QSPI IP")
    print()

    print("=====================================================")
    print("=         Configuring AXI Interrupt Timer           =")
    print("=====================================================")
    # Get AXI Interrupt Timer IP
    intr_timer_ip = ol.axi_timer_0
    # Map AXI Interrupt Timer IP to Timer Class
    intr_timer = intr_timer_ip.interrupt
    # Print status
    print("Successfully configured AXI interrupt timer")
    print()

    print("=====================================================")
    print("=             Configuring AXI I2C IP                =")
    print("=====================================================")
    # get AXI IIC IP
    i2c_control = ol.ip_dict['axi_iic_0']
    # Map AXI IIC IP to Meissner Class
    axi_i2c = AxiIIC(i2c_control)
    pynq_meissner = MeissnerI2C(axi_i2c, 0x74, 0x77, intr_timer_ip, intr_timer)
    # Print status
    print("Successfully configured AXI I2C IP")
    print()

    print("=====================================================")
    print("=             Configuring gRPC Server               =")
    print("=====================================================")
    # Declare gRPC service
    spi_service = SPIService(
        pynq_spi=pynq_spi, 
        pynq_adc_io=pynq_adc_io
    )
    
    gpio_service = GPIOService(
        pynq_sdn_1_io=pynq_sdn_1_io, 
        pynq_sdn_2_io=pynq_sdn_2_io, 
        pynq_sdn_3_io=pynq_sdn_3_io,
        pynq_adc_io=pynq_adc_io
    )
    
    meissner_service = MeissnerService(
        pynq_meissner=pynq_meissner
    )

    # Get IP address and port number from user
    ip_addr = input("Enter IP address, default is localhost: ")
    port_num = int(input("Enter port number, default is 50051: "))

    # Start gRPC server
    serve(
        ip_addr='ip_addr', 
        port_num=port_num, 
        spi_service=spi_service, 
        gpio_service=gpio_service, 
        meissner_service=meissner_service
    )
