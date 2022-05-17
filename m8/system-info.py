#!/usr/bin/python
# Write program, that will show basic PC information (OS, RAM amount, HDD’s, and etc.)

import psutil
import os
import platform

print ("OS name: ", os.name)
print ("Platform type: ", platform.system())
#memory size
#human readable size:
mem = psutil.virtual_memory().total / (1024.0 ** 3)
memory = round(mem, 2)
print("memory: ", memory, "gb")

#disk size
space_used = psutil.disk_usage('/').total / 1024**3
space_used_percent = (psutil.disk_usage('/').percent)

print("hdd: ", space_used, "gb")
print("hdd per %: ", space_used_percent, "gb")

