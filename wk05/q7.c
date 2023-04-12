#include <stdio.h>
#include <stdint.h>
#include <assert.h>

typedef unsigned int Word;

#define NUM_BITS 32
#define BASE_MASK 1u



// 0100 0000 0000 0000 0000 0000 0000 0000
// 0000 0001 0010 0011 0100 0101 0110 0111
Word reverse_bits(Word w) {

}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E

    assert(reverse_bits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}