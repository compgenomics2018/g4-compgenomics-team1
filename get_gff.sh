#!/usr/bin/bash

run_prokka () {
	while read line
	do
	mv prokka_$line/*.gff ./prokka_gff/$line.gff
	done < $1
}


run_prokka "genomer.txt"