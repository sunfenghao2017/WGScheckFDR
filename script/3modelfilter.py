#!/biocluster/data/biobk/user_test/sunhao/Python/Python-2.7.13/python
import os;
import sys;
import numpy;
import re;
from itertools import islice
my_file=sys.argv[1]
my_ratio=sys.argv[2]
my_para_ratio=sys.argv[3]
mydic={}
mydic.clear()
for line in open(my_ratio):
 newline=line.rstrip('\n')
 mydic[newline]=1
inputfile=open(my_file)
for records in islice(inputfile,1,None):
 records.rstrip('\n')
 records1=str(records).replace('\"','') 
 arr=records.split('\t')
 print("%d\t%d\t%d",int(arr[1]),float(arr[2]),int(arr[3]))
 if int(arr[1])==1 and float(arr[2])>=float(my_para_ratio) and int(arr[3])==1 and (arr[0] in mydic.key()):
   print(arr[0])
inputfile.close()
