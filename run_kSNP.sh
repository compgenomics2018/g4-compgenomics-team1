#!/bin/bash

inp_fold=/projects/data/team1_GenePrediction/true_assemblies
outp_fold=/projects/data/team1_ComparativeGenomics/kSNP/genomes
mkdir $outp_fold

for f in $inp_fold'/'*.fasta; do
    g=`echo $f | awk '{print substr($0,53,10)}'`
    cp $f $outp_fold$'/'$g$'.fasta'
    echo $outp_fold$'/'$g$'.fasta'$'\t'$g >> input_list.txt
done

MakeFasta input_list.txt sh.fasta

Kchooser sh.fasta

kSNP3 -in input_list.txt -outdir final_selected_genomes -annotate annotated_list.txt -k 21 -vcf -ML | tee log.txt 
