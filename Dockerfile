FROM eclipse/ubuntu_jdk8
MAINTAINER Sun Seng David Tan <sunix@sunix.org>

RUN  sudo apt-get update && \
     sudo apt-get install -y --no-install-recommends \
                             wget git git-svn tig \
                             screen ack-grep tofrodos vim inetutils-ping \
                             libxtst6 libgtk-3-bin \
                             apt-transport-https \
                             ca-certificates \
                             curl \
                             golang \
                             software-properties-common && \
     sudo apt-get clean && \
     sudo rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - && \
    sudo apt-get install -y nodejs && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add - && \
    sudo add-apt-repository \
       "deb https://apt.dockerproject.org/repo/ \
       ubuntu-$(lsb_release -cs) \
       main" && \
    sudo apt-get update && \
    sudo apt-get -y install docker-engine && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

WORKDIR /home/user/
RUN wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/neon/2/eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz && \
    tar -zxvf eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz && \
    rm eclipse-jee-neon-2-linux-gtk-x86_64.tar.gz
RUN wget https://storage.googleapis.com/gwt-releases/gwt-2.8.0.zip && \
    unzip gwt-2.8.0.zip && \
    rm gwt-2.8.0.zip
EXPOSE 8081 8082 8083 8084 8085
