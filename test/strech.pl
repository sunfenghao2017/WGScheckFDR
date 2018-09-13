#!~/bin/perl -w
use strict;
my $input="result.xls";
my $total="merge_all.xls";
open F,$input;
my %hash;
while(my $line=<F>){
  chomp($line);
  my $id=(split /\t/,$line)[0];
  $hash{$id}=1;
}
close F;
open R,$total;
while(my $tln=<R>){
   chomp($tln);
   my $ID=(split /\t/,$tln)[0];
   if(exists $hash{$ID}){
     print $tln,"\n";
   }
}
close R;
