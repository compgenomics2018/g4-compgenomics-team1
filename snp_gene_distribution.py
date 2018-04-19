gff = open('GCF_000775395.1_ASM77539v1_genomic.gff','r')
startPos = {}
endPos = {}
for line in gff:
    if line[0]!="#":
        chrom = line.split()[0]
        if line.split()[3]=='CDS':
            start = line.split()[4]
            end = line.split()[5]
        else:
            start = line.split()[3]
            end = line.split()[4]
        if chrom in startPos:
            startPos[chrom].append(int(start))
            endPos[chrom].append(int(end))
        else:
            startPos[chrom] = [int(start)]
            endPos[chrom] = [int(end)]
            
import numpy as np
vcf = open('heteroresistance_sub_4_0411.'+sample+'_sorted.bam.vcf','r') 
varPos = {}
for line in vcf:
    if line[0]!="#":
        chrom = line.split()[0]
        position = line.split()[1]
        if chrom in varPos:
            varPos[chrom].append(int(position))
        else:
            varPos[chrom] = [int(position)]
vcf.close()

import matplotlib.pyplot as plt
ranges = np.unique(startPos['NZ_CP009775.1'])
#h,xe = np.histogram(varPos['NZ_CP009775.1'],bins=ranges)
plt.hist(varPos['NZ_CP009775.1'],bins=ranges)
plt.title(sample+' chromosome')
plt.savefig('sample+'_snp_gene_dist.png')
