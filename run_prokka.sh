#!/usr/bin/bash

ls *fasta > fastalist.txt

run_prokka () {
	i=0
	exec 3<"$1"
	exec 4<"$2"
	while read value1 <&3
	do
	read value2 <&4
	array1[$i]=$value1
	array2[$i]=$value2
	i=$(($i +1))
	done
	
	for ((j=0;j<=$(($i-1));j+=1)) ##iterate through the array to get the file name from file name list
	do
	prokka --outdir prokka_${array1[$j]} --kingdom Bacteria --gram neg /projects/data/team1_genomeAssembly/true_assembly/${array2[$j]}
	done
}
run_prokka "$1" "fastalist.txt"

mkdir prokka_gff

while read line
do
mv prokka_$line/*.gff ./prokka_gff/$line.gff
done < $1
