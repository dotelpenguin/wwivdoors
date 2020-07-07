#!/bin/python3
import math
import sys
sys.stdout.encoding

# Make the whole code 3.x.x compatible too...
if sys.version[0]=="3": raw_input=input

def write(line):
        print(line.encode('cp437'))

# The only _varaibles_ required for this DEMO...
char="*"
x=0
y=0

# A Simple clear screen command for this DEMO...
for n in range(0, 64, 1): print("\r\n")

# This function is just basic for this DEMO but shows the power of the ANSI _Esc_ codes...
def locate(user_string=".", x=0, y=0):
	# Don't allow any user errors. Python's own error detection will check for
	# syntax and concatination, etc, etc, errors.
	x=int(x)
	y=int(y)
	if x>=25: x=25
	if y>=80: y=80
	if x<=0: x=0
	if y<=0: y=0
	HORIZ=str(y)
	VERT=str(x)
	# Plot the user_string at the starting at position HORIZ, VERT...
	print("\033["+VERT+";"+HORIZ+"f"+user_string)

# Plot the upwards slope of the triangle...
#char="\xC4"
char="\x177"
x=1
while x<=2:
    y=1
    while y<=78:
	    locate(char, x, y)
	    y=y+1
    x=x+1

input("Press Enter to continue...")

