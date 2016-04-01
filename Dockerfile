FROM ubuntu

RUN apt-get update
RUN apt-get install -y default-jre
RUN apt-get install -y git
RUN apt-get install -y screen
RUN apt-get install -y python-setuptools
RUN easy_install supervisor

WORKDIR /root

# MINECRAFT ENVIRONMENT VARIABLES
ENV   MINECRAFT_DIR   /root/minecraft
ENV   MINECRAFT_ID    niner-miners-server
ENV   MINECRAFT_JAR   mcserver.jar
ENV   MINECRAFT_MIN   1024M
ENV   MINECRAFT_MAX   3072M

# SSH TUNNEL ENVIRONMENT VARIABLES
ENV   PORT_MAP_SSH      "22:60122"
ENV   PORT_MAP_API      "XX:50100"
ENV   PORT_MAP_DYNMAP   "8123:50200"
ENV   PORT_MAP_SERVER   "25565:60100"

ADD   ./docker .

# CMD   ["supervisord", "-c", "supervisord.conf"]
CMD   ["bin/server"]
