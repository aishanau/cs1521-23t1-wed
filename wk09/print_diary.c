// print $HOME/.diary to stdout

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {

    // 1. get the value of $HOME environment variable 
    char *home_pathname = getenv("HOME");

    printf("The value of $HOME: %s\n", home_pathname);

    // 2. construct the path for $HOME/.diary
    // $HOME / .diary 
    char *diary_filename = ".diary";

    int diary_pathname_length = strlen(home_pathname) + strlen(diary_filename) + 2;
    // char *diary_pathname = malloc(sizeof(char) * diary_pathname_length);
    char diary_pathname[diary_pathname_length];

    snprintf(diary_pathname, diary_pathname_length, "%s/%s", home_pathname, diary_filename);

    printf("The value of diary_pathname: %s\n", diary_pathname);

    // 3. print out .diary into current terminal
    FILE *diary_stream = fopen(diary_pathname, "r");
    if (diary_stream == NULL) {
        perror(diary_pathname);
        exit(1);
    }

    int letter;
    while ((letter = fgetc(diary_stream)) != EOF) {
        fputc(letter, stdout);
    }

    free(diary_pathname);
    fclose(diary_stream);

    return 0;
}