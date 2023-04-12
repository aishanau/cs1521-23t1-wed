
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

void chmod_if_need(char *pathname) {
    // check if we need to change the perms 

    // use stat() function
    struct stat s;
    // error checking
    if (stat(pathname, &s)) {
        perror(pathname);
        exit(1);
    }

    // get perms for the file
    mode_t permissions = s.st_mode;

    // check perms q
    if (permissions & S_IWOTH) { // true -> it is publically writable 

        // then change to not be public write
        mode_t new_perm = permissions & ~S_IWOTH;
        if (chmod(pathname, new_perm)) {
            perror(pathname);
            exit(1);
        }
        printf("removing public write from %s\n", pathname);

    } else { // not publically writeable 
        printf("%s is not publically writable\n", pathname);
    }
}

int main(int argc, char *argv[]) {
    // loop through all command line arguments 
    // take away public writable perms 
    for (int i = 1; i < argc; i++) {
        chmod_if_need(argv[i]);
    }
    return 0;
}