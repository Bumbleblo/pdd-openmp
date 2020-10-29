# !bin/bash

for worker in 1 2 4
do
  for nbits in 16 20
  do
    echo "Make the run workers = $worker and bits = $nbits"
    make workers=$worker bits=$nbits>> experiment_$worker-$nbits.txt 2>&1 
  done
done
