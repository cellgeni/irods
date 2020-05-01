FROM continuumio/miniconda

RUN apt-get update && apt-get install -y wget && apt-get install -y procps gnupg 
RUN echo 'deb http://deb.debian.org/debian jessie main' >> /etc/apt/sources.list
RUN echo 'deb http://deb.debian.org/debian jessie-updates main' >> /etc/apt/sources.list
RUN echo 'deb http://security.debian.org jessie/updates main' >> /etc/apt/sources.list
RUN wget https://packages.irods.org/irods-signing-key.asc 
RUN apt-key add irods-signing-key.asc 
RUN echo "deb [arch=amd64] https://packages.irods.org/apt/ xenial main" | tee /etc/apt/sources.list.d/renci-irods.list
RUN apt-get update && apt-get install -y libssl1.0.0 && apt-get install -y libfuse2 irods-icommands

RUN DEFAULT_USER="ubuntu"

ADD .irods /root/.irods
COPY ./iinit.sh /iinit.sh
