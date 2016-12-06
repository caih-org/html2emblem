#!/usr/bin/sed -r

# Convert comments to "/ comment"
s#^(\s*)<!--(.*)-->\s*$#\1/\2#g
s#^(\s*)<!--(.*)-->#\1/\2\n\1#g
s#^(\s*)(.*)<!--(.*)-->\s*$#\1/\3\n\1\2#g

# Delete closing tags that are on a whole line
/^\s*<\/[^>]+>\s*$/d

# Convert tags that are on a whole line to emblem
s#^(\s*)<([^>]+)\s*/>\s*$#\1\2#g
s#^(\s*)<([^>]+)>\s*$#\1\2#g

# Convert tags that have content inside
s#^(\s*)<([^> ]+)([^>]*)>(.*)</\2>\s*$#\1\2\3 \4#g

# Convert css classes and ids
:redo
s/class=(["'])([^"' ]+) ([^\1]+)\1/class=\1\2.\3\1/g
t redo
s/^(\s*[a-z\-\.#]+) ([^:<]*)class=(["'])([^ \3]+)\3/\1.\4 \2/g
s/^(\s*[a-z\-\.#]+) ([^:<]*)id=(["'])(.+)\3/\1#\4 \2/g
s#^(\s*)div([#\.])#\1\2#g

