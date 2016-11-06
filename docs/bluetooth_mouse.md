## Pairing a bluetooth mouse

```
apt-get install bluez
```

Will require also https://gitlab.com/iankelling/evhz to see the mouse refresh rate.

```
$ bluetoothctl 
[NEW] Controller 30:52:CB:82:C4:EE yoshi [default]
[NEW] Device 00:1F:20:FB:0F:34 00-1F-20-FB-0F-34
[bluetooth]# list
Controller 30:52:CB:82:C4:EE yoshi [default]
[bluetooth]# select 30:52:CB:82:C4:EE 
[bluetooth]# scan on
Discovery started
[CHG] Controller 30:52:CB:82:C4:EE Discovering: yes
Controller 30:52:CB:82:C4:EE yoshi [default]
[bluetooth]# devices
Device 00:1F:20:FB:0F:34 00-1F-20-FB-0F-34
[bluetooth]# trust 00:1F:20:FB:0F:34 
Changing 00:1F:20:FB:0F:34 trust succeeded
[bluetooth]# pair 00:1F:20:FB:0F:34 
Attempting to pair with 00:1F:20:FB:0F:34
[CHG] Device 00:1F:20:FB:0F:34 Connected: yes
[CHG] Device 00:1F:20:FB:0F:34 Modalias: usb:v046DpB014d1200
[CHG] Device 00:1F:20:FB:0F:34 UUIDs: 00001000-0000-1000-8000-00805f9b34fb
[CHG] Device 00:1F:20:FB:0F:34 UUIDs: 00001124-0000-1000-8000-00805f9b34fb
[CHG] Device 00:1F:20:FB:0F:34 UUIDs: 00001200-0000-1000-8000-00805f9b34fb
[CHG] Device 00:1F:20:FB:0F:34 ServicesResolved: yes
[CHG] Device 00:1F:20:FB:0F:34 Paired: yes
Pairing successful
[CHG] Device 00:1F:20:FB:0F:34 ServicesResolved: no
[CHG] Device 00:1F:20:FB:0F:34 Connected: no
[bluetooth]# connect 00:1F:20:FB:0F:34 
Attempting to connect to 00:1F:20:FB:0F:34
[CHG] Device 00:1F:20:FB:0F:34 Connected: yes
Connection successful
```
