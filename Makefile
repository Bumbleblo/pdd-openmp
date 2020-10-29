
workers=1
bits=16

all: compile run clean

CC=mpicc
RUN=mpirun
HOSTS=cm2,cm3,cm4

#mpicc -D MODULO_NUM_BITS=16 -D NUM_WORKERS=2 vow_with_hash.c -I. -o prog.out && time mpirun --map-by ppr:1:node --hosts cm3,cm4 ./prog.out > out 


compile: 
	
	@$(CC) -o prog.out -I. -D NUM_WORKERS=$(workers) -D MODULO_NUM_BITS=$(bits) vow_with_hash.c

run:
	@mpirun --map-by ppr:$(workers):node --hosts=$(HOSTS) ./prog.out 

clean:
	@rm prog.out
