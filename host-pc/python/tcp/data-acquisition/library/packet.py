##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/10/2023
# File Name             : tcppacket.py                                           
#                                                                                
# Target Device         : PC                                                     
# Tool Version          : Python >= 3.6                                          
#       
##############################################################################

##############################################################################
#                              Import Libraries                              #
##############################################################################
# Python library
import struct

##############################################################################
#                        Define Packet Type Dictionary                       #
##############################################################################
# Define unit ID dictionary
unit_id_dict = {
    'write_i2c': b'W',
    'read_i2c': b'R',
    'pattern_loading': b'L',
    'pattern_run': b'U',
    'pattern_get_data': b'D',
    'ldo_voltage_set': b'S',
    'power_control': b'C',
    'burst_get_data': b'B',
    'burst_mode': b'C',
    'burst_write_delay': b'C',
    'burst_read_delay': b'C',
    'test_sequence': b'T',
    'quit': b'Q',
}

# Define burst command dictionary
burst_cmd_dict = {
    'power_control': 1,
    'burst_mode': 11,
    'burst_write_delay': 12,
    'burst_read_delay': 13,
}

# Define test sequence dictionary
test_sequence_dict = {
    'toggle_led': 1,
    'test_led': 2,
    'configure_dac': 3,
    'reset_sensor': 4,
    'read_chip_id': 5,
}

##############################################################################
#                           Define Helper Function                           #
##############################################################################
# Encode packet using struct
def encode_packet(type, *args, **kwargs):
    ##########################################################################
    #                                Write I2C                               #
    ##########################################################################
    if type == 'write_i2c':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'23'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'45'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'67'
        unit_id = b'W'

        # Get I2C command and data
        slave_addr = kwargs.get('slave_addr') if kwargs.get('slave_addr') is not None else 0
        addr_len = kwargs.get('addr_len') if kwargs.get('addr_len') is not None else 0
        data_len = kwargs.get('data_len') if kwargs.get('data_len') is not None else 0
        addr_buf = kwargs.get('addr_buf') if kwargs.get('addr_buf') is not None else ['0', '0', '0', '0']
        data_buf = kwargs.get('data_buf') if kwargs.get('data_buf') is not None else ['0', '0', '0', '0']

        # Convert address and data buffer to byte and combine them
        addr_buf = ''.join(addr_buf).encode('utf-8')
        data_buf = ''.join(data_buf).encode('utf-8')

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I I 4s 4s',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            slave_addr,
            addr_len,
            data_len,
            addr_buf,
            data_buf
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                                Read I2C                                #
    ##########################################################################
    elif type == 'read_i2c':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'21'
        unit_id = b'R'

        # Get I2C command and data
        slave_addr = kwargs.get('slave_addr') if kwargs.get('slave_addr') is not None else 0
        addr_len = kwargs.get('addr_len') if kwargs.get('addr_len') is not None else 0
        data_len = kwargs.get('data_len') if kwargs.get('data_len') is not None else 0
        addr_buf = kwargs.get('addr_buf') if kwargs.get('addr_buf') is not None else ['0', '0', '0', '0']
        data_buf = kwargs.get('data_buf') if kwargs.get('data_buf') is not None else ['0', '0', '0', '0']

        # Convert address and data buffer to byte and combine them
        addr_buf = ''.join(addr_buf).encode('utf-8')
        data_buf = ''.join(data_buf).encode('utf-8')

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I I 4s 4s',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            slave_addr,
            addr_len,
            data_len,
            addr_buf,
            data_buf
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                             Pattern Loading                            #
    ##########################################################################
    elif type == 'pattern_loading':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'21'
        unit_id = b'L'

        # Get I2C data
        cmd_id = kwargs.get('cmd_id') if kwargs.get('cmd_id') is not None else 0
        write_slave_addr = kwargs.get('write_slave_addr') if kwargs.get('write_slave_addr') is not None else 0
        read_slave_addr = kwargs.get('read_slave_addr') if kwargs.get('read_slave_addr') is not None else 0
        write_packet_size = kwargs.get('write_packet_size') if kwargs.get('write_packet_size') is not None else 0
        read_packet_size = kwargs.get('read_packet_size') if kwargs.get('read_packet_size') is not None else 0
        block_count = kwargs.get('block_count') if kwargs.get('block_count') is not None else 0
        measure_count = kwargs.get('measure_count') if kwargs.get('measure_count') is not None else 0
        write_interval_us = kwargs.get('write_interval_us') if kwargs.get('write_interval_us') is not None else 0
        measure_interval_us = kwargs.get('measure_interval_us') if kwargs.get('measure_interval_us') is not None else 0
        delay_from_write_to_measure_us = kwargs.get('delay_from_write_to_measure_us') if kwargs.get('delay_from_write_to_measure_us') is not None else 0
        write_buffer = kwargs.get('write_buffer') if kwargs.get('write_buffer') is not None else ['0'] * (write_packet_size * block_count * measure_count)

        # Convert write buffer to byte
        write_buffer = ''.join(write_buffer).encode('utf-8')

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I I I I I I I I I ' + str(write_packet_size * block_count * measure_count) + 's',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            cmd_id,
            write_slave_addr,
            read_slave_addr,
            write_packet_size,
            read_packet_size,
            block_count,
            measure_count,
            write_interval_us,
            measure_interval_us,
            delay_from_write_to_measure_us,
            write_buffer
        )

        # Return packet
        return packet

    ##########################################################################
    #                               Pattern Run                              #
    ##########################################################################
    elif type == 'pattern_run':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'23'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'45'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'67'
        unit_id = b'U'

        # Get I2C data
        cmd_id = kwargs.get('cmd_id') if kwargs.get('cmd_id') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            cmd_id
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                            Pattern Get Data                            #
    ##########################################################################
    elif type == 'pattern_get_data':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'21'
        unit_id = b'D'

        # Get I2C data
        read_buffer_size = kwargs.get('read_buffer_size') if kwargs.get('read_buffer_size') is not None else 0
        num_of_ldo_ch0_current = kwargs.get('num_of_ldo_ch0_current') if kwargs.get('num_of_ldo_ch0_current') is not None else 0
        num_of_ldo_ch0_voltage = kwargs.get('num_of_ldo_ch0_voltage') if kwargs.get('num_of_ldo_ch0_voltage') is not None else 0
        num_of_ldo_ch1_current = kwargs.get('num_of_ldo_ch1_current') if kwargs.get('num_of_ldo_ch1_current') is not None else 0
        num_of_ldo_ch1_voltage = kwargs.get('num_of_ldo_ch1_voltage') if kwargs.get('num_of_ldo_ch1_voltage') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I I I I',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            read_buffer_size,
            num_of_ldo_ch0_current,
            num_of_ldo_ch0_voltage,
            num_of_ldo_ch1_current,
            num_of_ldo_ch1_voltage
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                             LDO Voltage Set                            #
    ##########################################################################
    elif type == 'ldo_voltage_set':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
        unit_id = b'S'

        # Get I2C data
        channel = kwargs.get('channel') if kwargs.get('channel') is not None else 0
        voltage = kwargs.get('voltage') if kwargs.get('voltage') is not None else 0.0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I d',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            channel,
            voltage
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                              Power Control                             #
    ##########################################################################
    elif type == 'power_control':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
        unit_id = b'C'

        # Get I2C data
        command = kwargs.get('command') if kwargs.get('command') is not None else 1
        data = kwargs.get('data') if kwargs.get('data') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            command,
            data
        )

        # Return packet 
        return packet
    
    ##########################################################################
    #                             Burst Get Data                             #
    ##########################################################################
    elif type == 'burst_get_data':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
        unit_id = b'B'

        # Get I2C data
        read_packet_size = kwargs.get('read_packet_size') if kwargs.get('read_packet_size') is not None else 0
        read_count = kwargs.get('read_count') if kwargs.get('read_count') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            read_packet_size,
            read_count
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                               Burst Mode                               #
    ##########################################################################
    elif type == 'burst_mode':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'09'
        unit_id = b'C'

        # Get I2C data
        command = kwargs.get('command') if kwargs.get('command') is not None else 11
        data = kwargs.get('data') if kwargs.get('data') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            command,
            data
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                            Burst Write Delay                           #
    ##########################################################################
    elif type == 'burst_write_delay':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'9'
        unit_id = b'C'

        # Get I2C data
        command = kwargs.get('command') if kwargs.get('command') is not None else 12
        data = kwargs.get('data') if kwargs.get('data') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I',
            # '2s 2s 2s c I',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            command,
            data,
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                            Burst Read Delay                            #
    ##########################################################################
    elif type == 'burst_read_delay':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'9'
        unit_id = b'C'

        # Get I2C data
        command = kwargs.get('command') if kwargs.get('command') is not None else 13
        data = kwargs.get('data') if kwargs.get('data') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I I',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            command,
            data,
        )

        # Return packet
        return packet
    
    ##########################################################################
    #                              Test Sequence                             #
    ##########################################################################
    elif type == 'test_sequence':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
        unit_id = b'T'

        # Get I2C data
        sequence = kwargs.get('sequence') if kwargs.get('sequence') is not None else ''

        # Check whether sequence is valid or not
        if sequence not in test_sequence_dict.keys():
            raise ValueError('Invalid test sequence')

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I',
            transaction_id,
            protocol_id,
            length,
            unit_id,    
            test_sequence_dict[sequence]
        )

        # Return packet
        return packet

    ##########################################################################
    #                                  Quit                                  #
    ##########################################################################
    elif type == 'quit':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
        unit_id = b'Q'

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c',
            transaction_id,
            protocol_id,
            length,
            unit_id
        )

        # Return packet
        return packet

    else:
        raise NotImplementedError         
    
##############################################################################
#                                Decode Packet                               #
##############################################################################
def decode_packet(packet, **kwargs):
    ##########################################################################
    #                            Get Packet Header                           #
    ##########################################################################
    transaction_id = packet[0:2]
    protocol_id = packet[2:4]
    length = packet[4:6]
    unit_id = packet[6:7]
    
    ##########################################################################
    #                                Read I2C                                #
    ##########################################################################
    if unit_id == unit_id_dict['read_i2c']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, data_buf = struct.unpack(
            '2s 2s 2s c 4s',
            packet
        )
    
        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'data_buf': [chr(byte) for byte in data_buf]
        }
    
    ##########################################################################
    #                            Pattern Get Data                            #
    ##########################################################################
    elif unit_id == unit_id_dict['pattern_get_data']:
        # Get buffer size
        read_buffer_size = kwargs.get('read_buffer_size') if kwargs.get('read_buffer_size') is not None else 0
        num_of_ldo_ch0_current = kwargs.get('num_of_ldo_ch0_current') if kwargs.get('num_of_ldo_ch0_current') is not None else 0
        num_of_ldo_ch0_voltage = kwargs.get('num_of_ldo_ch0_voltage') if kwargs.get('num_of_ldo_ch0_voltage') is not None else 0
        num_of_ldo_ch1_current = kwargs.get('num_of_ldo_ch1_current') if kwargs.get('num_of_ldo_ch1_current') is not None else 0
        num_of_ldo_ch1_voltage = kwargs.get('num_of_ldo_ch1_voltage') if kwargs.get('num_of_ldo_ch1_voltage') is not None else 0

        # Struct format
        struct_format = '2s 2s 2s c ' + str(read_buffer_size) + 's ' + ('d ' * num_of_ldo_ch0_current) + \
            ('d ' * num_of_ldo_ch0_voltage) + ('d ' * num_of_ldo_ch1_current) + ('d ' * num_of_ldo_ch1_voltage)
        
        # Unpack packet
        unpacked_data = struct.unpack(
            struct_format,
            packet
        )

        # Define start index for parsing unpacked data
        ldo_ch0_current_start_idx = 5
        ldo_ch0_voltage_start_idx = ldo_ch0_current_start_idx + num_of_ldo_ch0_current
        ldo_ch1_current_start_idx = ldo_ch0_voltage_start_idx + num_of_ldo_ch0_voltage
        ldo_ch1_voltage_start_idx = ldo_ch1_current_start_idx + num_of_ldo_ch1_current

        # Return packet
        return {
            'transaction_id': unpacked_data[0],
            'protocol_id': unpacked_data[1],
            'length': unpacked_data[2],
            'unit_id': unpacked_data[3],
            'read_buffer': [chr(byte) for byte in unpacked_data[4]],
            'ldo_ch0_current': list(unpacked_data[ldo_ch0_current_start_idx:ldo_ch0_voltage_start_idx]),
            'ldo_ch0_voltage': list(unpacked_data[ldo_ch0_voltage_start_idx:ldo_ch1_current_start_idx]),
            'ldo_ch1_current': list(unpacked_data[ldo_ch1_current_start_idx:ldo_ch1_voltage_start_idx]),
            'ldo_ch1_voltage': list(unpacked_data[ldo_ch1_voltage_start_idx:])
        }
    
    ##########################################################################
    #                             Burst Get Data                             #
    ##########################################################################
    elif unit_id == unit_id_dict['burst_get_data']:
        # Get buffer size
        read_buffer_size = kwargs.get('read_buffer_size') if kwargs.get('read_buffer_size') is not None else 0

        # Unpack packet
        transaction_id, protocol_id, length, unit_id, read_buffer = struct.unpack(
            '2s 2s 2s c ' + str(read_buffer_size) + 's',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'read_buffer': [chr(byte) for byte in read_buffer]
        }
    
    ##########################################################################
    #                              Test Sequence                             #
    ##########################################################################
    elif unit_id == unit_id_dict['test_sequence']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, sequence = struct.unpack(
            '2s 2s 2s c I',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'sequence': sequence
        }
    
    ##########################################################################
    #                                  Quit                                  #
    ##########################################################################
    elif unit_id == unit_id_dict['quit']:
        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id
        }
    
    else:
        raise NotImplementedError