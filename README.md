# Robotic-Platform-Project-2019

Compile using the command: gcc -o filename filename.c -lquadmath.

After comparing the initial program's values with those of a simple Matlab script, 
it is evident for the calculations needed, the maximum of 80-bit precision that C can
provide with long double is not enough. Quadmath library is needed to support 128-bit float
precision with _Float128. So you must have it installed to compile the C scripts. Install quadmath
library using sudo apt install m4.

All programs output a .txt file with the data for the plots of the chosen method.

.txt name structure: plot_data_<type>_<method>_<type of loop and axis>

l:Linear.
nl: Non-linear.
e: Euler's method.
i: Improved Euler's Method.
analytic: Analytic solution.
cl: Closed-loop.
o<axis>: Open-loop for <axis> axis.

.txt file structure:
col1 = time.
col2 = x(t).
col3 = x'(t).
col4 = y(t).
col5 = y'(t).
col6 = c(t).
col7 = c'(t).

