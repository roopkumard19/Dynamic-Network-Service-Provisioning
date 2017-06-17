#!/bin/bash

# Disable Network Manager wireless
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
dbus-send --system --print-reply --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.DBus.Properties.Set string:"org.freedesktop.NetworkManager" string:"WirelessEnabled" variant:boolean:false

# Do some cleaning up
pkill -9 dnsmasq
rfkill unblock wlan
ifdown $1
ifup $1

#Enable NAT
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface $2 -j MASQUERADE
iptables --append FORWARD --in-interface $1 -j ACCEPT
 
sysctl -w net.ipv4.ip_forward=1
 
#start hostapd
hostapd /etc/hostapd/hostapd.conf &
dnsmasq --keep-in-foreground

