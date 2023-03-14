#!/bin/bash
########################################################################
#                          [ Shell Script ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 02/26/2023
# File Name             : compile_protolib.sh                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6     
#                                     
# Description           : Compile protolib for grpc to python library       
########################################################################
# Set directory variables
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
PROTOLIB_DIR=$SCRIPT_DIR/protolib

# Check directory
if [ ! -d "$PROTOLIB_DIR" ]; then
    echo "[ERROR] protolib directory not found"
    exit 1
fi

# Compile gpio protolib
echo "[NOTE] Compiling protolib"
cd ./protolib
python3 -m grpc_tools.protoc -I=$PROTOLIB_DIR --python_out=$PROTOLIB_DIR --grpc_python_out=$PROTOLIB_DIR $PROTOLIB_DIR/calculator.proto
sed -i 's/calculator_pb2/protolib.calculator_pb2/' calculator_pb2_grpc.py