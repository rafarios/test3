#!/bin/bash

git checkout version3

RANDOM=$$

#add content to some files
for i in `seq 100` ; do
	a=$(($RANDOM%20))
	echo $a >> $a.txt
	if [ -z ${text_add} ] ; then
		text_add="$a"
	else
		text_add="${text_add},$a"
	fi
done

git add .
git commit -m "Adding more stuff"
git push origin version3
