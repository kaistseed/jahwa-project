onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib jahwa_daq_system_opt

do {wave.do}

view wave
view structure
view signals

do {jahwa_daq_system.udo}

run -all

quit -force
