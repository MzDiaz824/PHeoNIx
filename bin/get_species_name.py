#!/usr/bin/env python

import pandas as pd
import argparse


# Argument parser: get arguments from Kraken report text files
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--sample")
parser.add_argument("-f","-inputfile1", type=argparse.FileType('r'), help = "file one")
args = parser.parse_args()

specdf = pd.read_csv(args.inputfile1, sep="\t")

var = "S"
var2 = "S1"
specdf.columns = ["Col1", "Col2", "Col3", "Col4", "Col5", "Col6"]

species_match = specdf.loc[(specdf["Col4"] == var) & (specdf["Col4"] != var2), "Col6"]
#print(species_match.iloc[0])

new_file = open("*.txt", 'w')
new_file.write("genus:" + species_match.split()[0] + "\n" + species_match.split()[1])
new_file.close
