FROM resin/rpi-raspbian

ENV INITSYSTEM on

RUN apt-get -q update \
	&& apt-get -qy install \
		wget \
		python python-dev python-pip python-virtualenv \
		build-essential  \
		net-tools \
		vim \
		dbus \
		python-dbus \
		git

RUN git clone http://github.com/seveas/python-networkmanager \
	&& cd python-networkmanager \
	&& python setup.py install \
	&& export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

COPY app/ /usr/src/app

WORKDIR /usr/src/app

RUN python activate_connection.py resin-hotspot
