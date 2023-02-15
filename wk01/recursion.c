#include <stdio.h>


// n! = n * (n - 1) * (n - 2) * ... * 1
// n! = n * (n - 1)!

// n = 4
// 4! = 4 * 3 * 2 * 1
//    = 4 * 3!
//          3 * 2!
//              2 * 1!
//              1

int factorial(int n) {
    // base case is when n = 1 or n = 0
    if (n == 1 || n == 0) {
        return 1;
    }
    // recursive case 
    return n * factorial(n - 1); // 4 * 6
}

int main(void)
{
    int n;
    printf("Enter a number:\n");
    scanf("%d", &n);
    printf("%d\n", factorial(n)); // n!
    return 0;
}
