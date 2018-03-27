CC=gcc
CFLAGS= -Wall -pedantic
DEPS= bool.h complex.h exportHandler.h fractalFunctions.h inputHandler.h mapper.h matrixHandler.h succession.h
OBJ = main.o ./src/complex.o ./src/exportHandler.o ./src/fractalFunctions.o ./src/inputHandler.o ./src/mapper.o ./src/matrixHandler.o ./src/succession.o 
ODIR=./obj

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

tp0: $(OBJ)
	$(CC) $^ -o $@ $(CFLAGS)

.PHONY: clean

clean:
	rm -f ./*.o ./src/*.o

