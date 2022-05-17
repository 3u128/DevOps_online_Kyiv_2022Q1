#!/usr/bin/python
#Write python program, which will askfile name. File should be read, and only even lines should be shown.

input_name = input("Please print file name for print even numbes ")

with open(input_name, encoding="utf-8") as f:
    i = 0
    for line in f:
        i = i+1
        if (i % 2 == 0):
            print (line, end='')
