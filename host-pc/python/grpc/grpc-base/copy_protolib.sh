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
# File Name             : copy_protolib.sh                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6     
#                                     
# Description           : Copy protolib to client/server directory       
########################################################################
# Set directory variables
ROOT_DIR=$(dirname $(dirname $(dirname $(pwd))))
PC_DIR=$ROOT_DIR/host-pc/python/$(basename $(pwd))
FPGA_DIR=$ROOT_DIR/fpga-board/python/$(basename $(pwd))
PC_PROTOLIB_DIR=$PC_DIR/protolib
FPGA_PROTOLIB_DIR=$FPGA_DIR/protolib

# Check directory
if [ ! -d "$PC_PROTOLIB_DIR" ]; then
    echo "[ERROR] protolib directory not found"
    exit 1
fi

# Copy protolib
echo "[INFO] Copying protolib..."
cp -r $PC_PROTOLIB_DIR/. $FPGA_PROTOLIB_DIR

# Change CRLF to LF
echo "[INFO] Changing CRLF to LF..."
FPGA_PROTO_FILES=$(find $FPGA_PROTOLIB_DIR/ -type f -name "*.proto")

for PROTO_FILE in $FPGA_PROTO_FILES
do
    echo "[INFO] Changing CRLF to LF in $(basename "$PROTO_FILE")"
    vim $PROTO_FILE -c "set ff=unix" -c "wq"
done