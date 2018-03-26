CC=gcc
CFLAGS= -Wall -pedantic
DEPS= ./src/file.h complex.h exportHandler.h matrixHandler.h succession.h inputHandler.h
OBJ = main.o ./src/file.o ./src/complex.o ./src/exportHandler.o ./src/matrixHandler.o ./src/succession.o ./src/inputHandler.o
ODIR=./obj

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

tp0: $(OBJ)
	$(CC) $^ -o $@ $(CFLAGS)

.PHONY: clean

clean:
	rm -f ./*.o ./src/*.o

