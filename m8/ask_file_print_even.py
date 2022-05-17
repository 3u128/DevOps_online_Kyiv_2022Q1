#!/usr/bin/python
#Write python program, which will askfile name. File should be read, and only even lines should be shown.

with open('askfile', encoding="utf-8") as f:
    i = 0
    for line in f:
        i = i+1
        if (i % 2 == 0):
            print (line, end='')
