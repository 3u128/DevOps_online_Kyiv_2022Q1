#!/usr/bin/python
# https://docs.python.org/3/library/datetime.html
# 1. Write easy program, which will display current date and time.

from datetime import date

today = date.today()

print (today.strftime("%B %d, %Y"))

