#!/bin/bash
myfdrstr=`pwd`
g++ -I/home/sunhao/include -L/disk/sun/C_DB/boost_1_67_0/boost -lpthread  -Wno-deprecated -Wcpp -o fdrman $myfdrstr/c_file/main.cpp $myfdrstr/c_file/strandbias.cpp $myfdrstr/c_file/extractsam.cpp $myfdrstr/c_file/bigfileIO.cpp $myfdrstr/c_file/SNVCluster.cpp $myfdrstr/c_file/QualControl.cpp $myfdrstr/c_file/merge_filter.cpp $myfdrstr/c_file/STR.cpp $myfdrstr/c_file/singlesite_ratiocheck.cpp $myfdrstr/c_file/gein.cpp
echo "please ADD "$myfdrstr "to your FDRPATH!"
export FDRPATH=$myfdrstr
ln -s $myfdrstr/fdrman ~/bin/fdrman
