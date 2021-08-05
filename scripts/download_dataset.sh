#!/usr/bin/env bash

# Send-a-tree week 1 task 1
# Date: 06.21.21
# Description: Download 159 send-a-tree logs from server.

i=0
while [ $i -lt 159 ]
do 
wget -P /home/yongjun/jds_june/dataset/unsorted 46.101.230.157/jds_june_2021/day_$((i+1))
i=$((i+1))
done

#Tomi's answer
#start=1
#end=200
#while [ $start != $end ]
#do
#filename=day_$start
#wget 46.101.230.157/jds_june_2021/$filename
#start=$((start + 1))
#done

#He created a file name variable
#He created a variable for end of the loop
