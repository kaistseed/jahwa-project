#####################################################################
##                         Import Libraries                        ##         
#####################################################################
# Built-in libraries
import os
import logging
import asyncio
from collections import OrderedDict

# Pymodbus libraries
from pymodbus.constants import Endian
from pymodbus.payload import (
    BinaryPayloadBuilder,
    BinaryPayloadDecoder,   
)

#####################################################################
##                   Define Modbus Pattern Class                   ##         
#####################################################################
# Define Modbus Pattern class
class ModbusPattern:
    def __init__(self, client):
        # Start the logger
        self._logger = logging.getLogger()
        # Set client
        self.client = client

    ##################################################################
    ##                    Define Helper Function                    ##         
    ##################################################################
    # Define function to decode payload
    def _DecodePayload(self, payload, payload_name, **kwargs):
        # Get endianness
        word_endian = kwargs.get("word_endian", Endian.Big)
        byte_endian = kwargs.get("byte_endian", Endian.Big)
        
        # Initialize decoder
        decoder = BinaryPayloadDecoder(
            payload.registers, # pylint: disable=no-member
            wordorder=word_endian,
            byteorder=byte_endian
        )

        # Create dictionary to store decoded payload
        decoded_payload = OrderedDict()

        # Decode payload based on payload name
        # Read Pattern Status
        if payload_name == "pattern_get_status":
            decoded_payload["status"] = decoder.decode_32bit_uint()
        # Read Pattern Data
        elif payload_name == "pattern_get_data":
            for i in range(4):
                decoded_payload["data"].append(decoder.decode_8bit_uint())
        # Raise error if payload name is not defined
        else:
            raise ValueError("Payload name is not defined.")

        # Return decoded payload
        return decoded_payload
    
    ##################################################################
    ##                      Define Data Builder                     ##         
    ##################################################################
    def _BuildData(self, pattern_name, **kwargs):
        # Get endianness
        word_endian = kwargs.get("word_endian", Endian.Big)
        byte_endian = kwargs.get("byte_endian", Endian.Big)

        # Initialize builder
        builder = BinaryPayloadBuilder(
            byteorder=byte_endian,
            wordorder=word_endian
        )

        # Build data based on pattern name
        # Write Pattern Data
        if pattern_name == "pattern_loading":
            # Get command ID
            command_id = kwargs.get("command_id", 0)
            # Get write slave address
            wr_slave_address = kwargs.get("write_slave_address", 0)
            # Get read slave address
            rd_slave_address = kwargs.get("read_slave_address", 0)
            # Get write packet size
            wr_packet_size = kwargs.get("write_packet_size", 1)
            # Get read packet size
            rd_packet_size = kwargs.get("read_packet_size", 1)
            # Get block count
            block_count = kwargs.get("block_count", 1)
            # Get measure count
            measure_count = kwargs.get("measure_count", 1)
            # Get write interval in us
            wr_interval_us = kwargs.get("write_interval_us", 0)
            # Get measure interval in us
            measure_interval_us = kwargs.get("measure_interval_us", 0)
            # Get delay from write to measure in us
            delay_wr_to_meas_us = kwargs.get("delay_wr_to_meas_us", 0)
            # Calculate write buffer size
            wr_buffer_size = wr_packet_size * block_count * measure_count
            # Get write buffer
            wr_buffer = kwargs.get("write_buffer", [0 for i in range(wr_buffer_size)])

            # Add data to builder
            builder.add_32bit_uint(command_id)
            builder.add_32bit_uint(wr_slave_address)
            builder.add_32bit_uint(rd_slave_address)
            builder.add_32bit_uint(wr_packet_size)
            builder.add_32bit_uint(rd_packet_size)
            builder.add_32bit_uint(block_count)
            builder.add_32bit_uint(measure_count)
            builder.add_32bit_uint(wr_interval_us)
            builder.add_32bit_uint(measure_interval_us)
            builder.add_32bit_uint(delay_wr_to_meas_us)
            for i in range(wr_buffer_size):
                builder.add_8bit_uint(wr_buffer[i])

            # Return builder
            return builder

        elif pattern_name == "pattern_run":
            # Get command ID
            command_id = kwargs.get("command_id", 0)

            # Add data to builder
            builder.add_32bit_uint(command_id)

            # Return builder
            return builder

        elif pattern_name == "pattern_get_data":
            # Get read buffer size
            rd_buffer_size = kwargs.get("read_buffer_size", 1)
            # Get number of LDO channel 0 current measurement sample
            num_ldo_ch0_curr_meas = kwargs.get("num_ldo_ch0_curr_meas", 2)
            # Get number of LDO channel 0 voltage measurement sample
            num_ldo_ch0_volt_meas = kwargs.get("num_ldo_ch0_volt_meas", 2)
            # Get number of LDO channel 1 current measurement sample
            num_ldo_ch1_curr_meas = kwargs.get("num_ldo_ch1_curr_meas", 2)
            # Get number of LDO channel 1 voltage measurement sample
            num_ldo_ch1_volt_meas = kwargs.get("num_ldo_ch1_volt_meas", 2)

            # Add data to builder
            builder.add_32bit_uint(rd_buffer_size)
            builder.add_32bit_uint(num_ldo_ch0_curr_meas)
            builder.add_32bit_uint(num_ldo_ch0_volt_meas)
            builder.add_32bit_uint(num_ldo_ch1_curr_meas)
            builder.add_32bit_uint(num_ldo_ch1_volt_meas)

            # Return builder
            return builder

        # Raise error if pattern name is not defined
        else:
            raise ValueError("Pattern name is not defined.")
        
    ##################################################################
    ##                 Define Pattern Loading Method                ##         
    ##################################################################
    async def Load(self, **kwargs):
        # Define local variables
        write_addr = 0
        slave = 76 # NOTE: 76 is ASCII code for 'L'
        pattern_name = "pattern_loading"

        # Build data
        builder = self._BuildData(pattern_name, **kwargs)

        # Convert data builder to register
        registers = builder.to_registers()

        # Write payload to server
        self._logger.info(f"Performing write operation for pattern loading to address {write_addr} of slave {slave}")
        rr = await self._client.write_registers(write_addr, registers, unit=slave)
        assert not rr.isError()

    ##################################################################
    ##                   Define Pattern Run Method                  ##         
    ##################################################################
    async def Run(self, **kwargs):
        # Define local variables
        write_addr = 0
        slave = 85 # NOTE: 85 is ASCII code for 'U'
        pattern_name = "pattern_run"

        # Build data
        builder = self._BuildData(pattern_name, **kwargs)

        # Convert data builder to register
        registers = builder.to_registers()

        # Write payload to server
        self._logger.info(f"Performing write operation for pattern run to address {write_addr} of slave {slave}")
        rr = await self._client.write_registers(write_addr, registers, unit=slave)
        assert not rr.isError()

    ##################################################################
    ##                Define Pattern Get Data Method                ##         
    ##################################################################
    async def GetData(self, **kwargs):
        # Define local variables
        status_addr = 0
        send_addr = 1
        read_addr = 2
        slave = 68 # NOTE: 68 is ASCII code for 'D'
        pattern_name = "pattern_get_data"

        # Build data
        builder = self._BuildData(pattern_name, **kwargs)

        # Convert data builder to register
        registers = builder.to_registers()

        # Write payload to server
        self._logger.info(f"Performing write operation for pattern get data (status) to address {send_addr} of slave {slave}")
        rr = await self._client.write_registers(send_addr, registers, unit=slave)
        assert not rr.isError()

        # Read payload from server
        read_get_data_status = 0

        # Read get data status until it is not 0
        while read_get_data_status == 0:
            # Read get data status
            rr = await self._client.read_holding_registers(address=status_addr, unit=slave)
            assert not rr.isError()
            
            # Decode payload
            decoded_status = self._DecodePayload(
                payload=rr.registers,
                pattern_name="pattern_get_status",
            )

            # Get get data status
            read_get_data_status = decoded_status["get_data_status"]

        # Read get data from server
        self._logger.info(f"Performing read operation for pattern get data from address {read_addr} of slave {slave}")
        rr = await self._client.read_holding_registers(address=read_addr, unit=slave)
        assert not rr.isError()

        # Decode payload
        decoded_data = self._DecodePayload(
            payload=rr.registers,
            pattern_name="pattern_get_data",
            **kwargs,
        )

        # Return decoded data
        return decoded_data