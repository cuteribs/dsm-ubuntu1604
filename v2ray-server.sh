#!/bin/sh

INSTALL_FLAG="/app/v2ray-server.installed"
CONF="/app/v2ray-server.json"

if [ ! -f "$INSTALL_FLAG" ]; then
	dpkg -i /app/daemon_*.deb
	chmod +x /app/v2ray/v2ray	
	
	cp /app/v2ray/v2ray-server.json $CONF
	sed -i "s/SERVER_PORT/${SERVER_PORT}/g" $CONF
	sed -i "s/SERVER_UUID/${SERVER_UUID}/g" $CONF
	sed -i "s/SERVER_ALTER_ID/${SERVER_ALTER_ID}/g" $CONF
	
	mkdir /var/log/v2ray/
	
	touch $INSTALL_FLAG
fi

/app/v2ray/v2ray -config $CONF