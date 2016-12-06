#!/usr/bin/sed -r

# Missing conversions add raw text
s#^(\s*)([<].*)$#\1| \2#g

