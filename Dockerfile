FROM ubuntu:20.04

ARG AntMediaServer

ARG BranchName=master

#Running update and install makes the builder not to use cache which resolves some updates
RUN apt-get update && apt-get install -y curl wget iproute2 cron logrotate

ADD ./${AntMediaServer} /home

RUN cd home \
    && mkdir app \
    && pwd \
    && wget https://raw.githubusercontent.com/kamit-transient/antmediaserver/main/install_ant-media-server.sh \
    && chmod 755 install_ant-media-server.sh

RUN cd home \
    && pwd \
    && ./install_ant-media-server.sh -i ${AntMediaServer} -s false
RUN echo "printing antmedia folder content for info..." \
	&& echo "##########" \
	&& ls -l /home/app/antmedia \
    	&& echo "########" \
	&& cp /home/app/antmedia/start.sh /home/am_start.sh \ 
	&& cat /home/app/antmedia/antmedia 
#	&& echo "##########################" \
#	&& cat /home/app/antmedia/antmedia.service

#RUN rm /home/app/antmedia/antmedia \
RUN wget -P /home/app/antmedia/ https://raw.githubusercontent.com/kamit-transient/antmediaserver/main/antmedia.sh 

RUN echo "confirm antmedia serviec init file" \
	&& cat /home/app/antmedia/antmedia \
	&& rm /home/app/antmedia/antmedia \
	&& mv /home/app/antmedia/antmedia.sh /home/app/antmedia/antmedia \
	&& ls -l /home/app/antmedia/ \
	&& cat /home/app/antmedia/antmedia \
#	&& cp /home/am_start.sh /home/app/antmedia/am_start.sh  \
	&& RED5_HOME=/home/app/antmedia

ENTRYPOINT  ["/home/am_start.sh"]
