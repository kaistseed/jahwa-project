################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
pynq_mb_firmware.elf.size \


# All Target
all: pynq_mb_firmware.elf secondary-outputs

# Tool invocations
pynq_mb_firmware.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MicroBlaze gcc linker'
	mb-gcc -Wl,-T -Wl,../src/lscript.ld -LD:/Jahwa/windows/vitis/pynq_test/jahwa_daq/jahwa_daq_system/export/jahwa_daq_system/sw/jahwa_daq_system/mb_softprocessor_0/bsplib/lib -mlittle-endian -mcpu=v11.0 -mxl-soft-mul -Wl,--no-relax -Wl,--gc-sections -o "pynq_mb_firmware.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

pynq_mb_firmware.elf.size: pynq_mb_firmware.elf
	@echo 'Invoking: MicroBlaze Print Size'
	mb-size pynq_mb_firmware.elf  |tee "pynq_mb_firmware.elf.size"
	@echo 'Finished building: $@'
	@echo ' '
	
pynq_mb_firmware.bin: pynq_mb_firmware.elf
	@echo 'Invoking: MicroBlaze Bin Gen'
	mb-objcopy -O binary pynq_mb_firmware.elf pynq_mb_firmware.bin
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) pynq_mb_firmware.elf
	-@echo ' '

secondary-outputs: $(ELFSIZE) pynq_mb_firmware.bin

.PHONY: all clean dependents

-include ../makefile.targets
