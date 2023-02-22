// print the square of a number
#include <stdio.h>
int main(void) {
    int x, y;
    printf("Enter a number: "); // string literals are stored 
                                //in the data segment in C
    scanf("%d", &x);
    y = x * x;
    printf("%d", y);

    printf("\n");
    
    return 0;
}
