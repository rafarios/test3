#!/bin/bash
RANDOM=$$

#add content to some files
for i in `seq 10` ; do
	a=$(($RANDOM%10))
	echo $a >> $a.txt
	text_add="${text_add} $a"
done

#delete some files
for i in `seq 3` ; do
	a=$(($RANDOM%10))
	rm $a.txt
	text_delete="${text_add} $a"
done

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "$dt"

git add .
git commit -m "Add ${text_add} - Delete ${text_delete} - $dt"
git push origin master
