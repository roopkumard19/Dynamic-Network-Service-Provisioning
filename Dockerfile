FROM resin/rpi-raspbian

RUN apt-get -q update \
	&& apt-get -qy install \
 		wget \
		curl \
        	git \
		hostapd \
		dnsmasq \
		net-tools \
		iptables \
		psmisc

ENV INITSYSTEM on

COPY app/ /usr/src/app

CMD ["/bin/bash"]

CMD ["mv", "/etc/hostapd/hostapd.conf", "/etc/hostapd/hostapd.bak"]

CMD ["mv", "/etc/dnsmasq.conf", "/etc/dnsmasq.bak"]

CMD ["cp", "/usr/src/app/hostapd-config", "/etc/hostapd/hostapd.conf"]

CMD ["cp", "/usr/src/app/dnsmasq-config", "/etc/dnsmasq.conf"]

RUN chmod +x /usr/src/app/app.sh

CMD ["/usr/src/app/app.sh", "wlan1", "wlan0"]
