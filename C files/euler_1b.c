#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <quadmath.h>

//Compute the derivative.
_Float128 der(int position, _Float128 x1, _Float128  x2, _Float128  y1, _Float128  y2, _Float128  c1, _Float128  c2, int o)
{

	//_Float128 is used due to the lack of precision in C.

	//Constants
	_Float128 Dx = 11835;
	_Float128 Dy = 8339;
	_Float128 Dc = 15331;
	_Float128 m = 425000;
	_Float128 ma = 113000; 
	_Float128 mz = 357000000;

	_Float128 fx;
	_Float128 fy;
	_Float128 nz;

	if(o ==1)
	{
		fx = 3496;
		fy = 0;
		nz = 0;
	}
	else if(o == 2)
	{
		fx = 0;
		fy = -3496;
		nz = 0;
	}
	else
	{
		fx = 0;
		fy = 0;
		nz = -3496;
	}

	//Functions for each of the vector's [x1', x2', y1', y2', c1', c2'] position.
	if(position == 0)
	{
		return x2;
	}
	if(position == 1)
	{
		_Float128 s = (tanq(c1)*c2*x2) - (c2*y2) + (fx - Dx*fabsq(x2)*x2)/ (( m + 3*ma ) * cosq(c1));
		return s;
	}
	if(position == 2)
	{
		return y2;
	}
	if(position == 3)
	{
		_Float128 s = (tanq(c1)*c2*y2) + (c2*x2) +  (fy-Dy*fabsq(y2)*y2)/((m+3*ma)*cosq(c1));
		return s;
	}
	if(position == 4)
	{
		return c2;
	}
	if(position == 5)
	{
		_Float128 s = (nz-Dc*fabsq(c2)*c2)/mz;
		return s;
	}

	//If anything goes bad.
	return -1;
}


int main(int argc, char * argv[])
{

	//The vector [fx, fy, nz] is the forces.
	//For the assignment only [3496, 0, 0], [0, -3496, 0] and [0, 0, -3496] are needed.

	//Starting values of [x1, x2, y1, y2, c1, c2].
	_Float128 solutions[6] = {3.496, 0, 0, 0, 0, 0};


	_Float128 functions[6] = {0};

	//The step of Euler's Method.
	double h = 0.1;

	//Choose between 1st, 2nd or 3d option.
	int o;
	printf("(1): [fx, fy, nz] = [3496, 0, 0]\n(2): [fx, fy, nz] = [0, -3496, 0]\n(3): [fx, fy, nz] = [0, 0, -3496]\nChoice: ");
	do
	{
		scanf("%d", &o);
		if(o != 1 && o != 2 && o != 3)
		{
			printf("Please enter 1, 2 or 3...\nChoice: ");
		}
	}
	while(o == 1 && o == 2 && o == 3);

	//Choose between Euler's and Improved Euler's Method.
	int choice;
	printf("Do you want Euler\'s Method(1) or Improved Euler\'s Method(2)?\nChoice: ");
	do
	{
		scanf("%d", &choice);
		if(choice != 1 && choice != 2)
		{
			printf("Please enter 1 or 2...\nChoice: ");
		}
	}
	while(choice == 1 && choice == 2);

	//Open file for data ploitting.
	FILE *plot_data;

	printf("Opening file...\n");

	char * filename;

	//Depending on the choice and option the data filename changes.
	if(choice ==1)
	{
		if(o == 1)
		{
			filename = "plot_data_nl-e-ox.txt";
		}
		else if(o == 2)
		{
			filename = "plot_data_nl-e-oy.txt";
		}
		else
		{
			filename = "plot_data_nl-e-oz.txt";
		}
	}
	else
	{
		if(o == 1)
		{
			filename = "plot_data_nl-i-ox.txt";
		}
		else if(o == 2)
		{
			filename = "plot_data_nl-i-oy.txt";
		}
		else
		{
			filename = "plot_data_nl-i-oz.txt";
		}
	}

	//If anything goes bad return -1;
	if((plot_data = fopen(filename, "w")) == NULL)
	{
		return -1;
	}

	int k; //Number of loops.
	for(k = 0; k<=6000; k++)//For 6000 loops (We want time equal to 600 and the step is 0.1)
	{
		//Depending the position of the vector, we want to compute the according derivative.
		int position;

		//Compute the derivative for each of the vector's position. [x1', x2', y1', y2', c1', c2'] 
		for(position = 0; position < 6; position++)
		{
			functions[position] = der(position, solutions[0], solutions[1], solutions[2], solutions[3], solutions[4], solutions[5], o);
			
			//if Improved Euler's Method was chosen, then the computation of [x1 + (h/2)*x1',x2 + (h/2)*x2', y1 + (h/2)*y1', y2 + (h/2)*y2', c1 + (h/2)*c1', c2 + (h/2)*c2'] is also needed.
			if(choice == 2)
			{
				functions[position] = der(position, solutions[0] + (h/2)*functions[0], solutions[1]+ (h/2)*functions[1], solutions[2]+ (h/2)*functions[2], solutions[3] + (h/2)*functions[3], solutions[4] + (h/2)*functions[4], solutions[5]+ (h/2)*functions[5], o);
			}
		}

		//Strings to store _Float128 values.
		char buf0[128];
		char buf1[128];
		char buf2[128];
		char buf3[128];
		char buf4[128];
		char buf5[128];

		//Show the starting values.
		if(k == 0)
		{
			quadmath_snprintf(buf0, 128, "%.15Qg", solutions[0]);
			quadmath_snprintf(buf1, 128, "%.15Qg", solutions[1]);
			quadmath_snprintf(buf2, 128, "%.15Qg", solutions[2]);
			quadmath_snprintf(buf3, 128, "%.15Qg", solutions[3]);
			quadmath_snprintf(buf4, 128, "%.15Qg", solutions[4]);
			quadmath_snprintf(buf5, 128, "%.15Qg", solutions[5]);

			//Show each vector to terminal.
			//printf ("t = %.1f: [x1 = %s, x2 = %s, y1 = %s, y2 = %s, c1 = %s, c2 = %s]\n", k*h,  buf0, buf1, buf2, buf3, buf4, buf5);

			//Write values to file.
			fprintf(plot_data, "%.1f %s %s %s %s %s %s\n", k*h,  buf0, buf1, buf2, buf3, buf4, buf5 );
		}
		else
			{
		//Compute the vector [x1(t+1), x2(t+1), y1(t+1), y2(t-+0+1), c1(t+1), c2(t+1)] = [x1(t), x2(t), y1(t), y2(t), c1(t), c2(t)] + h * [x1(t) + (h/2)*x1'(t), x2(t) + (h/2)*x2'(t), y1(t) + (h/2)*y1'(t), y2(t) + (h/2)*y2'(t), c1(t) + (h/2)*c1'(t), c2(t) + (h/2)*c2'(t)]
			for(position = 0; position < 6; position++)
			{
				solutions[position] = solutions[position] + h * functions[position];
			}

			//Equal to bufi = solutions[i];
			quadmath_snprintf(buf0, 128, "%.15Qg", solutions[0]);
			quadmath_snprintf(buf1, 128, "%.15Qg", solutions[1]);
			quadmath_snprintf(buf2, 128, "%.15Qg", solutions[2]);
			quadmath_snprintf(buf3, 128, "%.15Qg", solutions[3]);
			quadmath_snprintf(buf4, 128, "%.15Qg", solutions[4]);
			quadmath_snprintf(buf5, 128, "%.15Qg", solutions[5]);

			//Show each vector to terminal.
			//printf ("t = %.1f: [x1 = %s, x2 = %s, y1 = %s, y2 = %s, c1 = %s, c2 = %s]\n", k*h,  buf0, buf1, buf2, buf3, buf4, buf5);

			//Write values to file.
			fprintf(plot_data, "%.1f %s %s %s %s %s %s\n", k*h,  buf0, buf1, buf2, buf3, buf4, buf5 );
		}

	}

	//Close the file.
	fclose(plot_data);

	printf("File written successfully!\n");

	return 0;
}
