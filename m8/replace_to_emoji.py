#!/usr/bin/python
#Write python program, which should read html document, parse it, and showit’s title.
#
import emoji
input_name = input("Please print file name for replace emoji: ")

with open(input_name, encoding="utf-8") as f:
    for line in f:
        print(emoji.emojize(line))
