
# This is a comment
FROM eclipse/ubuntu_jdk8
MAINTAINER Sun Seng David Tan <sunix@sunix.org>

RUN  sudo apt-get update && \
     sudo apt-get install -y wget git git-svn tig \
                             screen ack-grep tofrodos vim inetutils-ping \
                             libxtst6 libgtk-3-bin && \
     sudo apt-get clean && \
     sudo rm -rf /var/lib/apt/lists/*

WORKDIR /home/user/
RUN wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz && \
    tar -zxvf eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz && \
    rm eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
EXPOSE 8081 8082 8083 8084 8085
