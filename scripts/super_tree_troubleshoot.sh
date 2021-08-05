#! /usr/bin/env bash

curr=167
last_day=190

while [ $curr -lt $last_day ]
do
database="postgres"
super="/home/yongjun/jds_june/dataset/super_tree/day_$((curr+1))_super"
psql -d $database -c "COPY super_tree FROM '$super' DELIMITER ' ';"

curr=$((curr+1))
done

