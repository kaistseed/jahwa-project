##############################################################################
#                          [ Python Library ]                                                
#                                                                                
# Institution           : KAIST - SEED Lab         
# Created by            : Dalta Imam Maulana                                         
#                                                                                
# Project Name          : Jahwa I2C Sensor                                     
#                                                                                
# Create Date           : 05/10/2023
# File Name             : packet.py                                           
#                                                                                
# Target Device         : FPGA                                      
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
    'measurement_sequence': b'M',
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
    'gpio_toggle_led': 1,
    'gpio_test_led': 2,
    'configure_dac': 3,
    'i2c_meissner_reset': 4,
    'i2c_meissner_chip_id': 5,
    'i2c_meissner_version': 6,
    'i2c_meissner_unique_id': 7,
    'timer_get_cnt_val': 8,
    'timer_test_delay': 9,
    'spi_read_adc': 10,
}

# Define measurement sequence dictionary
measurement_sequence_dict = {
    'gpio_write_sdn1': 1,
    'gpio_write_sdn2': 2,
    'gpio_write_sdn3': 3,
    'spi_config_dac': 4,
    'spi_read_adc': 5,
}

##############################################################################
#                           Define Helper Function                           #
##############################################################################
def int_to_char_array(value):
    # Convert integer to int array
    int_array = struct.pack('4B', 
        (value >> 24) & 0xFF, 
        (value >> 16) & 0xFF, 
        (value >> 8) & 0xFF, 
        (value) & 0xFF
    )

    # Convert array member to char
    char_array = [chr(byte) for byte in int_array]
    
    # Return array
    return char_array

##############################################################################
#                                Encode Packet                               #
##############################################################################
def encode_packet(type, *args, **kwargs):
    ##########################################################################
    #                                Read I2C                                #
    ##########################################################################
    if type == 'read_i2c':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'21'
        unit_id = b'R'

        # Get I2C command and data
        data_buf = kwargs.get('data_buf') if kwargs.get('data_buf') is not None else ['0', '0', '0', '0']

        # Convert data buffer to byte and combine them
        data_buf = ''.join(data_buf).encode('utf-8')

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c 4s',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            data_buf
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
        read_buffer = kwargs.get('read_buffer') if kwargs.get('read_buffer') is not None else ['0'] * read_buffer_size
        ldo_ch0_current = kwargs.get('ldo_ch0_current') if kwargs.get('ldo_ch0_current') is not None else [0.0] * read_buffer_size
        ldo_ch0_voltage = kwargs.get('ldo_ch0_voltage') if kwargs.get('ldo_ch0_voltage') is not None else [0.0] * read_buffer_size
        ldo_ch1_current = kwargs.get('ldo_ch1_current') if kwargs.get('ldo_ch1_current') is not None else [0.0] * read_buffer_size
        ldo_ch1_voltage = kwargs.get('ldo_ch1_voltage') if kwargs.get('ldo_ch1_voltage') is not None else [0.0] * read_buffer_size

        ldo_ch0_current = [1.0, 2.0]

        # Convert read buffer to byte and combine them
        read_buffer = ''.join(read_buffer).encode('utf-8')
        
        # Struct format
        struct_format = '2s 2s 2s c ' + str(read_buffer_size) + 's ' + ('d ' * num_of_ldo_ch0_current) + \
            ('d ' * num_of_ldo_ch0_voltage) + ('d ' * num_of_ldo_ch1_current) + ('d ' * num_of_ldo_ch1_voltage)

        # Create packet
        packet = struct.pack(
            struct_format,
            transaction_id,
            protocol_id,
            length,
            unit_id,
            read_buffer,
            *ldo_ch0_current,
            *ldo_ch0_voltage,
            *ldo_ch1_current,
            *ldo_ch1_voltage
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
        read_buffer_size = kwargs.get('read_buffer_size') if kwargs.get('read_buffer_size') is not None else 0
        read_buffer = kwargs.get('read_buffer') if kwargs.get('read_buffer') is not None else ['0'] * read_buffer_size

        # Convert read buffer to byte and combine them
        read_buffer = ''.join(read_buffer).encode('utf-8')

        # Create packet
        packet = struct.pack(
            '2s 2s 2s c ' + str(read_buffer_size) + 's',
            transaction_id,
            protocol_id,
            length,
            unit_id,
            read_buffer
        )

        # Return packet
        return packet
    
    ##############################################################################################
    #                                    Measurement Sequence                                    #
    ##############################################################################################
    elif type == 'measurement_sequence':
        # Define modbus header
        transaction_id = kwargs.get('transaction_id') if kwargs.get('transaction_id') is not None else b'01'
        protocol_id = kwargs.get('protocol_id') if kwargs.get('protocol_id') is not None else b'00'
        length = kwargs.get('length') if kwargs.get('length') is not None else b'0'
        unit_id = b'M'

        # Get data
        sequence = kwargs.get('sequence') if kwargs.get('sequence') is not None else ''

        # Check whether sequence is valid or not
        if sequence not in measurement_sequence_dict.keys():
            raise ValueError('Invalid measurement sequence')

        # Create packet based on sequence
        # DAC I/O control and DAC Configuration
        if (sequence == 'gpio_write_sdn1') or (sequence == 'gpio_write_sdn3') or \
            (sequence == 'gpio_write_sdn3') or (sequence == 'spi_config_dac'):
            packet = struct.pack(
                '2s 2s 2s c I',
                transaction_id,
                protocol_id,
                length,
                unit_id,    
                measurement_sequence_dict[sequence]
            )
        # ADC read
        elif sequence == 'spi_read_adc':
            # Get data
            adc_id = kwargs.get('adc_id') if kwargs.get('adc_id') is not None \
                else [0] * 8
            adc_softspan = kwargs.get('adc_softspan') if kwargs.get('adc_softspan') is not None \
                else [0] * 8
            adc_value = kwargs.get('adc_value') if kwargs.get('adc_value') is not None \
                else [0] * 8
            adc_voltage = kwargs.get('adc_voltage') if kwargs.get('adc_voltage') is not None \
                else [0.0] * 8
            
            # Create packet
            packet = struct.pack(
                '2s 2s 2s c I 8I 8I 8I 8d',
                transaction_id,
                protocol_id,
                length,
                unit_id,
                measurement_sequence_dict[sequence],
                adc_id,
                adc_softspan,
                adc_value,
                adc_voltage
            )
        # Other sequence
        else:
            raise NotImplementedError

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
    #                           Unknown Packet Type                          #
    ##########################################################################
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
    #                                Write I2C                               #
    ##########################################################################
    if unit_id == unit_id_dict['write_i2c']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, slave_addr, addr_len, data_len, addr_buf, data_buf = struct.unpack(
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
            'addr_buf': [chr(byte) for byte in addr_buf], # Convert byte to list of char
            'data_buf': [chr(byte) for byte in data_buf] # Convert byte to list of char
        }
    
    ##########################################################################
    #                                Read I2C                                #
    ##########################################################################
    elif unit_id == unit_id_dict['read_i2c']:
        # Unpack packet
        transaction_id, protocol_id, length, unit_id, slave_addr, addr_len, data_len, addr_buf, data_buf = struct.unpack(
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
            'addr_buf': [chr(byte) for byte in addr_buf], # Convert byte to list of char
            'data_buf': [chr(byte) for byte in data_buf] # Convert byte to list of char
        }
    
    ##########################################################################
    #                             Pattern Loading                            #
    ##########################################################################
    elif unit_id == unit_id_dict['pattern_loading']:
        # Get write buffer size
        write_buffer_size = kwargs.get('write_buffer_size') if kwargs.get('write_buffer_size') is not None else 0

        # Assert write buffer size
        assert write_buffer_size > 0, 'Write buffer size must be greater than 0'

        # Unpack packet
        transaction_id, protocol_id, length, unit_id, cmd_id, write_slave_addr, read_slave_addr, \
        write_packet_size, read_packet_size, block_count, measure_count, write_interval_us, \
        measure_interval_us, delay_from_write_to_measure_us, write_buffer = struct.unpack(
            '2s 2s 2s c I I I I I I I I I I ' + str(write_buffer_size) + 's',
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
            'write_buffer': [chr(byte) for byte in write_buffer] # Convert byte to list of char
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
    
    ##############################################################################################
    #                                    Measurement Sequence                                    #
    ##############################################################################################
    elif unit_id == unit_id_dict['measurement_sequence']:
        # Get sequence
        sequence = packet[7:8]

        # Unpack packet based on sequence
        # SDN I/O
        if (sequence == measurement_sequence_dict['gpio_write_sdn1']) or 
            (sequence == measurement_sequence_dict['gpio_write_sdn2']) or
            (sequence == measurement_sequence_dict['gpio_write_sdn3']):
            transaction_id, protocol_id, length, unit_id, sequence, io_state = 
            struct.unpack(
                '2s 2s 2s c I I',
                packet
            )

            # Return packet
            return {
                'transaction_id': transaction_id,
                'protocol_id': protocol_id,
                'length': length,
                'unit_id': unit_id,
                'sequence': sequence,
                'io_state': io_state
            }   

        # DAC configuration
        elif sequence == measurement_sequence_dict['spi_config_dac']:
            transaction_id, protocol_id, length, unit_id, sequence, channel, code = 
            struct.unpack(
                '2s 2s 2s c I I I',
                packet
            )

            # Return packet
            return {
                'transaction_id': transaction_id,
                'protocol_id': protocol_id,
                'length': length,
                'unit_id': unit_id,
                'sequence': sequence,
                'channel': channel,
                'code': code
            }

        # ADC read
        elif sequence == measurement_sequence_dict['spi_read_adc']:
            transaction_id, protocol_id, length, unit_id, sequence, num_of_samples, interval_ms = 
            struct.unpack(
                '2s 2s 2s c I I I',
                packet
            )

            # Return packet
            return {
                'transaction_id': transaction_id,
                'protocol_id': protocol_id,
                'length': length,
                'unit_id': unit_id,
                'sequence': sequence,
                'num_of_samples': num_of_samples,
                'interval_ms': interval_ms
            }

        # Other sequence
        else:
            raise NotImplementedError

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