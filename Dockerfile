FROM resin/rpi-raspbian

#Install Utility

RUN apt-get -q update \
	&& apt-get -qy install \
 		wget \
		python python-dev python-pip python-virtualenv \
		build-essential  \
		curl \
        	git 


RUN pip install paho-mqtt		

WORKDIR /usr/src/app

COPY app/ /usr/src/app
CMD ["python", "/usr/src/app/main.py"]
