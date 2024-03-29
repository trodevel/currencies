#!/bin/bash

# source: https://en.wikipedia.org/wiki/ISO_4217

INP=../raw_resources/currencies.csv
FL=../python/currencies.py

echo "from enum import Enum" > $FL
echo "class Currency(int, Enum):" >> $FL
awk -F"\t" '{printf "    %s = %s # %s\n", $1, $2, $4; }' $INP | sed "s/= [0]*/= /">> $FL
