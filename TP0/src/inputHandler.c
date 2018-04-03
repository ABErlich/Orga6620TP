#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Headers/inputHandler.h"
#include "Headers/exportHandler.h"

void GetParameterValues(int argc, char **argv, int *rowCount, int *colCount, double *width, double *height, Complex *center, Complex *seed, char *name){

    // Valores por defecto;
    *rowCount = 480;
    *colCount = 640;
    *width = 2;
    *height = 2;
    center->real = 0;
    center->img = 0;
    seed->real = -0.726895347709114071439;
    seed->img = 0.188887129043845954792;

	int ch;
	int index = 0;

	struct option options[] = {
		{"resolution", required_argument, NULL, 'r'},
		{"center", required_argument, NULL, 'c'},
		{"seed", required_argument, NULL, 's'},
		{"width", required_argument, NULL, 'w'},
		{"Height", required_argument, NULL, 'H'},
		{"output", required_argument, NULL, 'o'},
		{NULL, 0, NULL, 0}
	};

	while ((ch = getopt_long(argc, argv,
			         "s:c:H:o:r:w:", options, &index)) != -1) {
		switch (ch) {
		case 'r':
			GetResolution(optarg, rowCount, colCount);
			break;
		case 'c':
			GetCenter(optarg, center);
			break;
		case 's':
			GetSeed(optarg, seed);
			break;
		case 'w':
			GetWidth(optarg, width);
			break;
		case 'H':
			GetHeight(optarg, height);
			break;
		case 'o':
			GetOutput(optarg, name, SIZE_BUFF_NAME);
			break;
		}
	}

}

void GetResolution(const char *spec, int *rowCount, int *colCount){
	int cols;
	int rows;
	char c;
	char d;

	if (sscanf(spec, "%d%c%d %c", &cols, &c, &rows, &d) != 3
	    || cols <= 0
	    || c != 'x'
	    || rows <= 0){
		printf("The resolution specification is invalid\n");
		exit(1);
	}
	*rowCount = rows;
	*colCount = cols;
}

void GetCenter(const char *spec, Complex *center){
	double real, img;
	char imgNumber;
	char sign;
	char ch;

	if (sscanf(spec,
	           "%lf %c %lf %c %c",
	           &real,
	           &sign,
	           &img,
	           &imgNumber,
	           &ch) != 4
	    || !PLUS_OR_MINUS(sign)
	    || !IMAGINARY_UNIT(imgNumber)) {
		fprintf(stderr, "The center specification is invalid.\n");
		exit(1);
	}

	img *= SIGN(sign);
	center->real = real;
	center->img = img;
}

void GetWidth(const char *spec, double *width) {
	char ch;

	if (sscanf(spec,
	           "%lf %c",
	           width,
	           &ch) != 1
	    || *width <= 0.0) {
		fprintf(stderr, "The width specification is invalid.\n");
		exit(1);
	}
}

void GetHeight(const char *spec, double *height){

	char ch;

	if (sscanf(spec,
	           "%lf %c",
	           height,
	           &ch) != 1
	    || *height <= 0.0) {
		fprintf(stderr, "The height specification is invalid.\n");
		exit(1);	
	}
}



void GetOutput(const char *spec, char *name, size_t n){
	strncpy(name, spec, n);
}

void GetSeed(const char *spec, Complex *seed) {
	double real, img;
	char imgNumber;
	char sg;
	char ch;

	sscanf(spec,
	           "%lf %c %lf %c %c",
	           &real,
	           &sg,
	           &img,
	           &imgNumber,
	           &ch);
	if (sscanf(spec,
	           "%lf %c %lf %c %c",
	           &real,
	           &sg,
	           &img,
	           &imgNumber,
	           &ch) != 4
	    || !PLUS_OR_MINUS(sg)
	    || !IMAGINARY_UNIT(imgNumber)) {
		fprintf(stderr, "The seed specification is invalid.\n");
		exit(1);
	}

	img *= SIGN(sg);

	seed->real = real;
	seed->img = img;
}
