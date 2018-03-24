CC=gcc
CFLAGS= -Wall -pedantic
DEPS= complex.h exportHandler.h matrixHandler.h succession.h inputHandler.h
OBJ = main.o complex.o exportHandler.o matrixHandler.o succession.o inputHandler.o
ODIR=./obj

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

fractalGenerator: $(OBJ)
	$(CC) $^ -o $@ $(CFLAGS)

.PHONY: clean

clean:
	rm -f *.o 

