#include <stdio.h>

extern int suma(int num1, int num2);
extern int Strlen(char *str);

int num1=8, num2=16;
char str[15]="Hola mundo";

int main()
{ 
    printf("%d\n", suma(num1,num2));
    printf("%d\n", Strlen(str));
}