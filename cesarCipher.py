#!/usr/bin/python
import sys

if sys.argv[1] == '-h':
    print('Format python [encrypted text]')
else:
    output = ''
    input = sys.argv[1]
    for x in range(1, 25):
        for letter in input:
            output += chr((ord(letter) + x) % 26 + 97)
        print(output)
        output = ''
