#! /bin/bash

BASE="https://ghidra-sre.org/"
ZIPFILE=$(curl https://ghidra-sre.org/ -s | grep -oim1 "ghidra[^( )]*zip")
VERSION=$(echo $ZIPFILE | awk -F "_PUBLIC" '{print $1}')

if test -f $ZIPFILE; then
	echo "You already have the latest version!"
else
	rm -r ghidra*
	wget -q --progress=bar:force ${BASE}${ZIPFILE}
	unzip $ZIPFILE
	mkdir -p /home/vagrant/.bin
	cd $VERSION
	ln -sf /ghidra/$VERSION/ghidraRun /home/vagrant/.bin/ghidra
fi
