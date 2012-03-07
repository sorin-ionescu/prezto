#!/usr/bin/env python
# coding=UTF-8
"""	Prints a battery meter for use in a zsh theme """

import sys

""" Config """

output_length = 10
hide_when_charge_is_above = 90
blank_when_battery_full = True
filled_char, empty_char = u'▪', u'▫'

""" Read battery charge """

def read_battery_percent (sp, regex):
	"""	Reads the battery charge as an integer between 0 and 100, using a given process and regex. """
	import subprocess, re
	process = subprocess.Popen(sp, stdout=subprocess.PIPE)
	output = process.communicate()[0].strip()
	return int(re.search(regex, output, re.MULTILINE).group(1))

if sys.platform.startswith('darwin'):
	""" OSX - 'pmset -g batt' """
	charge = read_battery_percent(["pmset", "-g", "batt"], "^.+\t([\d]+)\%")
elif sys.platform.startswith('freebsd'):
	"""	Freebsd - 'acpiconf -i 0' """
	charge = read_battery_percent(["acpiconf", "-i", "0"], "")
else:
	"""	Linux - 'acpi -b' """
	charge = read_battery_percent(["acpi", "-b"], "^Battery 0: .+, ([\d]+)\%")

""" Output """

if charge < hide_when_charge_is_above:
	filled	= int(charge / output_length)
	empty	= output_length - filled
	meter	= (filled * filled_char + empty * empty_char).encode('utf-8')

	color = 'green'if filled > 6 else 'yellow' if filled > 4 else 'red'
	sys.stdout.write("%F{{{}}}{}%f".format(color, meter))
