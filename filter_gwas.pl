#!/usr/bin/perl -w
use strict;
use Getopt::Long;

my $gwas_result;
my $pvalue;
my $orvalue;
my $help=0;

sub usage{
  print "\nUsage:\n";
  print "./gff_to_fasta.pl -i [name of gff file] -p [prodigal fasta file] -g [genemark fasta file] -o [output file name]\n";
}

GetOptions(
    'i=s' => \$gwas_result,
	'p=s' => \$pvalue,
    'o=s' => \$orvalue,
    'h'   => \$help,
  ) or die "Incorrect usage!\n";

  if ($help ne 0) { usage(); exit 1;}
  unless (defined $gwas_result && defined $pvalue && defined $orvalue){
    print "You need specified all parameter!\n"; usage(); exit 1;
  }

#Open file
	unless (open(FILE, $gwas_result)){
		print "Can't open file \"$gwas_result\"\n\n";
		exit;
	}

#Creat outfile
my $outfile = "filtered_$gwas_result(p=$pvalue, OR=$orvalue)";
	unless(open OUT, '>' .$outfile){
		    die "\nUnable to create $outfile\n";
	}

my @line = <FILE>;
my $column_name = shift @line;
print OUT "$column_name\n";

foreach my $fn (@line){
	if ($fn =~ /^>/){  
	my @header = split (/\s/,$fn);
		if ($header[5] <= $pvalue && $header[6] >= $orvalue){
			print OUT "@header\n";
		}
	}
}