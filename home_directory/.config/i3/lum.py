#! /usr/bin/python3

import subprocess
import sys
import logging

light_values_binary = subprocess.check_output("xrandr --verbose | grep -i brightness | cut -f2 -d ' '", shell=True)
active_monitors_binary = subprocess.check_output("xrandr | grep connected | grep -v disconnected | cut -f1 -d ' '", shell=True)

monitor_string = active_monitors_binary.decode('ascii')
monitor_list = monitor_string.split("\n")[0:-1]

light_string = light_values_binary.decode('ascii')
light_list = light_string.split("\n")[0:-1]

print(monitor_list)
print(light_list)

index = 0
for monitor in monitor_list:
    #avoid the problem when the first screen is absent
    light_value = float(light_list[-1-index])
    if(sys.argv[1] == "up"):
        if(light_value < 1.0):
            light_value += 0.1
            index += 1 
            subprocess.check_output("xrandr --output {0} --brightness {1}".format(monitor, light_value), shell=True)
    elif(sys.argv[1] == "dwn"):
        if(light_value > 0.0):
            light_value -= 0.1
            index += 1 
            subprocess.check_output("xrandr --output {0} --brightness {1}".format(monitor, light_value), shell=True)
    else:
        logging.warning("Invalid arguments : {0}".format(sys.argv))
        break 
            
