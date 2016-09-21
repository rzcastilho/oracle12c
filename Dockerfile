FROM sath89/oracle-12c
MAINTAINER Rodrigo Zampieri Castilho <rodrigo.zampieri@gmail.com>

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get -y install build-essential openssh-server sudo man vim whois zip

RUN mkdir /var/run/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

USER root
WORKDIR /

RUN usermod -a -G sudo oracle
RUN echo 'oracle:welcome1' | chpasswd

USER oracle
WORKDIR /u01/app/oracle

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
