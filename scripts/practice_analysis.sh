#! /usr/bin/env bash

# Send-a-tree week 1 Friday Task 2 Get to know the data
# Date: 06.25.21
# Description: This script executes simple analysis on the Send-a-tree data on bash.

string="/home/yongjun/jds_june/dataset/registration/"
var=$(ls -v $string)

echo "1. user growth from all countries 2. view individual country"
read usrinput

if [ $usrinput -eq 1 ]
then
	for i in $var;
	do
		filename="$string$i"
		echo $i
		cut -d' ' -f8 $filename|sort|uniq -c
		echo ''
	done
elif [ $usrinput -eq 2 ]
then
	echo "select country"
	lastDay=$(ls -v $string|tail -1)
	cut -d' ' -f8 "$string$lastDay"|sort|uniq
	read country
	echo $country selected
	echo ''

	for i in $var;
	do
		filename="$string$i"
		grep $country $filename|wc -l
	done
fi


:<<'END'
Registration Foler
cat * | cut -f1 -d' ' | sort -V | uniq -c
cat * | cut -f2 -d' ' | sort -V | uniq -c
cat * | wc -l
cat * | cut -f6 -d' ' | sort | uniq -c
cat * | cut -f7 -d' ' | sort | uniq -c
cat * | cut -f8 -d' ' | sort | uniq -c
cat * | cut -f9 -d' ' | sort | uniq -c

Free Tree
cat * | cut -f1 -d' ' | sort -V | uniq -c

Super Tree
cat * | cut -f1 -d' ' | sort -V | uniq -c
cat * | cut -f3 -d' ' | sort | uniq -c
