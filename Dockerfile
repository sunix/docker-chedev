FROM eclipse/centos_jdk8
MAINTAINER Sun Seng David Tan <sunix@sunix.org>

RUN  sudo yum update -y && \
     sudo yum install -y  epel-release && \
     sudo yum install -y  ack tig meld \
                          screen tofrodos \
                          golang \
                          bzip2 \
                          bash-completion bash-completion-extras \
                          xorg-x11-xauth \
                          postgresql \
                          yum-utils device-mapper-persistent-data lvm2 && \
     sudo yum clean all

RUN sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    sudo yum -y makecache fast && \
    sudo yum -y install docker-ce && \
    sudo yum clean all


RUN curl --silent --location https://rpm.nodesource.com/setup_7.x | sudo bash - && \
    sudo yum -y install nodejs && \
    sudo yum clean all


RUN sudo npm install -g gulp

WORKDIR /home/user/
RUN wget http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/technology/epp/downloads/release/oxygen/1a/eclipse-jee-oxygen-1a-linux-gtk-x86_64.tar.gz && \
    tar -zxvf eclipse-jee-oxygen-1a-linux-gtk-x86_64.tar.gz && \
    rm eclipse-jee-oxygen-1a-linux-gtk-x86_64.tar.gz
RUN wget https://storage.googleapis.com/gwt-releases/gwt-2.8.0.zip && \
    unzip gwt-2.8.0.zip && \
    rm gwt-2.8.0.zip

RUN echo 'X11UseLocalhost=no' | sudo tee --append /etc/ssh/sshd_config

RUN wget https://mirror.openshift.com/pub/openshift-v3/clients/3.6.173.0.5/linux/oc.tar.gz && \
    sudo tar zxvf oc.tar.gz -C /usr/local/bin && \
    rm oc.tar.gz

EXPOSE 8081 8082 8083 8084 8085 10000
WORKDIR /projects/