#!/bin/bash

#
# 2x16 character LCD
#
# Befehle: http://www.digole.com/index.php?productID=551
# http://linuxconfig.org/bash-scripting-tutorial
#
# Mark Hoffmann 21.05.2014
#

# Define LCD's UART connection 
LCD_DEVICE=/dev/ttyUSB0

# Set UART speed
stty -F $LCD_DEVICE 9600 

# Cursor
CS=0

if  [ $# -eq 1 ]; then
 echo "CLCS$CS" > $LCD_DEVICE
 h1="TT$1"
 echo $h1 > $LCD_DEVICE
 #echo $h1
 #echo
elif [ $# -eq 2 ]; then
 echo "CLCS$CS" > $LCD_DEVICE
 h1="TT$1"
 h2="TT $2"
 echo -e "$h1\nTP10\n$h2" > $LCD_DEVICE
 #echo $1
 #echo $2
 #echo
else
 echo 
 echo "Setting 1602 LCD Text"
 echo
 echo "Please supply one or two parameters - LCD's first and second line!"
 echo
fi
