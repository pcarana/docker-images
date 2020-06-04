#!/bin/sh

MY_CC=$1

# Copy from the mounted volume to a local folder
cp -r /source /tmp

# Show only stderr output (autogen sends info to stderr, so skip it)

sh ./autogen.sh > autogen.log 2>&1
if ! [ $? = 0 ] ; then
	cat autogen.log
	>&2 echo "[ERROR] Autogen"
	exit 2
else
	echo "[OK] Autogen"
fi

CC=$MY_CC ./configure > /dev/null
if ! [ $? = 0 ] ; then
	>&2 echo "[ERROR] Configure"
	exit 2
else
	echo "[OK] Configure"
fi

make > /dev/null 2> make.log
if ! [ $? = 0 ] ; then
	>&2 echo "[ERROR] Make"
	exit 2
elif [ `wc -l make.log | awk '{ print $1 }'` -gt 0 ] ; then
	cat make.log
	echo "[WARNING] Make"
	exit 1
else
	echo "[OK] Make"
fi