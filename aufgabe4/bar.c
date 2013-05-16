#include<stdio.h>

int collatz(unsigned int);

int main()
{
	int i = collatz(19);
	printf("i hat den Wert: %d",i);
	return 0;

}
