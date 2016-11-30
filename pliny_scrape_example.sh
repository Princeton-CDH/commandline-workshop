#!/bin/bash

# Get the files from latinlibrary.com
COUNTER=0
while [ $COUNTER -lt 11 ]; do
	wget "http://www.thelatinlibrary.com/pliny.ep$COUNTER.html"
	let COUNTER=COUNTER+1
done

# Concatenate them together and cleanup
cat *pliny.ep*.html > pliny.html
rm -f *pliny.ep*.html

# Clear windows encoded em-dashes, remove html, remove html codes for < and >
# blank lines (using a standard common to the entire POSIX world)

sed -E 's/&#151;/—/g; s/<[^>]*>//g; s/&lt;/\</g; s/&gt;/\>/g; /^[[:space:]]*$/d' \
pliny.html > pliny.txt

# sed 's/[0-9]/\'$'\n''/g' pliny.txt 
# This would strip letter and section numbers producing a new line for each. The '$'\n'' is a workaround for FreeBSD Unixes,
# which don't have the \n command character
