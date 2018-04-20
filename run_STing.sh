#create Library

/projects/data/team1_ComparativeGenomics/test_sting/sting/indexer \
-p /projects/data/team1_ComparativeGenomics/test_sting/sting_indexer_plas_out/sting_indexer_plas_out_test \
-m GDETECT -c /projects/data/team1_ComparativeGenomics/test_sting/Kpneu_plas_pangenome_STing_config_file7

run STing gene detection
for f in $(cat /projects/data/team1_ComparativeGenomics/Reads/IDs1.txt)
do
/projects/data/team1_ComparativeGenomics/test_sting/sting/detector -x /projects/data/team1_ComparativeGenomics/test_sting/sting_indexer_out/ \
-1 /projects/data/team1_ComparativeGenomics/Reads/upload/${f}_1.paired.fastq.gz \
-2 /projects/data/team1_ComparativeGenomics/Reads/upload/${f}_2.paired.fastq.gz \
-k 19 -g -d -t .5 > /projects/data/team1_ComparativeGenomics/test_sting/sting_detect_out/${f}.txt
done

for f in $(cat /projects/data/team1_ComparativeGenomics/Reads/IDs2.txt)
do
/projects/data/team1_ComparativeGenomics/test_sting/sting/detector -x /projects/data/team1_ComparativeGenomics/test_sting/sting_indexer_out/ \
-1 /projects/data/team1_ComparativeGenomics/Reads/upload/unzipped/${f}-1.paired.fastq \
-2 /projects/data/team1_ComparativeGenomics/Reads/upload/unzipped/${f}-2.paired.fastq \
-k 19 -g -d -t .5 > /projects/data/team1_ComparativeGenomics/test_sting/sting_detect_out/${f}.txt
done

for f in $(cat /projects/data/team1_ComparativeGenomics/Reads/Klebsiella/Klebsiella.txt)
do
/projects/data/team1_ComparativeGenomics/test_sting/sting/detector -x /projects/data/team1_ComparativeGenomics/test_sting/sting_indexer_out/ \
-1 /projects/data/team1_ComparativeGenomics/Reads/Klebsiella/${f}/Reads/reads/trimmed/read1.paired.fastq \
-2 /projects/data/team1_ComparativeGenomics/Reads/Klebsiella/${f}/Reads/reads/trimmed/read2.paired.fastq \
-k 19 -g -d -t .5 > /projects/data/team1_ComparativeGenomics/test_sting/sting_detect_out/${f}.txt
done
