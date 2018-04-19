#!/usr/bin/bash

mkdir prokka_gff

while read line
do
mv prokka_$line/*.gff ./prokka_gff/$line.gff
done < $1
