#!/bin/bash

bacGWAS_path=/projects/data/team1_ComparativeGenomics/bin/bacterialGWAS/pangenomeGWAS
assembly_path=/projects/data/team1_ComparativeGenomics/bacterialGWAS/pangenome/test_assemblies
genomes_path=/projects/data/team1_ComparativeGenomics/bacterialGWAS/pangenome/genomes_test

mkdir $genomes_path
cp $assembly_path'/'*'.fasta' $genomes_path
for f in $genomes_path'/'*; do
    g=`echo $f | awk '{split($0,a,"/"); split(a[length(a)],b,"."); print substr(b[1],4,10) }'`
    cp $f "${genomes_path}/SR${g}.fasta"
    rm $f
done

echo "name	filePath" > contigs.txt
ls $genomes_path | awk '{split($0,a,"."); print a[1] "\t" "'${genomes_path}'/"$0}' >> contigs.txt

Rscript ${bacGWAS_path}/make_pangenome.R -contigFile contigs.txt -prodigal yes -similarity 0.7 -coverage 0.7 -externalSoftwarePaths soft.txt -prefix all

Rscript ${bacGWAS_path}/PAN_GWAS.R -pangenome all.pangenome.varGenes -phenotype pheno.txt -externalSoftwarePaths soft.txt -scriptDir ${bacGWAS_path}

