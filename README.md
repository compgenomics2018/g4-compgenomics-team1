# g2-compgenomics-team1

Add to your PATH:
Roary
Scoary
Prokka
SignalP
Rnammer
...

## filter_gwas.pl usage
This script is used to filter the Bacterialgwas with any P value and OR value that is disired.

`perl filter_gwas.pl bacterialgawsoutput`

## run_prokka.sh usage
this script is to run prokka on multiple files automatically, an input of the list of the files you want to run is required.

`bash run_prokka.sh filnamelist.txt`

##wrapper script run_bacterialGWAS_pangenome.sh
require bacterialGWAS: https://github.com/jessiewu/bacterialGWAS

##wrapper script run_kSNP.sh
require kSNP3 installation with all dependencies: https://sourceforge.net/projects/ksnp/files/

## plot_input.pl usage
this script is to help generate input file from Roary present_absent matrix to plot a Manhattan plot using R\

`perl plot_input.pl roary_matrix`

## man_plot.R usage
generate Manhattan plot using the file generated by plot_input.pl

`Rscript man_plot.R plot_input.txt`

## prepare_trait.sh usage
this file contains the command used in samtool SNP calling
`bash prepare_scoary_trait.sh phenotype.csv roary.output`
