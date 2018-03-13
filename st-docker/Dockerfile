FROM centos:latest
MAINTAINER Luan Nico <luannico27@gmail.com>

RUN yum update -y && yum upgrade -y
RUN yum install -y sudo unzip wget curl git vim nmap-ncat iproute
RUN yum clean all

ENV HOME /root
WORKDIR /root

COPY send.sh send.sh
COPY receive.sh receive.sh

CMD ["bash"]
