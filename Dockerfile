
# This is a comment
FROM eclipse/ubuntu_jdk8
MAINTAINER Sun Seng David Tan <sunix@sunix.org>

RUN  sudo apt-get update && \
     sudo apt-get install -y wget git git-svn tig screen ack-grep tofrodos vim libgtk2.0-0 libxtst6 && \
     sudo apt-get clean && \
     sudo rm -rf /var/lib/apt/lists/*

WORKDIR /home/user/
RUN wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
RUN tar -zxvf eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
