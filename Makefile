
workers=1
bits=16

all: compile run clean

CC=mpicc
PROF=gprof

compile: 
	
	@$(CC) -o prog.out -I. -D NUM_WORKERS=$(workers) -D MODULO_NUM_BITS=$(bits) -fopenmp vow_with_hash.c

compile-profile:
	
	@$(CC) -o prog.out -pg -I. -D NUM_WORKERS=$(workers) -D MODULO_NUM_BITS=$(bits) -fopenmp vow_with_hash.c

view-profile:
	@
	$(PROF) prog.out gmon.out

run:
	@mpirun prog.out 

clean:
	@rm prog.out
