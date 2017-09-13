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

RUN pip install speedtest-cli \
		psutil \
		schedule

RUN git clone http://github.com/seveas/python-networkmanager \
	&& cd python-networkmanager \
	&& python setup.py install

COPY app/ /usr/src/app

WORKDIR /usr/src/app

RUN chmod +x ./app.sh

CMD ["./app.sh"]

