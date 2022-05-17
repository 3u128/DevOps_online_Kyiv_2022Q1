#!/usr/bin/python
#Write pythonprogram, which will parse user’s text, and replace some emotions with emoji’s (Look: pip install emoji)

import emoji
input_name = input("Please print file name for replace emoji: ")

with open(input_name, encoding="utf-8") as f:
    for line in f:
        print(emoji.emojize(line))
