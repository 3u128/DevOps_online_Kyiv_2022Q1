#!/usr/bin/python
#Write python program, which should read html document, parse it, and showit’s title.
#
input_name = input("Please print file name for print title ")

title = "<title>"

with open(input_name, encoding="utf-8") as f:
    for line in f:
        if title in line:
            print (line, end='')
