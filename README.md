<p align="center">
	<img height="200" src="https://user-images.githubusercontent.com/39277388/90162474-f5629b80-dd94-11ea-874b-74e6b15424b6.png">
</p>

# Custom firmware for Sonoff camera (model GK-200MP2B and GK-200MP2C)

This firmware is based on the yi-hack-Allwinner project.
https://github.com/roleoroleo/yi-hack-Allwinner

It's a clone made for Sonoff camera based on Goke platform.

This firmware doesn't overwrite the original one, simply it add some features.
For example: RTSP stream is provided through the sonoff original application.

Thanks to @EpicLPer for writing the hack guide for this cam: https://github.com/EpicLPer/Sonoff_GK-200MP2-B_Dump

I have no time to support the project, so feel free to clone/fork this git and modify it as you want.

## Table of Contents

- [Contributing](#contributing-and-bug-reports)
- [Features](#features)
- [Performance](#performance)
- [Supported cameras](#supported-cameras)
- [Getting started](#getting-started)
- [URLs, Ports and Default RTSP Password](#urls-ports-and-default-rtsp-password)
- [Home Assistant integration](#home-assistant-integration)
- [Build your own firmware](#build-your-own-firmware)
- [Unbricking](#unbricking)
- [Acknowledgments](#acknowledgments)
- [Donation](#donation)
- [Disclaimer](#disclaimer)

## Contributing and Bug Reports
See [CONTRIBUTING](CONTRIBUTING.md)

## Features
This firmware contains the following features.

- FEATURES
  - ONVIF server (with support for h264 stream, snapshot, ptz, presets and WS-Discovery) - standardized interfaces for IP cameras.
  
    ONVIF compatible devices/software:
    - Onvif Device Manager
    - Hikvision
    - Qnap Surveillance Station
    - Xiongmai based DVR
    - Home Assistant
    - Onvifer (Android app)
 
    Beta testing devices/software:
    - Synology Surveillance Station
  - Snapshot service - allows to get a jpg (1920x1080) with a web request.
    - http://IP-CAM/cgi-bin/snapshot.sh
  - MQTT - Motion detection through mqtt protocol.
  - Web server - web configuration interface (port 80).
  - SSH server - dropbear.
  - FTP server.
  - Authentication for HTTP, RTSP and ONVIF server.
  - Management of motion detect events and videos through a web page.
  - PTZ support through a web page.
  - Goto and set presets through a web page.
  - The possibility to disable all the cloud features.
  - Swap File on SD
  - Online firmware upgrade.
  - Load/save/reset configuration.

## Performance

The performance of the cam is not so good (CPU, RAM, etc...).
If you enable all the services you may have some problems.
Disable cloud is recommended to save resources.

If you notice problems and you have a SD to waste, try to enable swap file.

## Supported cameras

Currently this project supports GK-200MP2B camera with firmware version V2524.1.245build20191030 and GK-200MP2C with firmware version V0525.1.72build202011031649

USE AT YOUR OWN RISK.

**Do not try to use this fw on an another model**

## Getting Started
1. Check that you have a correct Sonoff camera.

2. Get a microSD card, 16gb or less, and format it by selecting FAT32 File System.

3. Get the correct firmware file from the releases section (https://github.com/roleoroleo/sonoff-hack/releases).

4. Decompress the file (tgz format) on root path of microSD card.

5. Remove power to the camera, insert the microSD card, turn the power back ON.

6. Wait a minute.

7. Go in the browser and access the web interface of the camera as a website (http://IP-CAM). Find the IP address on your router's portal (see connected devices).

8. Don't remove the microSD card (yes this hack requires a dedicated microSD card).

9. Done.

## URLs, Ports and Default RTSP Password
For both streams if you've set a custom username and password on the config screen don't forget to replace "hack" at the beginning of the URLs! First one is username, second is password. If you want to view the stream in, as example, VLC and haven't set a password you need to enter "hack" for both user and pass.
* Configuration Website: `http://IP-CAM`
* High Res Stream: `rtsp://hack:hack@IP-CAM/av_stream/ch0`
* Low Res Stream: `rtsp://hack:hack@IP-CAM/av_stream/ch1`
* 1080p Snapshot URL: `http://IP-CAM/cgi-bin/snapshot.sh`
* PTZ Port: 1000
    * In Blue Iris you need to manually enable "PTZ Controls" and change it to "ONFIV (OXML)" in the camera settings. If PTZ doesn't work delete the camera and add it again, also try to set the port to "1000" manually.

## Home Assistant integration
Are you using Home Assistant?

Do you want to integrate your cam?

Try this custom integration:
https://github.com/roleoroleo/yi-hack_ha_integration

## Build your own firmware
If you want to build your own firmware, clone this git and compile it using a linux machine.
Quick explanation:
- Download and install the toolchain I compiled.
- Prepare the system installing all the necessary packages.
- Clone this git.
- git submodule update --init
- ./scripts/compile.sh
- ./scripts/pack_fw.all.sh

## Unbricking
If your camera doesn't start, no panic.
This hack is not a permanent change, remove your SD card and the cam will come back to the original state.

## Acknowledgments
Special thanks to the following people for the previous projects I started from.
- @EpicLPer - [https://github.com/EpicLPer/Sonoff_GK-200MP2-B_Dump](https://github.com/EpicLPer/Sonoff_GK-200MP2-B_Dump)
- @TheCrypt0 - [https://github.com/TheCrypt0/yi-hack-v4](https://github.com/TheCrypt0/yi-hack-v4)
- All the people who worked on the previous projects "yi-hack".

## Donation
If you like this project, you can buy me a beer :) 
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=JBYXDMR24FW7U&currency_code=EUR&source=url)

---
### DISCLAIMER
**I AM NOT RESPONSIBLE FOR ANY USE OR DAMAGE THIS SOFTWARE MAY CAUSE. THIS IS INTENDED FOR EDUCATIONAL PURPOSES ONLY. USE AT YOUR OWN RISK.**
