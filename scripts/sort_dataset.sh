#!/usr/bin/env bash

# Send-a-tree week 1 task 2
# Date: 06.23.21
# Description: Sort the downloaded data to its appropriate folders according to their log type

i=0
while [ $i -lt 160 ]
do 
grep registration /home/yongjun/jds_june/dataset/unsorted/day_$((i+1)) >> /home/yongjun/jds_june/dataset/registration/day_$((i+1))_reg
grep free /home/yongjun/jds_june/dataset/unsorted/day_$((i+1)) >> /home/yongjun/jds_june/dataset/free_tree/day_$((i+1))_free
grep super /home/yongjun/jds_june/dataset/unsorted/day_$((i+1)) >> /home/yongjun/jds_june/dataset/super_tree/day_$((i+1))_super
i=$((i+1))
done
