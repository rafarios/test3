#!/bin/bash
RANDOM=$$

#add content to some files
for i in `seq 10` ; do
	a=$(($RANDOM%10))
	echo $a >> $a.txt
done

#delete some files
for i in `seq 3` ; do
	a=$(($RANDOM%10))
	rm $a.txt
done

git add .
git commit -m '$a'
