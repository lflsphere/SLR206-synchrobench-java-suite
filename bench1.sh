#!/bin/bash

case $1 in
	"1" )	echo CoarseGrainedListIntSet
			OUTPUT="CoarseGrainedListIntSet"
	;;
	"2" )	echo HandOverHandListIntSet
			OUTPUT="HandOverHandListIntSet"
	;;
	"3" )	echo LazyLinkedListSortedSet
			OUTPUT="LazyLinkedListSortedSet"
	;;
	*)		echo "Specify algorithm"
			exit 0
esac

echo "Who I am: $OUTPUT on `uname -n`"
echo "started on" `date`


for j in 10 1000 10000
do
	for i in `seq 1 12`
	do
		res = java -cp bin contention.benchmark.Test -b linkedlists.lockbased.$OUTPUT -d 2000 -t $i -u 10 -i $j -r 2048 -W 0 | grep ^[0-9]{6}(\.[0-9]*)
		echo $i $res >> fic.data
			

		
	done
	echo " \n \n" >> fic.data
	
done
echo "finished on" `date`
echo "DONE \o/"

