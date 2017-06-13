FROM resin/rpi-raspbian

RUN apt-get -q update \
	&& apt-get -qy install \
 		wget \
		curl \
        	git \
		hostapd \
		dnsmasq

WORKDIR /usr/src/app

COPY app/ /usr/src/app

CMD ["/bin/bash"]

CMD ["mv", "/etc/hostapd/hostapd.conf", "/etc/hostapd/hostapd.bak"]

CMD ["mv", "/etc/dnsmasq.conf", "/etc/dnsmaq.bak"]

CMD ["cp", "hostapd-config", "/etc/hostapd/hostapd.conf"]

CMD ["cp", "dnsmasq-config", "/etc/dnsmasq.conf"]

CMD ["chmod", "+x", "/usr/src/app/access_point.sh"]

CMD ["sudo", "/usr/src/app/access_point.sh", "wlan1", "wlan0"]
