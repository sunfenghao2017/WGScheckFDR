#!~/bin/perl -w
use strict;
my $mergefile=shift;
my $standline=shift;
my %hash;
open F,$standline;
while(<F>){
 chomp;
 $hash{$_}=1;
}
close F;
open R,$mergefile;
my $colnum=0;
open O,">merge_total_ratio.xls";
while(<R>){
  chomp;
  if($colnum==0){
   print O "$_\tRatioCheck\n";
  }else{
  my @lessens=split /\t/,$_;
  if(exists $hash{$lessens[0]}){
  print O "$_\t1\n";
  }else{
  print "0\n";
  print O "$_\t0\n";
  }
 }
   $colnum++;
}
close R;
close O;
