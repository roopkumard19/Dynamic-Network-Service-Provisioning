FROM resin/rpi-raspbian

ENV INITSYSTEM on

RUN apt-get -q update \
	&& apt-get -qy install \
		wget \
		python python-dev python-pip python-virtualenv \
		build-essential  \
		hostapd \
		dnsmasq \
		net-tools \
		iptables \
		psmisc \
		vim \
		dbus \
		python-dbus \
		rfkill

COPY app/ /usr/src/app

