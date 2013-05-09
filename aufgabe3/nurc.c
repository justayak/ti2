#include<stdio.h>

int fibonacci(unsigned int);
int fibonacciIterative(unsigned int); 

int main(){
	int i = fibonacciIterative(8);
	printf("i hat den Wert: %d",i);
	return 0;
}

int fibonacci(unsigned int n){
	if (n<=2) return 1;
	else return fibonacci(n-1) + fibonacci(n-2);
}

int fibonacciIterative(unsigned int n){
	int a = 0;
	int b = 1;
	int result = 0;
	int i = -1; // muss initialisiert werden
	for (i = 1; i < n; i++){
		result = a + b;
		a = b;
		b = result;
	}
	return result;
}
