#!/usr/bin/perl 
use strict;
use warnings;

my $file = $ARGV[0];
my $pheno = $ARGV[1];
my @name;
my @name_size;
my @raw;
my @genome;
my $type=0;

#Open file
unless (open(FILE, $file)){
	print "Can't open file \"$file\"\n\n";
	exit;
}

unless (open(PHENO, $pheno)){
	print "Can't open file \"$pheno\"\n\n";
	exit;
}

#Creat outfile
my $outfile = "extracted_$ARGV[0]";
	unless(open OUT, '>' .$outfile){
		    die "\nUnable to create $outfile\n";
	}

my @line = <FILE>;
my @SRR = <PHENO>;

foreach my $cluster (@line){
	if ($cluster =~ /^>/){  
			print OUT "\#$cluster";
		}
		else{
			##extract genome SRR number
			@genome = split (/\s/,$cluster);
			@raw = split (/\./,$genome[2]);
			@name_size = split (/\>/,$raw[0]);
			@name = split (/\_/,$name_size[1]);
			foreach my $ph (@SRR){
				my @trait = split (/\s/,$ph);
				if ("$name[0]" eq "$trait[0]"){
					if ($trait[1] == 1){
						$type = "heteroresistant";
						last;
					}
					if ($trait[2] == 1){
						$type = "resistant";
						last;
					}
					if ($trait[2] == 1){
						$type = "succeptible";
						last;
					}
					last;
				}
			}
			print OUT "$raw[0]\t\t$type\n";
		}
		print OUT "\n";
}