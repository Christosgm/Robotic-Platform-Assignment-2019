#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <quadmath.h>

//Compute the derivative.
_Float128 der(int position, _Float128 x1, _Float128 x2, _Float128 y1, _Float128 y2, _Float128 c1, _Float128 c2)
{

	//_Float128 is used due to the lack of float point precision in C.

	//Constants
	_Float128 Kpx = 77480;
	_Float128 Kdx = 5000000;
	_Float128 Kpy = 60000;
	_Float128 Kdy = 4650400;
	_Float128 Kpc = 50000;
	_Float128 Kdc = 7000000;

	_Float128 xdes = 34.96;
	_Float128 ydes = -34.96;
	_Float128 cdes = 0.3496;

	_Float128 Dx = 15331;
	_Float128 Dy = 11835;
	_Float128 Dc = 11835;

	_Float128 m = 425000;
	_Float128 ma = 113000; 
	_Float128 mz = 357000000;

	//Functions for each of the vector's [x1', x2', y1', y2', c1', c2'] position.
	if(position == 0)
	{
		return x2;
	}
	if(position == 1)
	{
		_Float128 s = c2*(tanq(c1)*x2 - y2) + (((Kpx * (xdes - x1) - Kdx*x2) - Dx*fabsq(x2)*x2)/(m + 3*ma))/cosq(c1);
		return s;
	}
	if(position == 2)
	{
		return y2;
	}
	if(position == 3)
	{
		_Float128 s =c2 * (tanq(c1)*y2 + x2) + (((Kpy * (ydes - y1) - Kdy * y2) - Dy*fabsq(y2)*y2)/(m + 3*ma))/cosq(c1);
		return s;
	}
	if(position == 4)
	{
		return c2;
	}
	if(position == 5)
	{
		_Float128 s = ((Kpc * (cdes - c1) - Kdc * c2) - Dc*fabsq(c2)*c2)/mz;
		return s;
	}

	//If anything goes bad return -1.
	return -1;
}

int main(int argc, char * argv[])
{
	//The vector [fx, fy, nz] is now described by a closed-loop automatic control system so the functions are changed accordingly.


	//Starting values of [x1, x2, y1, y2, c1, c2].
	_Float128 solutions[6] = {0, 0, -3.496, 0, 0, 0};

	_Float128 functions[6] = {0};

	//The step of Euler's Method.
	double  h = 0.1;

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

	//Open file for data plotting.
	FILE *plot_data;

	printf("Opening file...\n");

	char * filename;

	//Depending on the choice and option the data filename changes.
	if(choice == 1)
	{
		filename = "plot_data_nl-e-cl.txt";
	}
	else
	{
		filename = "plot_data_nl-i-cl.txt";
	}

	//If anything goes bad return -1.
	if((plot_data = fopen(filename, "w")) == NULL)
	{
		return -1;
	}

	//fprintf(plot_data, "0.0 0 0-3.496 0 0 0\n");

	int k; //Number of loops.
	for(k = 0; k<=6000; k++)//For 6000 loops (We want time equal to 600 and the step is 0.1)
	{
		//Depending the position of the vector, we want to compute the according derivative.
		int position;

		//Compute the derivative for each of the vector's position. [x1', x2', y1', y2', c1', c2'] 
		for(position = 0; position < 6; position++)
		{
			functions[position] = der(position, solutions[0], solutions[1], solutions[2], solutions[3], solutions[4], solutions[5]);
			
			//if Improved Euler's Method was chosen, then the computation of [x1 + (h/2)*x1',x2 + (h/2)*x2', y1 + (h/2)*y1', y2 + (h/2)*y2', c1 + (h/2)*c1', c2 + (h/2)*c2'] is also needed.
			if(choice == 2)
			{
				functions[position] = der(position, solutions[0] + (h/2)*functions[0], solutions[1]+ (h/2)*functions[1], solutions[2]+ (h/2)*functions[2], solutions[3] + (h/2)*functions[3], solutions[4] + (h/2)*functions[4], solutions[5]+ (h/2)*functions[5]);
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
		else
		{

			//Compute the vector [x1(t+1), x2(t+1), y1(t+1), y2(t+1), c1(t+1), c2(t+1)] = [x1(t), x2(t), y1(t), y2(t), c1(t), c2(t)] + h * [x1(t) + (h/2)*x1'(t), x2(t) + (h/2)*x2'(t), y1(t) + (h/2)*y1'(t), y2(t) + (h/2)*y2'(t), c1(t) + (h/2)*c1'(t), c2(t) + (h/2)*c2'(t)]
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
