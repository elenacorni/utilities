#!/usr/bin/python

from __future__ import division
import sys
import math
import os

if len(sys.argv) != 3:
    print '\nUsage: python script.py  DISK (PB)  TAPE (TB!!)\nEs: python script.py  3.321 (PB!)  359.3 (TB!)\n'
    sys.exit()


disk = float(sys.argv[1])
tape = float(sys.argv[2])

print disk
print tape

catalogo = ( disk + tape/1024)  * 1.024 * 1.024 * 1.024 * 1.024 * 1.024

print catalogo
