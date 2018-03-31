FROM centos:latest
MAINTAINER Luan Nico <luannico27@gmail.com>

RUN yum update -y && yum upgrade -y
RUN yum install -y sudo unzip wget curl git vim nmap-ncat iproute stunnel
RUN yum clean all

ENV HOME /root
WORKDIR /root

COPY send.sh send.sh
COPY receive.sh receive.sh

COPY stunnel.pem stunnel.pem
COPY stunnel-client.conf stunnel-client.conf
COPY stunnel-server.conf stunnel-server.conf

COPY secure_send.sh secure_send.sh
COPY secure_receive.sh secure_receive.sh

CMD ["bash"]
