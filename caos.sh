#!/bin/bash
RANDOM=$$

#add content to some files
for i in `seq 12` ; do
	a=$(($RANDOM%20))
	echo $a >> $a.txt
	if [ -z ${text_add} ] ; then
		text_add="$a"
	else
		text_add="${text_add},$a"
	fi
done

#delete some files
for i in `seq 2` ; do
	a=$(($RANDOM%20))
	rm $a.txt
	if [ -z ${text_delete} ] ; then
		text_delete="$a"
	else
		text_delete="${text_delete},$a"
	fi
done

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"

git add .
git commit -m "Add ${text_add} - Delete ${text_delete} - $dt"
git push origin master
