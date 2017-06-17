FROM resin/rpi-raspbian

ENV INITSYSTEM on

RUN apt-get -q update \
	&& apt-get -qy install \
		hostapd \
		dnsmasq \
		net-tools \
		iptables \
		psmisc \
		vim \
		dbus \
		rfkill \
	&& rm -rf /var/lib/apt/lists/*

COPY app/ /usr/src/app

RUN cp /usr/src/app/hostapd-config /etc/hostapd/hostapd.conf \
	
	&& cp /usr/src/app/dnsmasq-config /etc/dnsmasq.conf \

	&& cp /usr/src/app/interfaces /etc/network/interfaces

RUN chmod +x /usr/src/app/app.sh

CMD ["/usr/src/app/app.sh", "wlan1", "wlan0"]
