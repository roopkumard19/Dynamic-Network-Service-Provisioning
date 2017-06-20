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

RUN cp /usr/src/app/hostapd-config /etc/hostapd/hostapd.conf \
	
	&& cp /usr/src/app/dnsmasq-config /etc/dnsmasq.conf

RUN chmod +x /usr/src/app/app.sh

