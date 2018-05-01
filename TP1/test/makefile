program: main.s 
	gcc -o testpgm1 main.s ../src/mips32_header.S ../src/mips32_to_str.S ../src/mips32_write.S ../src/mips32_numbers.S ../src/mips32_length.S ../src/mips32_save.S ../src/mips32_fflush.S ../src/mips32_fprintf.S

main.s: main.c ../src/mips32_helper.h ../src/mips32_stdio.h
	gcc -Wall -O0 -S main.c

clean:
	rm -f main.s testpgm1
