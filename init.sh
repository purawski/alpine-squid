#!/bin/sh
if [ -e /etc/squid/squid.conf ]; then
    /usr/sbin/squid -f /etc/squid/squid.conf -d2
    tail -f /var/log/squid/access.log
    sleep infinity
else
    sleep infinity
fi
