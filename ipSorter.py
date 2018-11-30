#!/usr/bin/python
import sys

with open(sys.argv[1], 'r') as file:
    list = sorted([i.strip() for i in file.readlines()], key = lambda x: int(''.join((lambda y:lambda z:y(y,z))(lambda s,x: x if len(x) == 3 else s(s, '0'+x))(i) for i in x.split('.'))))
    for entry in list:
        print(entry)
