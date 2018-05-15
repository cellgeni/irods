FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget && apt-get install -y procps
RUN echo 'deb http://deb.debian.org/debian jessie main' >> /etc/apt/sources.list
RUN echo 'deb http://deb.debian.org/debian jessie-updates main' >> /etc/apt/sources.list
RUN echo 'deb http://security.debian.org jessie/updates main' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y libssl1.0.0 && apt-get install -y libfuse2
RUN wget ftp://ftp.renci.org/pub/irods/releases/4.1.10/ubuntu14/irods-icommands-4.1.10-ubuntu14-x86_64.deb
RUN dpkg -i irods-icommands-4.1.10-ubuntu14-x86_64.deb
RUN wget ftp://ftp.renci.org/pub/irods/plugins/irods_auth_plugin_krb/1.4/irods-auth-plugin-krb-1.4-ubuntu14-x86_64.deb
RUN dpkg -i irods-auth-plugin-krb-1.4-ubuntu14-x86_64.deb

RUN DEFAULT_USER="ubuntu"

ADD .irods /root/.irods
ADD iinit.sh iinit.sh
