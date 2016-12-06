#!/usr/bin/sed -r

# Convert every line that doesn't have a tag to a raw text line
s#^(\s*)(\w.*)$#\1| \2#g

