#!/bin/python

import sys

pattern = sys.argv[1] 

if not pattern:
    raise Exception("Pass pattern")

new_s = ""
for c in pattern:
    if c == "{":
        new_s +="\\\{"
    elif c == "}":
        new_s +="\\\}"
    elif c == "/":
        new_s +="\/"
    else:
        new_s += c

print(new_s)
