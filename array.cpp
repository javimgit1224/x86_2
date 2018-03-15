#include <stdio.h>
#include <iostream>
#include <iomanip>
extern "C" unsigned long int array();	//allows to use standard c for parameter passing

using namespace std;

int main()
{
	unsigned long int return_code = 1111111111;	//random number
	printf("%s", "this is cpsc 240 assignment 2 programmed by Javier Melendrez \n");
	printf("%s", "this software is running on a Acer E-5 575 with procesor intel i3-7100u running at 2.40ghz with os ubuntu 16.14. \n");
	return_code = array();
	printf("%s%1.18lf%s\n","the driver recieved return code: ", return_code,". \n the driver will now return 0 to the os. have a nice x86 day.");
	return 0;
}
