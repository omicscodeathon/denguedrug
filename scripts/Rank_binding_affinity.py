#!/bin/python

import os
import sys
from glob import glob


out_folder = "output"
results = glob(out_folder+"/*_uff_E=*")
rank = []
for fd in results:
	if not os.path.isfile(fd+"/log.txt"): continue
	name = os.path.basename(fd)
	name = name.split("_uff_E=")[0]
	with open(fd+"/log.txt", 'r') as f:
		for line in f:
			fg = line.split()
			if not len(fg) == 4: continue
			try:
				af = float(fg[1])
				if not int(fg[0]) == 1: continue
				index = 0
				isAdded = False
				for r in rank:
					if r[1] > af:
						rank.insert(index, (name, af))
						isAdded = True
						break
					index += 1
				if not isAdded:
					rank.append((name, af))
			except:
				pass


with open("ranked_"+out_folder+".tab", 'w') as f:
	f.write("POSITION\tNAME\tAFFINITY\n")
	cc = 1
	for r in rank: 
		f.write(str(cc)+"\t"+r[0]+"\t"+str(r[1])+" \n")
		cc += 1




