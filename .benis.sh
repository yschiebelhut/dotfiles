#!/bin/bash
while true; do
	BENIS=$(curl -s "https://pr0gramm.com/api/profile/info?name=Denkplatte" | cut -d"{" -f3 | cut -d"," -f4 | cut -d":" -f2)
	echo -e "Benis: $BENIS" > .benis
	sleep 60
done
