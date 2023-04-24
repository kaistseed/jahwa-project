#!/bin/bash
########################################################################
#                          [ Shell Script ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 03/20/2023
# File Name             : compile_protos.sh                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6     
#                                     
# Description           : Compile protolib for grpc to python library       
########################################################################
# Set directory variables
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
GPIO_DIR=$SCRIPT_DIR/protolib/gpio
MEISSNER_DIR=$SCRIPT_DIR/protolib/meissner
SPI_DIR=$SCRIPT_DIR/protolib/spi

# Check directory
if [ ! -d "$GPIO_DIR" ]; then
    echo "[ERROR] GPIO protolib directory not found"
    exit 1
fi

if [ ! -d "$MEISSNER_DIR" ]; then
    echo "[ERROR] Meissner protolib directory not found"
    exit 1
fi

if [ ! -d "$SPI_DIR" ]; then
    echo "[ERROR] SPI protolib directory not found"
    exit 1
fi

# Compile gpio protolib
echo "[NOTE] Compiling GPIO protolib"
cd ./protolib/gpio
python3 -m grpc_tools.protoc -I=$GPIO_DIR --python_out=$GPIO_DIR --grpc_python_out=$GPIO_DIR $GPIO_DIR/gpio.proto
sed -i 's/gpio_pb2/protolib.gpio.gpio_pb2/' gpio_pb2_grpc.py

# Compile meissner protolib
echo "[NOTE] Compiling Meissner protolib"
cd ../meissner
python3 -m grpc_tools.protoc -I=$MEISSNER_DIR --python_out=$MEISSNER_DIR --grpc_python_out=$MEISSNER_DIR $MEISSNER_DIR/meissner.proto
sed -i 's/meissner_pb2/protolib.meissner.meissner_pb2/' meissner_pb2_grpc.py

# Compile spi protolib
echo "[NOTE] Compiling SPI protolib"
cd ../spi
python3 -m grpc_tools.protoc -I=$SPI_DIR --python_out=$SPI_DIR --grpc_python_out=$SPI_DIR $SPI_DIR/spi.proto
sed -i 's/spi_pb2/protolib.spi.spi_pb2/' spi_pb2_grpc.py