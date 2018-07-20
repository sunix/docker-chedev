FROM eclipse/che-theia
MAINTAINER Sun Seng David Tan <sunix@sunix.org>

RUN apk update && \
    apk add --no-cache tig screen git-svn git-perl \
                       ack vim curl go docker && \
    rm -rf /tmp/* /var/cache/apk/*
