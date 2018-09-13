#!~/bin/perl -w
use strict;
my($file,$ratio,$model,$parar)=(shift,shift,shift,shift);
if($model=~/model|NC|COMP/){
my %hash;
open F,$ratio;
while(my $rline=<F>){
  chomp($rline);
 if($model ne "COMP"){
  $hash{$rline}=1;
  }else{
  my($sam,$tf)=split /\t/,$rline;
  $hash{$sam}=$tf;
  }
}
close F;
open R,$file;
while(my $aline=<R>){
  chomp($aline);
  if($model eq "model"){
  $aline=~s/\"//g;
  next if $aline !~/\d/;
  my @names=split /\t/,$aline;
  if(($names[1]==1) and ($names[2]>=$parar) and ($names[3]==1) and (exists $hash{$names[0]})){
      print "$names[0]\ttrue\n";
      }else{
      print "$names[0]\tfalse\n";
      }
  }elsif($model eq "NC"){
     my($samp,$bol)=split /\t/,$aline;
     if(($bol eq "true") and (exists $hash{$samp})){
       print "$samp\ttrue\n";
       }else{
       print "$samp\tfalse\n";
       }
  }elsif($model eq "COMP"){
    my($samp,$bol)=split /\t/,$aline;
    if((exists $hash{$samp}) and ($hash{$samp} ne $bol)){
      print "$samp\t$hash{$samp}\t$bol\n";
    }
  }
}
close R;
}else{
print "PATTERN:\n\tmodel:\tfix three model\n\tNC:\tnature paper\n\tCOMP:\t compare two result\nperl $0 inputfile filerfile model filterratio\n";
}
