FROM resin/rpi-raspbian

RUN apt-get -q update \
	&& apt-get -qy install \
 		wget \
		curl \
        	git \
		hostapd \
		dnsmasq \
		openssh-server \
		net-tools \
		iptables \
		psmisc

WORKDIR /usr/src/app

COPY app/ /usr/src/app

CMD ["mv", "/etc/hostapd/hostapd.conf", "/etc/hostapd/hostapd.bak"]

CMD ["mv", "/etc/dnsmasq.conf", "/etc/dnsmaq.bak"]

CMD ["cp", "hostapd-config", "/etc/hostapd/hostapd.conf"]

CMD ["cp", "dnsmasq-config", "/etc/dnsmasq.conf"]

RUN chmod +x /usr/src/app/app.sh

CMD ["/bin/bash"]

CMD ["/usr/src/app/app.sh"]
