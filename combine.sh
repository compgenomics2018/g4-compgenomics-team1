#!/usr/bin/bash

ls SRR*.gff > gfflist.txt
ls renamed*.fasta > fastalist.txt

concat () {
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
	cat ${array1[$j]} ${array2[$j]} > "cb_${array1[$j]}"  ##find intersection of the results between 2 tools with 99% coverage using bedtools  	
	done
}

concat "gfflist.txt" "fastalist.txt"