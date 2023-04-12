#include <stdio.h>
#include <stdlib.h>

// Write a C program, first_line.c, which is given one command-line argument, 
// the name of a file, and which prints the first line of that file to stdout. 


// If given an incorrect number of arguments, or if there was an error opening the file, 
// it should print a suitable error message.
int main(int argc, char *argv[]) {

    if (argc != 2) { // name of the prog is argv[0] and pathname is argv[1]
        // print out an error msg 
        // print out error to stderr
        fprintf(stderr, "Usage <%s>: incorrect number of arguments\n", argv[0]);
        return 1;
    }

    FILE *file_stream = fopen(argv[1], "r");

    if (file_stream == NULL) {
        perror(argv[1]);
        return 1;
    }

    // fgetc to read character by character from the file 
    // fputc to print out characters to stdout 

    int c;
    while ((c = fgetc(file_stream)) != EOF) {
        fputc(c, stdout);
        if (c == '\n') break;
    }

    fclose(file_stream);
    return 0;
}