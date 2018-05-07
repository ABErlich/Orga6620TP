program: main.s generic_plot.s mygetopt_long.s 
	gcc -o test2 main.s generic_plot.s mips32_plot.S mygetopt_long.s mips32_header.S mips32_write.S mips32_to_str.S mips32_length.S mips32_numbers.S mips32_fprintf.S mips32_fflush.S mips32_save.S

main.s: main.c defs.h param.h debug.h
	gcc -Wall -O0 -S main.c

generic_plot.s: generic_plot.c defs.h param.h debug.h mips32_stdio.h
	gcc -Wall -O0 -S generic_plot.c

mygetopt_long.s: mygetopt_long.c defs.h
	gcc -Wall -O0 -S mygetopt_long.c

clean:
	rm -f main.s generic_plot.s mips32_plot.s mygetopt_long.s test2
