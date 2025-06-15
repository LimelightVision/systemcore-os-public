Access to the latest SystemCore OS builds and cross-compilation resources.
Releases are automatically published and may not be fully tested

Release 150
* Update MRCComm
* Heartbeat module filters CAN interfaces by name before latching
* Heartbeat module handles new MRCComm spec
* Heartbeat module exposes new read-only sysfs interfaces for matchdata, controldata

Release 149
* CAN txqueuelen increased to 1000 to handle larger bursts
* CAN Buses reordered - starting from the left side of the device : can_s0, can_s1, can_s2, can_s3, can_s4
* Previous ordering: can4, can3, can2, can1, can0

Release 147
* Add .mp4 package icon support

Release 146
* SocketCan Timing Patch

Release 145
* Add docker for docker-based packages (enables ROS, custom environments, etc)

Release 144
* New A/B Partition layout. Will need some adjusting to improve flashing speeds.

Release 140
* CI test with latest cross compilation resources

Release 139
* Package Manager - drag-and-drop packages via home page & package manager tab
* Add examples for auto-start and click-to-start (socket-activated) packages
* Add c++ application and kernel module cross compilation examples
* Strict Wifi SSID and Password Verification
* Lock various advanced WiFi configuration options

Release 134
* Wifi Configuration improvements

Release 133
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
