#!/usr/bin/env python
# coding=UTF-8
"""	Prints a battery meter for use in a zsh theme """

import math, sys

""" Config """

output_length = 10
blank_when_battery_full = True
filled_char, empty_char = u'▪', u'▫'

""" Read battery charge """

def read_battery_percent ():
	"""	Reads the battery charge as an integer between 0 and 100,
		using 'acpi -b'	"""
	import subprocess, re
	process = subprocess.Popen(["acpi", "-b"], stdout=subprocess.PIPE)
	output = process.communicate()[0].strip()
	return int(re.search("^Battery 0: .+, ([\d]+)\%",output).group(1))

""" Output """

charge = read_battery_percent()

if not(blank_when_battery_full == True and charge == 100):
	filled	= int(math.ceil(charge / output_length))
	empty	= output_length - filled
	meter	= (filled * filled_char + empty * empty_char).encode('utf-8')

	color = 'green'if filled > 6 else 'yellow' if filled > 4 else 'red'
	sys.stdout.write("%F{{{}}}{}%f".format(color, meter))
