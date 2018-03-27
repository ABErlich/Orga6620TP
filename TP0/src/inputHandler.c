#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Headers/inputHandler.h"

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
	//};

	while ((ch = getopt_long(argc, argv,
			         "s:c:H:o:r:w", options, &index)) != -1) {
		switch (ch) {
		case 'r':
			GetResolution(argv[0], optarg, rowCount, colCount);
			break;
		case 'c':
			GetCenter(argv[0], optarg, center);
			break;
		case 's':
			GetSeed(argv[0], optarg, seed);
			break;
		case 'w':
			GetWidth(argv[0], optarg, width);
			break;
		case 'H':
			GetHeight(argv[0], optarg, height);
			break;
		case 'o':
			GetOutput(argv[0], optarg, name);
			break;
		}
	}

	if (!*name) {
		fprintf(stderr, "no output file.\n");
		exit(1);
	}

}

static void GetResolution(const char *name, const char *spec, int *rowCount, int *colCount)
{
	int x;
	int y;
	char c;
	char d;

	if (sscanf(spec, "%d%c%d %c", &x, &c, &y, &d) != 3
	    || x <= 0
	    || c != 'x'
	    || y <= 0)
		printf("error resolution \n");

	*rowCount = x;
	*colCount = y;
}
static void GetCenter(const char *name, const char *spec, Complex *center)
{
	/*double width;*/
	/*double height;*/
	double re, im;
	char ii;
	char sg;
	char ch;

	if (sscanf(spec,
	           "%lf %c %lf %c %c",
	           &re,
	           &sg,
	           &im,
	           &ii,
	           &ch) != 4
	    || !PLUS_OR_MINUS(sg)
	    || !IMAGINARY_UNIT(ii)) {
		fprintf(stderr, "invalid center specification.\n");
		exit(1);
	}

	im *= SIGN(sg);
	center->real = re;
	center->img = im;
}
static void GetHeight(const char *name, const char *spec, double *height)
{

	char ch;

	if (sscanf(spec,
	           "%lf %c",
	           height,
	           &ch) != 1
	    || *height <= 0.0) {
		fprintf(stderr, "invalid height specification.\n");
		exit(1);
	}
}

static void GetWidth(const char *name, const char *spec, double *width)
{
	char ch;

	if (sscanf(spec,
	           "%lf %c",
	           width,
	           &ch) != 1
	    || *width <= 0.0) {
		fprintf(stderr, "invalid width specification.\n");
		exit(1);
	}
}

static void GetOutput(const char *output, const char *spec, char *name)
{
	if (output != NULL) {
		fprintf(stderr, "multiple do output files.");
		exit(1);
	}

	if (strcmp(spec, "-") == 0) {
		output = (const char *)stdout;
	}
	/* else {
		if (!(output = fopen(spec, "w"))) {
			fprintf(stderr, "cannot open output file.\n");
			exit(1);
		}
	}*/
}

static void GetSeed(const char *name, const char *spec, Complex *seed)
{
	double re, im;
	char ii;
	char sg;
	char ch;

	if (sscanf(spec,
	           "%lf %c %lf %c %c",
	           &re,
	           &sg,
	           &im,
	           &ii,
	           &ch) != 4
	    || !PLUS_OR_MINUS(sg)
	    || !IMAGINARY_UNIT(ii)) {
		fprintf(stderr, "invalid seed specification.\n");
		exit(1);
	}

	im *= SIGN(sg);

	seed->real = re;
	seed->img = im;
}
