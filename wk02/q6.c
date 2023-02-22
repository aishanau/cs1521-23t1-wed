#include <stdio.h>

// translate this program into simple c 
// using "goto statements" and labels

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto small_big_label;
    if (x >= 1000) goto small_big_label;
        printf("medium\n");
        goto return_statement;
small_big_label:
        printf("small/big\n");
    
return_statement:
    return 0;
}
