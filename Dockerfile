FROM sath89/oracle-12c
MAINTAINER Rodrigo Zampieri Castilho <rodrigo.zampieri@gmail.com>

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get -y install build-essential openssh-server sudo man vim whois zip

RUN mkdir /var/run/sshd
RUN echo 'root:oracle' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

USER root
WORKDIR /

RUN usermod -a -G sudo oracle

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
