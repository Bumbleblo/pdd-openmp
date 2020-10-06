
workers=1
bits=16

all: compile run clean

compile: 
	@gcc -o prog.out -I. -D NUM_WORKERS=$(workers) -D MODULO_NUM_BITS=$(bits) -fopenmp vow_with_hash.c

compile-profile:
	@gcc -o prog.out -pg -I. -D NUM_WORKERS=$(workers) -D MODULO_NUM_BITS=$(bits) -fopenmp vow_with_hash.c

view-profile:
	@gprof prog.out gmon.out

run:
	@./prog.out 

clean:
	@rm prog.out
