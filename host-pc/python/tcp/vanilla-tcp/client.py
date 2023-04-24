#################################################################
#                      [ Python Code ]
#
# Created by        : Dalta Imam Maulana - KAIST SEED Lab
#
# Project Name      : Jahwa - Sensor Control
#
# Create Date       : 01/19/2023
# File Name         : client.py
#
# Description       : -
#
#################################################################

# Import library
import csv
import time
import json
import asyncio
import argparse
import numpy as np
import datetime as dt
from datetime import datetime

# Declare list to store IIC readings
send_buffer = []
recv_buffer = []

# Argparse setup
parser = argparse.ArgumentParser()
parser.add_argument("--server", help="Server IP address (default 192.168.2.99)", action="store_true")
parser.add_argument("--port", help="Port number (default 5555)", action="store_true")
args = parser.parse_args()

# Declare server IP and port number
server = args.server if args.server else "192.168.2.99"
port = args.port if args.port else 5555

# NOTE: Debugging purpose
# Define function to populate message buffer
def populate_buffer() -> None:
    # Initial message
    send_buffer.append({
        'command': 'INIT',
        'payload': f"Connecting to PYNQ-Z1 Server"
    })

    # Read CSV
    with open('./function.txt', mode='r') as f:
        csv_reader = csv.DictReader(f)
        inst_payload = list(csv_reader)

    # Data message
    for i in range(len(inst_payload)):
        send_buffer.append({
            'command': 'DATA',
            'payload': inst_payload[i]
        })

    # Final message
    send_buffer.append({
        'command': 'START',
        'payload': f"Start data acquisition operation on PYNQ-Z1"
    })

    # Final message
    send_buffer.append({
        'command': 'FINISH',
        'payload': f"Closing connection to PYNQ-Z1 Server"
    })

# Define function to send data to the server
async def run_client() -> None:
    # Initialize connection to server
    reader, writer = await asyncio.open_connection(server, port)

    # Send initial message to server
    writer.write(json.dumps(send_buffer[0]).encode())
    await writer.drain()
    data = await reader.read(1024)
    if not data:
        raise Exception("Connection rejected by PYNQ server!")

    # Send data to server
    for i in range(len(send_buffer)-1):
        writer.write(json.dumps(send_buffer[i+1]).encode())
        await writer.drain()
        data = await reader.read(1024)
        
        # Store message from server
        msg = data.decode()
        recv_buffer.append(msg)

    # # Close connection
    # writer.write(b"Quit")
    # await writer.drain()
    # data = await reader.read(1024)

# Main function
if __name__ == "__main__":
    print("=====================================================")
    print("=             Starting TCP Client on PC             =")
    print("=====================================================")
    
    # Populate message buffer
    populate_buffer()

    # Start client
    loop = asyncio.get_event_loop()
    loop.run_until_complete(asyncio.gather(run_client()))

    # Stop client
    loop.close()

    # Print received message
    for i in range(len(recv_buffer)):
        print(recv_buffer[i])