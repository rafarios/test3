#!/bin/bash
RANDOM=$$

if [ -z ${b} ] ; then 
	echo "b is unset"
else 
	echo "b is set" 
fi

#add content to some files
for i in `seq 8` ; do
	a=$(($RANDOM%20))
	echo $a >> $a.txt
	if [ -z ${text_add} ]; then
		text_add="$a"
	else
		text_add="${text_add} $a"
	fi
done

#delete some files
for i in `seq 4` ; do
	a=$(($RANDOM%20))
	rm $a.txt
	if [ -z ${text_delete} ]; then
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
