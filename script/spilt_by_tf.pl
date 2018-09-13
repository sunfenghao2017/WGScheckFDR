#~/bin/perl -w
use strict;
my($check,$total)=(shift,shift);
open T,">result_NC_true.xls";
open F,">result_NC_false.xls";
my %hash;
open O,$total;
while(my $line=<O>){
  chomp($line);
  my $sample=(split /\t/,$line)[0];
  $hash{$sample}=$line;
}
close O;
open C,$check;
while(<C>){
 chomp;
 my($samp,$bol)=split /\t/,$_;
 if($bol eq "true"){
   print T $hash{$samp},"\n";
 }elsif($bol eq "false"){
  print F $hash{$samp},"\n";

 }

}
close C;
close F;
close T;
