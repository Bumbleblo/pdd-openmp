# !bin/bash

for worker in 1 2 4 8 12
do
  for nbits in 16 20 24 28
  do
    echo "Compiling with workers = $worker and bits = $nbits"
    make compile workers=$worker bits=$nbits

    echo "Make the run workers = $worker and bits = $nbits"
    make run > example_$worker-$nbits.txt
  done
done
