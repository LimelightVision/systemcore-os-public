Access to the latest SystemCore OS builds and cross-compilation resources.
Releases are automatically published and may contain bugs.

## Alpha 2 (6/28/25) (Building)

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
