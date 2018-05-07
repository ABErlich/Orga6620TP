program: main.s generic_plot.s mips32_plot.s mygetopt_long.s
	gcc -o test2 main.s generic_plot.s mips32_plot.s mygetopt_long.s

main.s: main.c defs.h param.h debug.h
	gcc -Wall -O0 -S main.c

generic_plot.s: generic_plot.c defs.h param.h debug.h
	gcc -Wall -O0 -S generic_plot.c

mips32_plot.s: mips32_plot.c defs.h param.h debug.h
	gcc -Wall -O0 -S mips32_plot.c

mygetopt_long.s: mygetopt_long.c defs.h
	gcc -Wall -O0 -S mygetopt_long.c

clean:
	rm -f main.s generic_plot.s mips32_plot.s mygetopt_long.s test2
