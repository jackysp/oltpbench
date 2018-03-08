#!/bin/bash

if [ $# -ne 0 ]
then
	workload=$@
else
	workload=(auctionmark chbenchmark epinions resourcestresser seats sibench smallbank tatp tpcc twitter voter wikipedia ycsb)
	#workload=(auctionmark chbenchmark epinions jpab linkbench resourcestresser seats sibench smallbank tatp tpcc twitter voter wikipedia ycsb)
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
