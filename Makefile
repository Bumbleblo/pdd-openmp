
workers=1
bits=16

all: compile run clean

compile: 
	OMP_NUM_THREADS=$(workers)

	echo $(OMP_NUM_THREADS)

	@gcc -o prog.out -I. -D NUM_WORKERS=$(workers) -D MODULO_NUM_BITS=$(bits) -fopenmp vow_with_hash.c

run:
	@./prog.out 

clean:
	@rm prog.out
