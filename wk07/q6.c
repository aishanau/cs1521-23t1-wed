#include <stdint.h>
#include <stdio.h>



uint32_t six_middle_bits(int32_t value) {
    // 0b00000000 00000000 01011011 10100000 >> 13
    // 0b00000000 00000000 00000000 00000010 >> 13
    // 0b00000000 00000000 00000000 00111111 
    return (value >> 13) & 0x3F;
}

int main() {
    printf("the six middle bits are %x\n", six_middle_bits(23456));
}