#include<stdio.h>

int fibonacci(unsigned int);

int main(){
	int i = fibonacci(8);
	printf("i hat den Wert: %d",i);
	return 0;
}

int fibonacci(unsigned int n){
	if (n<=2) return 1;
	else return fibonacci(n-1) + fibonacci(n-2);
}
