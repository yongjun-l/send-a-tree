#! /usr/bin/env python3

# Send-a-tree week 2 Friday task 2
# Date: 07.04.21
# Description: gets all possble combinations of the user attributes so that we can use it to cross referene our dataset. 

from itertools import combinations
segments = ['source', 'phone_type', 'birth_year', 'location']

allCombi=[]
for i in range(len(segments)):
	combi = combinations(segments,i+1)
	for i in combi:
		allCombi.append(list(i))

print(allCombi)


