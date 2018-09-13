#!~/bin/perl -w
use strict;
my $resultpath=shift;
my $listsite=shift;
######result######
my $MAPN="$resultpath/result_MAP_N.xls";
my $MAPQ="$resultpath/result_MAP_Q.xls";
my $SB="$resultpath/result_SB.xls";
my $SNVC="$resultpath/result_SNVCluster50.xls";
my $SNVCH="$resultpath/result_SNVCluster100.xls";
my $disend="$resultpath/result_distance_end.xls";
my $mutn="$resultpath/result_mut_num.xls";
my $mutq="$resultpath/result_mutant_basequality.xls";
my $pc="$resultpath/result_paired_check.xls";
my $STRs="$resultpath/result_str_stat.xls";
####read listsite#####
my(%hashdic);
open L,$listsite;
while(my $diclist=<L>){
 chomp($diclist);
 $hashdic{$diclist}{'name'}=$diclist;
}
close L;

open Z,$STRs;
while(my $strs=<Z>){
   chomp($strs);
   my($id,$lens,$reps)=split /\t/,$strs;
   if(exists $hashdic{$id}{'name'}){
      $hashdic{$id}{'STRlen'}=$lens;
      $hashdic{$id}{'STRrep'}=$reps;
   }
}
close Z;
open MPN,$MAPN;
while(my $mpn=<MPN>){
  chomp($mpn);
 my($id,$score,$var)=split /\t/,$mpn;
 if(exists $hashdic{$id}{'name'}){
    $hashdic{$id}{'MAPN_S'}=$score;
    $hashdic{$id}{'MAPN_V'}=$var;
  }
}
close MPN;
open MPQ,$MAPQ;
while(my $mpq=<MPQ>){
  chomp($mpq);
 my($id1,$score1,$var1)=split /\t/,$mpq;
 if(exists $hashdic{$id1}{'name'}){
    $hashdic{$id1}{'MAPQ_S'}=$score1;
    $hashdic{$id1}{'MAPQ_V'}=$var1;
  }
}
close MPQ;
open SB,$SB;
while(my $sb=<SB>){
  chomp($sb);
 my($id2,$score2,$var2,$fa,$fr)=split /\t/,$sb;
 if(exists $hashdic{$id2}{'name'}){
    $hashdic{$id2}{'SB_S'}=$score2;
    $hashdic{$id2}{'SB_C'}=$var2;
    $hashdic{$id2}{'SB_FA'}=$fa;
    $hashdic{$id2}{'SB_FR'}=$fr;
  }
}
close SB;

open SC,$SNVC;
while(my $snvc=<SC>){
  chomp($snvc);
 my($id3,$score3)=split /\t/,$snvc;
 if(exists $hashdic{$id3}{'name'}){
    $hashdic{$id3}{'SC_S'}=$score3;
  }
}
close SC;
open SCH,$SNVCH;
while(my $snvch=<SCH>){
  chomp($snvch);
 my($idh3,$scoreh3)=split /\t/,$snvch;
 if(exists $hashdic{$idh3}{'name'}){
    $hashdic{$idh3}{'SC_SH'}=$scoreh3;
  }
}
close SCH;

open DD,$disend;
while(my $dd=<DD>){
  chomp($dd);
 my($id4,$score4,$var4)=split /\t/,$dd;
 if(exists $hashdic{$id4}{'name'}){
    $hashdic{$id4}{'DISE_S'}=$score4;
    $hashdic{$id4}{'DISE_V'}=$var4;
  }
}
close DD;
open MN,$mutn;
while(my $mn=<MN>){
  chomp($mn);
 my($id5,$score5,$var5)=split /\t/,$mn;
 if(exists $hashdic{$id5}{'name'}){
    $hashdic{$id5}{'MN_S'}=$score5;
    $hashdic{$id5}{'MN_V'}=$var5;
  }
}
close MN;
open MQ,$mutq;
while(my $mq=<MQ>){
  chomp($mq);
 my($id6,$score6,$var6)=split /\t/,$mq;
 if(exists $hashdic{$id6}{'name'}){
    $hashdic{$id6}{'MTQ_S'}=$score6;
    $hashdic{$id6}{'MTQ_V'}=$var6;
  }
}
close MQ;
open PC,$pc;
while(my $mpc=<PC>){
  chomp($mpc);
 my($id7,$score7)=split /\t/,$mpc;
 if(exists $hashdic{$id7}{'name'}){
    $hashdic{$id7}{'PC_S'}=$score7;
  }
}
close PC;
open O,">merge_all.xls";
print O "ID\tpaired_check\tDisend_MID\tDisend_MAD\tMUTQ_MID\tMUTQ_MAD\tMAPQ_MID\tMAPQ_MAD\tMUTN_MID\tMUTN_MAD\tMAP_Diff\tSNVCluster50\tStrandBias\tConfidence\tFraction_Reverse\tFraction_Forword\tSTR_mer_len\tSTR_mer_rep\tSNVCluster100\n";
open D,$listsite;
while(my $od=<D>){
 chomp($od);
 my $mQ=$hashdic{$od}{'MAPQ_S'};
 my $nQ=$hashdic{$od}{'MAPN_S'};
 my $mapd;
 if($mQ>$nQ){
   $mapd=$mQ-$nQ;
 }else{
   $mapd=$nQ-$mQ;
 }
if((exists $hashdic{$od}{'PC_S'}) and (exists $hashdic{$od}{'DISE_S'}) and (exists $hashdic{$od}{'DISE_V'}) and (exists $hashdic{$od}{'MTQ_S'}) and (exists $hashdic{$od}{'MTQ_V'}) and (exists $hashdic{$od}{'MAPQ_S'}) and (exists $hashdic{$od}{'MAPQ_V'}) and (exists $hashdic{$od}{'MN_S'}) and (exists $hashdic{$od}{'MN_V'}) and (exists $hashdic{$od}{'SC_S'}) and (exists $hashdic{$od}{'SB_S'}) and (exists $hashdic{$od}{'SB_C'}) and (exists $hashdic{$od}{'SB_FA'}) and (exists $hashdic{$od}{'SB_FR'}) and (exists $hashdic{$od}{'STRlen'}) and (exists $hashdic{$od}{'STRrep'}) and ($hashdic{$od}{'SB_S'} !~ /nan/)){
 print O "$od\t$hashdic{$od}{'PC_S'}\t$hashdic{$od}{'DISE_S'}\t$hashdic{$od}{'DISE_V'}\t$hashdic{$od}{'MTQ_S'}\t$hashdic{$od}{'MTQ_V'}\t$hashdic{$od}{'MAPQ_S'}\t$hashdic{$od}{'MAPQ_V'}\t$hashdic{$od}{'MN_S'}\t$hashdic{$od}{'MN_V'}\t$mapd\t$hashdic{$od}{'SC_S'}\t$hashdic{$od}{'SB_S'}\t$hashdic{$od}{'SB_C'}\t$hashdic{$od}{'SB_FA'}\t$hashdic{$od}{'SB_FR'}\t$hashdic{$od}{'STRlen'}\t$hashdic{$od}{'STRrep'}\t$hashdic{$od}{'SC_SH'}\n";
}
}
close D;
close O;



