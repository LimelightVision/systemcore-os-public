Access to the latest SystemCore OS builds and cross-compilation resources.
Releases are automatically published and may contain bugs.


## Alpha 5 (Release 166)

### OS
* Fix Journal Log errors due to timezone changes as a result of DS connectivity
* Increase accuracy of can bus load calculation
* Add CAN Bus faults to faults viewer
* Fix WiFi disablement https://github.com/wpilibsuite/SystemCoreTesting/issues/112 https://github.com/wpilibsuite/SystemCoreTesting/issues/107
* Fix ssh login password expiry https://github.com/wpilibsuite/SystemCoreTesting/issues/90
* dhcpcd ignores all can interfaces https://github.com/wpilibsuite/SystemCoreTesting/issues/113
* New LED API supporting ledcount and ledoffset for increased flexibility. (requires WPILIB Alpha 2) https://github.com/wpilibsuite/SystemCoreTesting/issues/104

### Web Interface
* Add new system log viewer. View, filter, and download complete system logs from the web interface. Inspired by volunteer and team experiences at IRI. https://github.com/wpilibsuite/SystemCoreTesting/issues/88
* Add "No Faults" green checkmark to web UI header
* Styling updates
* Further reduce CPU utilization of Hardware Snapshot page https://github.com/wpilibsuite/SystemCoreTesting/issues/41
* Simplify interface configuration. Users can disable/enable Wlan0, but other controls have been disabled.

### Firmware
* Increase theoretical max LED count to 6144 (1024 unique). May be limited in a future release
* Allow digital output control while disabled https://github.com/wpilibsuite/SystemCoreTesting/issues/116

## Alpha 4 (Release 163)

### OS
* Write journal logs to disk (max 10). Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/88
* Remove /etc/timezone. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/102
* Disable green ethernet support and move ethernet irq to core 1. May address https://github.com/wpilibsuite/SystemCoreTesting/issues/94
* [WPILIB] Fix DS release display. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/93
* Add /sys/vbrownout and /sys/vrecovery (millivolts). Brownout behaviour currently zeros digital outputs and sets pwm outputs to servo neutral 1500us
* Add /io/leds bytearray for LED control. Max size 1024x3, 3 bytes per pixel, RGB
* Add "ledcount" to each io pin subtable. Max 1024 per pin, max 1024 aggregate.
* Fault report publishing for brownouts, IO/I2C, USB, RSL, Display, and IMU.:
  > /sys/faults table contains active fault flags, and /sys/faultcounts contains historical fault counts.
  > ![](https://ik.imagekit.io/llimi/controlsystem/alpha4/faultmetrics.png)
* Get duty cycle sensor period (periodget) (microseconds)
* Set pwm output period (periodset) (enumeration)

### Firmware
* PWM Input: provide period
* PWM Output: On-the-fly period adjustment. Better funcitonality overall
> Video: https://vimeo.com/1099708743?from=outro-local
* Brownout and recovery functionality. Defaults to 6750 mV brownout and 7500mV recovery
* WS2812 support on all IO pins. Up to 1024 LEDs total and per-pin
> ![](https://private-user-images.githubusercontent.com/13728935/464344632-2bd4787e-8683-42cc-9a8d-76b030a9d727.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTIwOTE4NTcsIm5iZiI6MTc1MjA5MTU1NywicGF0aCI6Ii8xMzcyODkzNS80NjQzNDQ2MzItMmJkNDc4N2UtODY4My00MmNjLTlhOGQtNzZiMDMwYTlkNzI3LmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MDklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzA5VDIwMDU1N1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTg0ZTE2YTdjNjYxNjFiOTg0NDI4ZGVjN2UxNGYxMWQ0YTAyYWJjYTFlZDEwMzdkZmM2YWFjMWMzMTE5ODkwODImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Jvr1-9LkHMe-BdOaN5FKnfFUboon5qS9sHiiNkviRnM)
* Smoother screen dim and wake-up sequences
* More sensitive tap-to-wake functionality
* Fast red LED blink during brownouts

### Web Interface 
* Display period on web interface for each pwm in/out IO pin.
* Confirm webgl availability before displaying 3D models, handle all 3D-related exceptions. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/101
* Significantly reduce CPU usage of most web interface pages. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/41
* Add fault report warning. 
  * Gray - No active faults. Faults have occured since boot
  * Blinking red - Active faults
  * Invisible - No active faults. Faults have not occured since boot
  > ![](https://ik.imagekit.io/llimi/controlsystem/alpha4/faultgray.png)
  > ![](https://ik.imagekit.io/llimi/controlsystem/alpha4/faultred.png)


## Alpha 3 Hotfix (7/2/25) (Release 162)

* Fix installation of packages larger than 50MB

## Alpha 3 (7/1/25) (Release 161)

### OS
* /usr/lib/os-release (and /etc/os-release) updated. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/85
* Allow package overwriting. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/82
* [WPILIB] Update date & time functionality. May address https://github.com/wpilibsuite/SystemCoreTesting/issues/81
* Update CAN Hearbeat

### Firmware
* Restore battery voltage measurement accuracy. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/75
* Reduce default display brightness
* Add automatic display dimming and disablement after 10 seconds of no-motion
* Add automatic display enablement after light motion such as a tap
* Display can now properly display IP Addresses with 3 digits in all octets. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/74

### Web Interface
* Add routes for all web interface views. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/72
* More obvious dropdown UI in System Tab. May address https://github.com/wpilibsuite/SystemCoreTesting/issues/65

### Other
* Remove go cache and some miscellaneous files from toolchain. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/70
* Add go compilation example to OS repo


## Alpha 2 (6/28/25) (Release 159)

### OS
* Default Wi-Fi configuration changed to 5Ghz with automatic channel selection. Likely increases boot time.
* Fix available memory estimate. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/16
* Add euler_flat, euler_landscape, euler_portrait to system NT server. Fill out legacy euler array with euler_flat values. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/26
* More reliable USB Automounting and Hotplug support. May address https://github.com/wpilibsuite/SystemCoreTesting/issues/31
* Add automatic restart to CAN Bus interfaces. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/59

### Firmware
* IMU in-motion improvements for higher accuracy during matches
* Analog Input raw readings are now integer millivolts (0 to ~3300) instead of 0 to 4096 raw adc readings. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/44
* Fix Digital Input latching HIGH in certain situations.
* Status light: Slow blink indicates a Display fault, Fast blink indicates CAN Bus fault (a CAN Bus is either unavailable or available and DOWN)
* Tweak display communications to increase reliability
* New display CAN bus health indicators. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/66
```
For each bus:
CAN Not available - Single Pixel, Flashing Red Status Light
CAN Available and DOWN - Empty Box, Flashing Red Status Light
CAN Available and UP - Blinking Box
```

### Web Interface
* Add units to plots and plot tooltips. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/16
* Fix CAN bus utilization plots. Add selected bitrate, add UP/DOWN indicator, add bus availability indicator, add FD indicator. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/18
> ![](https://ik.imagekit.io/llimi/controlsystem/alpha2/canutil.png)
* New mount orientation preview UI
> ![](https://ik.imagekit.io/llimi/controlsystem/alpha2/mountpreview.png)
* Display OS release string in web interface. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/32
> ![](https://ik.imagekit.io/llimi/controlsystem/alpha2/osrelease.png)
* IO types are now properly displayed in the web interface. More improvements to come. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/48
> ![](https://ik.imagekit.io/llimi/controlsystem/alpha2/iotypes.png)
* Add USB Drive Ejection UI. Further addresses discussion in https://github.com/wpilibsuite/SystemCoreTesting/issues/31
> ![](https://ik.imagekit.io/llimi/controlsystem/alpha2/eject.png)
* Optimize home page cold load time.
* Reduce web interface bandwidth usage. Some tabs were using over 1Mbps. The home page now uses < 0.02 Mbps, and the advanced metrics tabs should not use more than ~.2Mbps. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/45 and https://github.com/wpilibsuite/SystemCoreTesting/issues/41
* Fix network interface bandwidth measurement units in UI. Addresses https://github.com/wpilibsuite/SystemCoreTesting/issues/43
* Disk statistics page auto-refreshes once per second to better support hotplug, hotremoval, and ejection
* Fix I2C Port Order

## Release 157
* Initial Alpha Release
* Add USB automounting and hotplug support (/U, /V, etc)
* Polish web interface
* Remove hardcoded and prebaked packages.

## Release 155
* Robot service waits for all can buses to be configured (15 sec timeout)

## Release 154
* Heartbeat module filters CAN interfaces by name before latching
* Expose entire control data value via sysfs attribute
* UI System Tab cleanup
* Far more verbose logs during package installation
* Fix copy-to-clipboard button across UI
* Add OS commit hash to the bottom of the settings tab
* Fixed window titles for homepage and terminal window
* Progress on OTA procedure

## Release 150
* Update MRCComm
* Heartbeat module handles new MRCComm spec
* Heartbeat module exposes new read-only sysfs interfaces for matchdata, controldata

## Release 149
* CAN txqueuelen increased to 1000 to handle larger bursts
* CAN Buses reordered - starting from the left side of the device : can_s0, can_s1, can_s2, can_s3, can_s4
* Previous ordering: can4, can3, can2, can1, can0

## Release 147
* Add .mp4 package icon support

## Release 146
* SocketCan Timing Patch

## Release 145
* Add docker for docker-based packages (enables ROS, custom environments, etc)

## Release 144
* New A/B Partition layout. Will need some adjusting to improve flashing speeds.

## Release 140
* CI test with latest cross compilation resources

## Release 139
* Package Manager - drag-and-drop packages via home page & package manager tab
* Add examples for auto-start and click-to-start (socket-activated) packages
* Add c++ application and kernel module cross compilation examples
* Strict Wifi SSID and Password Verification
* Lock various advanced WiFi configuration options

## Release 134
* Wifi Configuration improvements

## Release 133
* Improve WiFi Configuration, especially 5GHZ configuration
* Add locator service V2 to interface with HardwareManager 0.2.0
* Add SystemCore 3D model to IMU visualizer
* Double-click IMU visualizer for full-screen visualization
* Add opkg-utils
  * opkg-build
  * opkg-buildpackage
  * etc
* Add git
* Add vim
