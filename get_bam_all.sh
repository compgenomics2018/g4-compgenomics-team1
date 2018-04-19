#!/bin/bash

## user should change the path as your own dirctory below.(inp_fold, outp_fold, best_gen_file)
inp_fold=/projects/data/team1_ComparativeGenomics/Reads/upload
outp_fold=/projects/home/qyue7/samtools_output
best_gen_file=/projects/home/qyue7/best_genomes_all.txt

for id in `ls $inp_fold | grep 'SRR' | cut -d '_' -f 1 | uniq`
do
    echo $id
    ref_file=`grep $id ${best_gen_file} | awk '{print $2}'`
    echo $ref_file
    bwa index -a is $ref_file
    bwa mem $ref_file ${inp_fold}/${id}_1.paired.fastq.gz ${inp_fold}/${id}_2.paired.fastq.gz > ${id}_aln.sam
    samtools fixmate -O bam ${id}_aln.sam ${id}_aln.bam
    samtools sort -O bam -o {id}_aln_sorted.bam -T ./temp ${id}_aln.bam
    samtools index ${id}_aln_sorted.bam
done
