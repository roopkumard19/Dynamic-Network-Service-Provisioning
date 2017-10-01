#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

sleep 5

ifconfig wlan1 down

sleep 2

ifconfig wlan1 up

sleep 5

python ./activate_connection.py HANDIoTOVER2

