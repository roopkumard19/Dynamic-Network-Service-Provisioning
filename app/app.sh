#!/bin/bash

# Disable Network Manager wireless
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
dbus-send --system --print-reply --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.DBus.Properties.Set string:"org.freedesktop.NetworkManager" string:"WirelessEnabled" variant:boolean:false

