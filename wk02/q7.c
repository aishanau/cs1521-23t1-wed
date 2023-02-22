#include <stdio.h>

int main(void) {
    // for (int x = 24; x < 42; x += 3) {
    //     printf("%d\n",x);
    // }

    // translate to simple C

    int x = 24; 
loop_condition:
    if (x >= 42) goto end_loop;
        printf("%d\n",x);
        x += 3;
        goto loop_condition;

end_loop:
    return 0;
}
