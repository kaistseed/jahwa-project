# Import python library
import re
import sys
import csv
import json
import asyncio
import argparse
import os.path
from pathlib import Path

# Import PYNQ library
from pynq import GPIO
from pynq import Overlay
from pynq.lib import AxiGPIO
from pynq.lib.iic import AxiIIC

# Import sensor library
from pymeissner_ori import *

# Argparse setup
parser = argparse.ArgumentParser()
parser.add_argument("--host", help="Host IP address (default 0.0.0.0)", action="store_true")
parser.add_argument("--port", help="Port number (default 5555)", action="store_true")
args = parser.parse_args()

# Declare host and port number
HOST = args.host if args.host else "0.0.0.0"
PORT = args.port if args.port else 5555

# Define function for handling connection from client
async def handle_echo(reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
    # Declare variables
    data = None
    json_msg = {'command':'', 'payload':''}
    inst_sequence = []

    # Wait for client to send data
    while json_msg["command"] != "FINISH":
        # Wait for client data
        data = await reader.read(1024)
        addr, port = writer.get_extra_info("peername")
        
        # Decode data
        msg = data.decode()
        json_msg = json.loads(msg)
        print("Received {} from {}:{}".format(json_msg["command"], addr, port))
        print("\n")

        # Send data back to client
        # print("Send {} to {}:{}\n".format(data, addr, port))
        writer.write(data)
        await writer.drain()

        # Store instruction to list
        if json_msg["command"] == "DATA":
            inst_sequence.append(json_msg["payload"])

        # Run instruction when receiving start
        if json_msg["command"] == "START":
            # Go through instruction buffer
            for i in range(len(inst_sequence)):
                if inst_sequence[i]["operation"] == "run_function":
                    # Check which function to execute
                    if inst_sequence[i]["data"] == "test_i2c_comm":
                        print("Instruction: ", inst_sequence[i])
                        print("Running connectivity check on sensor")
                        try:
                            MEISSNERI2C.test_i2c_comm()
                        except:
                            MEISSNERI2C.test_i2c_comm()
                        print("\n")
                    elif inst_sequence[i]["data"] == "test_supply_sensor_voltage":
                        print("Instruction: ", inst_sequence[i])
                        print("Reading supply voltage at sensor pins")
                        try:
                            MEISSNERI2C.test_supply_sensor_voltage()
                        except:
                            MEISSNERI2C.test_supply_sensor_voltage()
                        print("\n")
                    elif inst_sequence[i]["data"] == "test_temp_read":
                        print("Instruction: ", inst_sequence[i])
                        print("Reading sensor temperature")
                        try:
                            MEISSNERI2C.test_temp_read()
                        except:
                            MEISSNERI2C.test_temp_read()
                        print("\n")
                    elif inst_sequence[i]["data"] == "test_afe_sensor_conn":
                        print("Instruction: ", inst_sequence[i])
                        print("Running AFE connectivity check")
                        try:
                            MEISSNERI2C.test_afe_sensor_conn()
                        except:
                            MEISSNERI2C.test_afe_sensor_conn()
                        print("\n")
                    elif inst_sequence[i]["data"] == "test_output_voltage":
                        print("Instruction: ", inst_sequence[i])
                        print("Reading output voltage")
                        try:
                            MEISSNERI2C.test_output_voltage()
                        except:
                            MEISSNERI2C.test_output_voltage()
                        print("\n")
                    else:
                        print("Function not yet implemented!")
                        print("\n")

    # # NOTE: Debugging codes -printing instruction list content
    # print("=====================================================")
    # print("=             Printing Instruction List             =")
    # print("=====================================================")
    # for i in range(len(inst_sequence)):
    #     print(inst_sequence[i])
    # print("\n")
    
    # Close connection
    print("Closing connection to {}\n".format(addr))
    writer.close()
    await writer.wait_closed()

# Define function to start server
async def run_server() -> None:
    server = await asyncio.start_server(handle_echo, HOST, PORT)
    async with server:
        await server.serve_forever()

# Define main function
if __name__ == "__main__":
    print("=====================================================")
    print("=               Loading FPGA Overlay                =")
    print("=====================================================")
    # Load overlay
    ol = Overlay('./bitstream/axi_iic_interrupt.bit')
    # Check overlay
    for key, value in ol.ip_dict.items():
        print("IP block: ", key)
    print("\n")


    print("=====================================================")
    print("=             Configuring AXI I2C IP                =")
    print("=====================================================")
    # Instantiate I2C controller
    i2c_control = ol.ip_dict['axi_iic_0']
    # Declare AXI I2C Instance
    AXII2C = AxiIIC(i2c_control)
    MEISSNERI2C = MeissnerI2C(AXII2C, 0x74, 0x77)
    # Test sensor connectivity
    try:
        MEISSNERI2C.test_i2c_comm()
    except:
        MEISSNERI2C.test_i2c_comm()
    print("\n")


    print("=====================================================")
    print("=          Starting TCP Server on PYNQ-Z1           =")
    print("=====================================================")
    loop = asyncio.get_event_loop()
    loop.run_until_complete(asyncio.gather(run_server()))