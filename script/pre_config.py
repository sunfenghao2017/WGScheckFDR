#!/biocluster/data/biobk/user_test/sunhao/Python/Python-2.7.13/python
import os;
import sys;
import numpy;
import re;
my_file=sys.argv[1]
bamdir=sys.argv[2]
fobj=open(my_file,'r')
try:
  while True:
    ##now defult header always have a remarkable label '#'
    line=fobj.readline()
    p=re.compile(r'#')
    myconf=p.findall(line)
    lenhead=len(myconf)
    if lenhead==1:
       headline=line.upper();
       aheads=headline.split('\t')
       alens=len(aheads)-1
       for newln in aheads:
        samplepos=re.match('SAMPLE',newln);
        chrpos=re.match('CHR',newln);
        beginpos1=re.match('START',newln);
        beginpos2=re.match('BEGIN',newln);
        refpos=re.match('\tREF\t',newln);
        altpos=re.match('\tALT\t',newln);
        
    else
       break
finally:
  fobj.close()
##bam directory check##
