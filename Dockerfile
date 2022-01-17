FROM ubuntu
MAINTAINER ServerWorld <admin@srv.world>
ENV TZ=Europe/Vilnius
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update
RUN apt-get -y install openssh-server apache2 supervisor
RUN echo "Hello DockerFile World" > /var/www/html/index.html
RUN mkdir /var/run/sshd; chmod 755 /var/run/sshd
RUN mkdir /root/.ssh; chown root. /root/.ssh; chmod 700 /root/.ssh
RUN ssh-keygen -A

ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD id_rsa /root/.ssh/authorized_keys

EXPOSE 22 80
ENTRYPOINT ["/bin/echo", "Hi, your ENTRYPOINT instruction in Exec Form !"]
