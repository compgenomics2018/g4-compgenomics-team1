#!/usr/bin/perl 
use strict;
use warnings;

my $file = $ARGV[0];

#Open file
	unless (open(FILE, $file)){
		print "Can't open file \"$file\"\n\n";
		exit;
	}

#Creat outfile
my $outfile = "renamed_$ARGV[0]";
	unless(open OUT, '>' .$outfile){
		    die "\nUnable to create $outfile\n";
	}

my @line = <FILE>;
	foreach my $fn (@line){
		if ($fn =~ /^>/){  
		my @header = split (/\|/,$fn);
		print OUT "$header[0]\n";
		}
		else{
			print OUT "$fn";
		}
	} 