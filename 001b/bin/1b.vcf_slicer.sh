#!/bin/bash

POP=$2
VCF_FILE=$1
COLS=$(cat results/$POP"_sample.list")
TAR=$3.build

echo "Hello, today we are slicing $POP samples from $VCF_FILE"
echo "Collumns are $COLS"
echo "Target is $TAR"

zcat $VCF_FILE | cut -f$COLS | gzip -f -1 > $TAR
