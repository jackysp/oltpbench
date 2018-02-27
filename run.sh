#!/bin/bash

if [ $# -ne 0 ]
then
	workload=$@
else
	workload=(auctionmark epinions jpab linkbench resourcestresser seats sibench smallbank tatp tpcc twitter wikipedia ycsb)
fi

server=(ti)
#server=(my ti)

for n in ${server[@]}
do
	for i in ${workload[@]}
	do
		echo "Running ${i} test in ${n}"
		./oltpbenchmark -b ${i} -c myconfig/${n}_${i}_config.xml --create=true --load=true --execute=true -s 5 -o ${i}
	done
done
