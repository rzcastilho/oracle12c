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

RUN chsh -s /bin/bash oracle
RUN usermod -a -G sudo oracle
RUN echo 'oracle:welcome1' | chpasswd

EXPOSE 22 1521 8080

ADD entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
