# !bin/bash

for worker in 1 2 4 8 12
do
  for nbits in 20 24 28
  do
    echo "Make the run workers = $worker and bits = $nbits"
    make workers=$worker bits=$nbits>> experiment_$worker-$nbits.txt 2>&1 
    status=$?

    [ $status -eq 0 ] && echo "OK" || echo "ERROR"
  done
done
