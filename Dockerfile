FROM alpine:3.10

MAINTAINER Pawel Urawski

####################################################
########               Update               ########
####################################################

RUN set -x \
    apk update && \
    apk --no-cache --no-progress upgrade \
    && apk add --no-cache \
        bash-completion \
        coreutils \
        squid \
    && rm -rf /var/cache/apk/*

RUN rm -rf /var/cache/apk/* 
#RUN touch /var/log/squid/access.log
#VOLUME ["/etc/samba","/var/lib/samba"]

EXPOSE 3128/tcp 3128/udp 
COPY sleepi.sh /
COPY init.sh /
RUN chmod +x /init.sh
RUN chmod +x /sleepi.sh
#CMD ["/bin/sh"]
CMD ["/init.sh"]
