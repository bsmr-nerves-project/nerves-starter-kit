Nerves Starter Kit
==================

This project will walk you through bringing up the Nerves-SDK and a simple
Elixir application on Windows, Mac, or Linux. While the Nerves-SDK can only be built and
used under Linux, this project uses a VirtualBox Appliance to provide the
necessary environment without any guess work, long downloads, or confusing
installations. If you go forward with Nerves, you can continue to use this VM or
put in the time to build Nerves in a native Linux environment.

At the end of the project, you will be able to:

- compile Elixir applications for the Raspberry Pi using the Nerves-SDK
- toggle GPIOs on a Raspberry Pi using Elixir
- create complete SDCard images that will boot to your application on the
  Raspberry Pi

## Prerequisites

You'll need the following to complete this walk through:

- [VirtualBox](https://www.virtualbox.org/) installed on your computer
- A Raspberry Pi
- Either a display and keyboard for the RPi or a serial connection to the
  UART pins on the RPi's GPIO header
- An SDCard that can be completely erased
- An SDCard Reader for your computer
- A breadboard, LEDs, resisters to be able to see the GPIOs toggle

If you don't have the LEDs or resisters, you can still work through the demo. If
you have a multimeter, you can verify that the GPIOs are indeed changing.

## Installing and running the VM

1. Install VirtualBox and the Oracle VM VirtualBox Extension Pack. The latter
   is needed to access USB devices inside of the VM. You'll need this to write
   to the SDCard from inside the VM. The alternative is to copy the firmware
   image outside of the VM and write it to the SDCard using the host OS.
2. Obtain the NervesStarterVM appliance and import it into VirtualBox
3. Press Start
4. Log in to the VM: Username “nerves”, password “nerves”
5. Open up a terminal and `cd nerves-sdk`
6. Run `git pull` to make sure that you have the latest code
6. make nerves_rpi_defconfig
6. Optional: turn on the compiler cache to make rebuilds run *much* faster. Run
   `make menuconfig`, go to "Build options", select "Enable compiler cache".
    Press the right arrow key to select "Exit".
7. make
8. Update your environment to build Nerves projects by running `. ./nerves-env`
9. Download the starter project: `git clone git://github.com/nerves-project/nerves-starter-kit`
10. make
11. Plug in an SDCard reader and an SDCard that you don't mind erasing.
12. sudo-mmccopy `_images/nerves-elixir-trivial.img` (NOTE the hyphen.
    `sudo-mmccopy` is a wrapper around the mmccopy utility that's built by
    Nerves to run it as the root user.)
13. Plug the SDCard into the Raspberry Pi
14. Connect an LED and resister up to GPIO 22
15. Power up the Raspberry Pi
