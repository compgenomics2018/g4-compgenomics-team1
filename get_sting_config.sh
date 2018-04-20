#!/bin/bash

(test ! $1 || test ! $2) && printf "\nplease specify input path and output config file name\n\nExample: $0 database/ test1\n\n" && exit 1;

cd $1;

printf "[loci]\n" > $2.config.txt

for file in *.fasta; do
  n=${file%.*}
  printf "$n\t" >> $2.config.txt
  realpath $file >> $2.config.txt
  printf "\n"
done;

cd - > /dev/null 2>&1
