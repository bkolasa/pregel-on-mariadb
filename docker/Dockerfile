FROM mariadb:10.5.8-focal

RUN apt-get -y update && apt-get -y install libmariadb3 libmariadb-dev python3.8 python3.8-dev python3-pip wget unzip

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y tzdata
RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Etc/UTC  /etc/localtime

RUN python3.8 -m pip install --upgrade pip mariadb
ENV PYTHONUNBUFFERED definitely

EXPOSE 3306


