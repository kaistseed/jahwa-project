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
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'21'
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
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
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
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
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
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
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
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
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
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
        unit_id = b'C'

        # Get I2C data
        command = kwargs.get('command') if kwargs.get('command') is not None else 12
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
    #                            Burst Read Delay                            #
    ##########################################################################
    elif type == 'burst_read_delay':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
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
            data
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
        sequence = kwargs.get('sequence') if kwargs.get('sequence') is not None else 0

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c I',
            transaction_id,
            protocol_id,
            length,
            unit_id,    
            sequence
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
def decode_packet(packet):
    ##########################################################################
    #                            Get Packet Header                           #
    ##########################################################################
    transaction_id = packet[0:2]
    protocol_id = packet[2:4]
    length = packet[4:6]
    unit_id = packet[6:7]

    ##########################################################################
    #                                Write I2C                               #
    ##########################################################################
    if unit_id == unit_id_dict['write_i2c']:
        # Unpack packet
        transaction_id, protocol_id, unit_id, length, slave_addr, addr_len, data_len, addr_buf, data_buf = struct.unpack(
            '2s 2s 2s c I I I 4s 4s',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'slave_addr': slave_addr,
            'addr_len': addr_len,
            'data_len': data_len,
            'addr_buf': addr_buf,
            'data_buf': data_buf
        }
    
    ##########################################################################
    #                                Read I2C                                #
    ##########################################################################
    elif unit_id == unit_id_dict['read_i2c']:
        # Unpack packet
        transaction_id, protocol_id, unit_id, length, slave_addr, addr_len, data_len, addr_buf, data_buf = struct.unpack(
            '2s 2s 2s c I I I 4s 4s',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'slave_addr': slave_addr,
            'addr_len': addr_len,
            'data_len': data_len,
            'addr_buf': addr_buf,
            'data_buf': data_buf
        }
    
    ##########################################################################
    #                             Pattern Loading                            #
    ##########################################################################
    elif unit_id == unit_id_dict['pattern_loading']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, cmd_id, write_slave_addr, read_slave_addr, \
        write_packet_size, read_packet_size, block_count, measure_count, write_interval_us, \
        measure_interval_us, delay_from_write_to_measure_us, write_buffer = struct.unpack(
            '2s 2s 2s c I I I I I I I I I I ' + str(write_packet_size * block_count * measure_count) + 's',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'cmd_id': cmd_id,
            'write_slave_addr': write_slave_addr,
            'read_slave_addr': read_slave_addr,
            'write_packet_size': write_packet_size,
            'read_packet_size': read_packet_size,
            'block_count': block_count,
            'measure_count': measure_count,
            'write_interval_us': write_interval_us,
            'measure_interval_us': measure_interval_us,
            'delay_from_write_to_measure_us': delay_from_write_to_measure_us,
            'write_buffer': write_buffer
        }
    
    ##########################################################################
    #                               Pattern Run                              #
    ##########################################################################
    elif unit_id == unit_id_dict['pattern_run']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, cmd_id = struct.unpack(
            '2s 2s 2s c I',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'cmd_id': cmd_id
        }
    
    ##########################################################################
    #                            Pattern Get Data                            #
    ##########################################################################
    elif unit_id == unit_id_dict['pattern_get_data']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, read_buffer_size, num_of_ldo_ch0_current, \
        num_of_ldo_ch0_voltage, num_of_ldo_ch1_current, num_of_ldo_ch1_voltage = struct.unpack(
            '2s 2s 2s c I I I I I',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'read_buffer_size': read_buffer_size,
            'num_of_ldo_ch0_current': num_of_ldo_ch0_current,
            'num_of_ldo_ch0_voltage': num_of_ldo_ch0_voltage,
            'num_of_ldo_ch1_current': num_of_ldo_ch1_current,
            'num_of_ldo_ch1_voltage': num_of_ldo_ch1_voltage
        }
    
    ##########################################################################
    #                             LDO Voltage Set                            #
    ##########################################################################
    elif unit_id == unit_id_dict['ldo_voltage_set']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, channel, voltage = struct.unpack(
            '2s 2s 2s c I d',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'channel': channel,
            'voltage': voltage
        }
    
    ##########################################################################
    #   Power Control, Burst Mode, Burst Write Delay, and Burst Read Delay   #
    ##########################################################################
    elif (unit_id == unit_id_dict['power_control']) or (unit_id == unit_id_dict['burst_mode']) or \
         (unit_id == unit_id_dict['burst_write_delay']) or (unit_id == unit_id_dict['burst_read_delay']):
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, command, data = struct.unpack(
            '2s 2s 2s c I I',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'command': command,
            'data': data
        }
    
    ##########################################################################
    #                             Burst Get Data                             #
    ##########################################################################
    elif unit_id == unit_id_dict['burst_get_data']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, read_packet_size, read_count = struct.unpack(
            '2s 2s 2s c I I',
            packet
        )

        # Return packet
        return {
            'transaction_id': transaction_id,
            'protocol_id': protocol_id,
            'length': length,
            'unit_id': unit_id,
            'read_packet_size': read_packet_size,
            'read_count': read_count
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