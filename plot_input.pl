#!/usr/bin/perl 
use strict;
use warnings;

my $file = $ARGV[0];
my $i=0;
my @gene;
my @chr;
my @num;
my @pvalue;

#Open file
	unless (open(FILE, $file)){
		print "Can't open file \"$file\"\n\n";
		exit;
	}

#Creat outfile
my $outfile = "plot_input.txt";
	unless(open OUT, '>' .$outfile){
		    die "\nUnable to create $outfile\n";
	}

my @line = <FILE>;
	foreach my $fn (@line){  
		my @row = split (/,/,$fn);
		if ($i==0){
			print OUT "SNP\tCHR\tBP\tP\n";
		}
		else{
			print OUT "$row[0]\t1\t$i\t$row[10]\n";
		}
		$i++;
	}

system `sed -i -e 's/\"//g' plot_input.txt`;
