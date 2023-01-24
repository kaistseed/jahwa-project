# I2C Interface with Interrupt Controller
> <div align="justify"> This guide will help you to implement I2C interface on PYNQ-Z1 board to communicate with external sensor. In addition, interrupt controller will also be integrated in the design to support precise timing delay via interrupt timer.</div>



## :bookmark_tabs: Table of Content

* [Context](#information_source-context)
* [Background](#mag-background)
* [AXI-based I2C and Interrupt Controller](#-axi-based-i2c-and-interrupt-controller)
* [References](#book-references)



## :information_source: Context

*Created by*: **Dalta Imam Maulana** </br>
*Document Version*: **January 23th, 2023**



## :mag: Background

### Xilinx Vivado
<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/vivado-logo.jpg" alt="vivado-logo" width="40%" />
</p>


Vivado design suite is an integrated design environment (IDE) developed by Xilinx that provides a lot of features such as:

* Vivado high-level synthesis (HLS) compiler which transforms C, C++, and SystemC programs into RTL code.
* Vivado simulator that supports mixed-language simulation and verification.
* Vivado IP integrator that allows the designer to easily integrate and configure IP core either a pre-built library from Xilinx or custom-made IP cores.



### PYNQ Framework

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/pynq-logo.png" alt="pynq-logo" width="40%" />
</p>


PYNQ is an open-source framework from Xilinx that is designed for system designers, software developers, and hardware designers to easily use Xilinx platforms. With the support of Python language and libraries, designers can get the huge benefits of using programmable logic and microprocessors to build more interesting and powerful embedded systems. For now, the PYNQ framework can be used with Zynq, Zynq UltraScale+, Zynq RFSoC, and Alveo accelerator boards.



### Inter-Integrated Circuit (I2C)

Inter-integrated circuit (I2C) is a multi-master, multi-slave, serial communication protocol which is widely used in embedded systems to connect low speed peripheral devices with processors or microcontrollers. I2C protocol uses two bidirectional open collector or open drain lines which are serial data line (SDA) and serial clock line (SCL). These lines are connected with pull-up resistor and typically the resistor is connected to 5V or 3.3V voltage source.

There are four possible configurations of I2C which are:

- `Master transmit`: master device is sending data to slave device.
- `Master receive`: master device is receiving data from slave device.
- `Slave transmit`: slave device is sending data to master device.
- `Slave receive`: slave device is receiving data from master device.

To begin the transaction, master device sends START signal followed by 7-bit address of the slave device, which then followed by single bit representing whether the master wants to write data (0) or read data (1) from slave. If the slave device exists, it will send back ACK signal bit for that address. After receiving ACK signal from slave, master will continue to read or write data from or to slave. The START signal is usually indicated by high-to-low transition of SDA line with SCL being high. Meanwhile, the STOP signal is indicated by a low-to-high transition of SDA with SCL in high [2].

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/i2c-timing.png" alt="i2c-timing" width="60%" />
</p>




## <img style="vertical-align:middle" src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/chip.png" width="32px" title=":chip:"/> AXI-based I2C and Interrupt Controller

### Installing Vivado

To install Xilinx Vivado on your computer, first, you need to download the installer from the Xilinx website. You can download the software through this link: **https://www.xilinx.com/support/download.html** . On the download page, you can choose either the online installer or offline installer. If you choose an offline installer, then the downloaded software can be used in either Linux or Windows operating systems. 

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/vivado-install.jpg" alt="vivado-install" width="70%" />
</p>


During the installation process, you need to choose the `Vivado HL Webpack edition` since it doesn't require any license to use the software. If you are using an online installer, please make sure that you have around 40 GB of free space left on your computer since the installer will download a couple of files with a total size of around 35 GB.



### PYNQ Board Setup

In order to set up the PYNQ board, you need to prepare the following items:

* PYNQ Z1 board
* Computer with browser
* Ethernet cable
* Micro USB cable
* Micro SD with a minimum of 8 GB capacity

After preparing those items, the first thing to do is to download the correct PYNQ image file for the board from the following link
**http://www.pynq.io/board.html**. For this tutorial, you will use the PYNQ Z1 board from Digilent. So, download the PYNQ image for the PYNQ Z1 board.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/pynq-download.jpg" width="70%" />
</p>


After downloading the PYNQ Image, flash the image into the SD card using an OS flasher tool such as `Balena Etcher`. You can download Balena Etcher software from **https://www.balena.io/etcher/**. After flashing the PYNQ image to an SD card, now you can try to connect the board to your computer by following the steps below:

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/pynq-setup.jpg" width="50%" />
</p>


1.	Set the JP4 jumper to SD position by placing the jumper over the top two pins as in the figure above.
2.	If you use a micro USB cable to supply power to the board, place the JP5 jumper in a USB position. You can also power the board with a 12 V external power supply by configuring the JP5 jumper to REG position.
3.	Insert microSD card with PYNQ image to the micro SD card slot in the bottom of the board.
4.	Connect the micro USB cable to the board and computer.
5.	Connect the board to the network by using an ethernet cable. The connection can be done directly to the computer or via a network router.
6.	Turn on the board and check whether the board is operating correctly by looking at the LED indicator in the board. After turning on the board, RED LD13 LED will turn on immediately indicating that the board has power. Shortly after that, Yellow LD12 LED will also turn on to show up that the board is working correctly. After a minute, two BLUE LD4 & LD5 LED will start flashing to indicate that the system is now booted and ready to use.
7.	To access the PYNQ board via a direct connection, you must set the IP address of your computer to a static IP address in the range of 192.168.2.00 to 192.168.2.255 (except for 192.168.2.99 since it is used by the board).
8.	After setting the IP address, open the browser and enter `192.168.2.99` in the address bar.
9.	If the board is configured correctly, you will see a login screen with a password field in it. The username for the board is `xilinx` and the password is also `xilinx`.

For more detailed information about how the board and how to set up it, you can access the documentation at this link:
**https://pynq.readthedocs.io/en/latest/getting_started/pynq_z1_setup.html**



### Create New Vivado Project

First, open up Vivado application and create a new project.
1.	Click next on Create a New Project.
2.	Enter the name of your project, for example, led_chaser.
3.	Select RTL project and click next.
4.	If you already have Verilog source, you can add it in the add source window. Otherwise, just skip the process and click next.
5.	Add board constraint file by choosing pynq_z1.xdc file and make sure to check copy constrains files into project option.
6.	In the board selection section, choose PYNQ-Z1 board if it is available. Otherwise, you should download the PYNQ-Z1 board file and copy the board files folder to `<Xilinx installation directory>\Vivado\<version>\data\xhub\boards\XilinxBoardStore\boards\Xilinx\`                                         (**Note:** for older Vivado version, you can copy the board files to `<Xilinx installation directory>\Vivado\<version>\data\boards`).
   You can find PYNQ-Z1 board files on **https://pynq.readthedocs.io/en/latest/overlay_design_methodology/board_settings.html**. You need to restart Vivado after copying the board file.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/pynq-board.png" width="70%" />
</p>



### Create System Block Diagram

In this guide, you will configure the FPGA fabric to perform I2C communication with the external sensor with precise time delay. To do so, you will need to create the system block diagram which define the connection between the AXI IIC IP core and AXI Interrupt Timer with ARM core. The system block diagram is shown below. 

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/interrupt-final-bd.jpg" width="70%" />
</p>

In order to recreate the block diagram above in your Vivado project, you can follow the steps below:

1. Under the IP Integrator section on Flow Navigator, click on `Create Block Diagram`. You can change the name of the block diagram, but make sure to keep the directory location to `local to the project`.

2. A blank diagram window will appear on the right pane. In this blank diagram pane, you can add any kind of IP core provided by Xilinx or add your custom IP core.

3. To add IP core into the design, you can click `Add IP` button or by using (Ctrl + I) keyboard shortcut.

4. Add `ZYNQ Processing System IP` by entering zynq keyword on the search bar. 

5. After you add the ZYNQ IP core, you will see a green option window with `Run Block Automation` text in it. This block automation option will help you to connect the IP core in the design. But sometimes, the connection created by this automation process is not correct. So, make sure to recheck the connection after performing a block automation operation.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/block-automation.png" width="75%" />
</p>

6. After running block automation, some new wires and `external interfaces` such as `DDR` and `FIXED_IO` will appear in the design which corresponds to the board output pins.

7. The next step is to customize the `ZYNQ Processing System` core to meet the design requirement. For this design, you need to enable the `interrupt` port on the ZYNQ core so that the interrupt signal from the `AXI Interrupt Controller` trigger the interrupt event on the ARM core. You can enable the `interrupt` port by double-clicking the ZYNQ IP core and click `Interrupts` section. In the `Interrupts` section check the box next to `Fabric Interrupts` and `IRQ_F2P` under `PL-PS Interrupt Ports` section.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/interrupt-port.jpg" width="60%" />
</p>

8. After finish configuring the ZYNQ IP core parameter, click `OK` and Vivado will update the ZYNQ IP core block diagram and the ZYNQ block should look like the figure below.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/cd43c356f6dac23e7d3e6e0be15f2bd5117d339d/fpga-board/vivado-project/resources/irq-bd.jpg" width="40%" />
</p>


### Adding AXI IIC Interface

In this section, you will add AXI IIC interface to the design. Follow the instruction below to add AXI IIC interface IP core your design:

1. Click `Add IP` button or use (Ctrl + I) keyboard shortcut and search the AXI IIC IP core.

2. Place `AXI IIC` IP core inside your design.

3. Configure IP settings by double-clicking the IP and change `IIC parameters` of the AXI IIC core.

4. In the IIC parameters, you need to change `SCL clock frequency` to match the SCL clock frequency of the sensor or IIC device. In this module, you will use MPU6050 sensor as IIC slave. So, set the SCL clock frequency to `400 KHz`. For other sensors, you can read the sensor datasheet to determine proper SCL clock frequency value.

5. Next step is to adjust the `address mode` and `SDA active state` configuration. For Meissner sensor, you need to set `address mode` to `7-bit` since Meissner address is 7-bit long and `active state of SDA` to `0`. These configurations depend on the sensor setting. So, make sure to check the sensor datasheet before changing the `AXI IIC IP configuration`.

   <p align="center">
       <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/axi-iic-ip.png" width="60%" />
   </p>

6. After that, you need to add IIC interface port in order to map the `AXI IIC` core output to the board pins. To add interface port, right click at the block diagram window and click `Create Interface Port` or use `Ctrl+L` keyboard shortcut. In the interface port window, set `interface name`, select `IIC interface`, and set the mode to `Master`. Finally, connect the `newly created interface port` with `IIC port`of AXI IIC IP core.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/axi-iic-port.png" width="30%" />
</p>


### Adding AXI Interrupt Controller

After adding `AXI IIC` to your design, you also need to add `AXI Interrupt Controller` and `AXI Timer` IP core to enable precise timing delay to the design. To add the IP core,  you can just follow the steps when you add the `AXI IIC` IP core. For `AXI Timer` configurations, you just need to uncheck `Enable Timer 2` option since you are going to use only one timer in this design.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/axi-timer.jpg" width="60%" />
</p>


As for the `AXI Interrupt Controller` configuration, you don't need to change anything. Just use the default configuration given by Vivado. After adding both `AXI Interrupt Controller` and `AXI Timer` IP core, you need to connect those IP blocks by following the block diagram below.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/interrupt-bd.jpg" width="70%" />
</p>


### Synthesize and Port Mapping Process

After finish adding and configuring all of the required IP blocks to the design, you can start synthesizing the design by following the steps below:

1. Click on the `Optimize Routing` button at the top of the diagram window (right angle wire with reload symbol). This process will clean up your block diagram layout.

2. Click on the `Validate Design` button at the top of the diagram window (a square with a checkmark symbol). This process will perform a sanity check of your system and flag any potential problems in the design such as unconnected wires, incompatible pins, etc. For this specific project, if you get a warning related to the reset signal, you can ignore it. But, if there are any other warnings after design validation, you need to fix the problem in the design.

3. After validating the design, under the `Sources` menu, right-click on the block diagram file (file with .bd extension), and click on `Create HDL Wrapper option`. For the sake of simplicity, let Vivado manage and automatically update the design. The `Create HDL Wrapper` process will create a high-level Verilog file that represents your block diagram.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/hdl-wrapper.jpg" width="75%" />
</p>

4. If there are no errors, you can synthesize the design by clicking `Run Synthesis` option under Synthesis menu in Flow navigator. This process may take a couple of minutes depending on your computer and design complexity. Errors may appear during this process. So, pay attention to it and try to fix the error if there is an error in your design.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/synthesis.jpg" width="75%" />
</p>

5. Before running implementation and bitstream generation process, you need to change the `board pin mapping`, so that the AXI IIC IP core inputs and  	outputs are mapped to correct pins. To change the pin mapping, click `open synthesized design` in the left menu and after synthesized design opens, 	click `window > I/O ports` option from toolbar.

<p align="center">
    <img src="https://github.com/kaistseed/jahwa-project/blob/a30f16839fd1793619d0ba5d4ddf67e8121f1fb3/fpga-board/vivado-project/resources/io-ports.jpg" width="75%" />
</p>

6. In the I/O ports menu, you need to change board pin mapping as follows:

<div align="center">

| Port Name  | Board Pin Name | Package Pin Name |  I/O Std  |
| :--------: | :------------: | :--------------: | :-------: |
| IIC_scl_io |      SCL       |       P16        | LVCMOS33* |
| IIC_sda_io |      SDA       |       P15        | LVCMOS33* |

</div>

7. After changing the pin mapping, save the constraint, resynthesize the design and start generating design 	bitstream by clicking `Generate Bitstream` 	option under     Program and Debug menu in Flow navigator.

8. When the build is complete, you need to export the bitstream file by choosing `Export Bitstream File` option under the `Export` option under `File` menu. Make sure that your block diagram window is open before exporting the block diagram. Otherwise, the `Export Bitstream File` option will not show up. Make sure to name the `bitstream file (file with .bit extension)` with the block design name (by default it is design_1). Otherwise, an error message will appear when you are trying to load the design into PYNQ board.


9. If you encounter any error during exporting process such as `Too many positional options when parsing` (**you can look for the error message in tcl console**), copy the `write_bd_tcl` line in tcl console, add double quotes (") symbol before and after your folder path, and run the command again using tcl console.




## :book: References

- *PYNQ main website*, February 2021. Available: [**http://www.pynq.io/**](http://www.pynq.io/)
- *PYNQ-Z1 documentation*, February 2021. Available: [**https://pynq.readthedocs.io/en/v2.6.1/getting_started/pynq_z1_setup.html**](https://pynq.readthedocs.io/en/v2.6.1/getting_started/pynq_z1_setup.html) 
