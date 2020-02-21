#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <quadmath.h>

//Compute the derivative.
_Float128 der(int position, _Float128 c1, _Float128 c2)
{
	//_Float128 is used due to the lack of float point precision in C.

	//Constants
	_Float128 Kpc = 50000;
	_Float128 Kdc = 7000000;

	_Float128 cdes = 0.3496;

	_Float128 Dc = 11835;

	_Float128 mz = 357000000;

	//Functions for each of the vector's [c1', c2'] position.
	if(position == 0)
	{
		return c2;
	}
	if(position == 1)
	{
		_Float128 s = (Kpc * (cdes - c1) - c2 * (Kdc + Dc))/mz;
		return s;
	}
	//If anything goes bad return -1.
	return -1;
}

int main(int argc, char * argv[])
{
	//Starting values of [c1, c2].
	_Float128 solutions[2] = {0};

	_Float128 functions[2] = {0};

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

	//Depending on the choice the data filename changes.
	if(choice == 1)
	{
		filename = "plot_data_l-e-cl.txt";
	}
	else
	{
		filename = "plot_data_l-i-cl.txt";
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

		//Compute the derivative for each of the vector's position. [c1', c2'] 
		for(position = 0; position < 2; position++)
		{
			functions[position] = der(position, solutions[0], solutions[1]);
			
			//if Improved Euler's Method was chosen, then the computation of [c1 + (h/2)*c1', c2 + (h/2)*c2'] is also needed.
			if(choice == 2)
			{
				functions[position] = der(position, solutions[0] + (h/2)*functions[0], solutions[1]+ (h/2)*functions[1]);
			}
		}
				

		//Strings to store _Float128 values.
		char buf0[128];
		char buf1[128];
		
		//Show the starting values.
		if(k == 0)
		{
			//Equal to bufi = solutions[i];
			quadmath_snprintf(buf0, 128, "%.15Qg", solutions[0]);
			quadmath_snprintf(buf1, 128, "%.15Qg", solutions[1]);

			//Show each vector to terminal.
			//printf ("t = %.1f: [c1 = %s, c2 = %s]\n", k*h,  buf0, buf1);

			//Write values to file.
			fprintf(plot_data, "%.1f %s %s\n", k*h,  buf0, buf1);
		}
		else
		{

			//Compute the vector [c1(t) + (h/2)*c1'(t), c2(t) + (h/2)*c2'(t)]
			for(position = 0; position < 2; position++)
			{
				solutions[position] = solutions[position] + h * functions[position];
			}
			
			//Equal to bufi = solutions[i];
			quadmath_snprintf(buf0, 128, "%.15Qg", solutions[0]);
			quadmath_snprintf(buf1, 128, "%.15Qg", solutions[1]);

			//Show each vector to terminal.
			//printf ("t = %.1f: [c1 = %s, c2 = %s]\n", k*h,  buf0, buf1);

			//Write values to file.
			fprintf(plot_data, "%.1f %s %s\n", k*h,  buf0, buf1);
		}

	}

	//Close the file.
	fclose(plot_data);

	printf("File written successfully!\n");

	return 0;
}
