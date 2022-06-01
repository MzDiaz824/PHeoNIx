#!/usr/bin/env python

import pandas as pd
import argparse

# Argument parser: get arguments from mash_dist files
def parse_args(args=None):
    Description = "Sort and trim mash_dist file."
    Epilog = "Example usage: python topani.py <FILE_IN> <FILE_OUT>"

    parser = argparse.ArgumentParser(description=Description, epilog=Epilog)
    parser.add_argument("FILE_IN", help="Input mash_dist file.")
    parser.add_argument("FILE_OUT", help="Output file.")
    return parser.parse_args(args)

anihits = pd.read_csv(args.FILE_IN, sep="\t")
anihits.columns = ["Col1","Col2","Col3","Col4","Col5"]

sortedData = anihits.sort("Col4", ascending=False)
outputData = sortedData.head(20)

outputData.to_csv(r'args.FILE_OUT/*.txt', header=None, index=None, sep='\t', mode='a')

def main(args=None):
    args = parse_args(args)
    top_ani(args.FILE_IN, args.FILE_OUT)

if __name__ == "__main__":
    sys.exit(main())
