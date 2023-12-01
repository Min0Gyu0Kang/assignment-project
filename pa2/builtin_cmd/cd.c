#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "builtin_cmd.h"

int cd(int argc, char *argv[]) {
    // if (argc != 2) {
    //     fprintf(stderr, "Usage: %s [directory]\n", argv[0]);
    //     return 1;
    // }

    if (chdir(argv[1]) != 0) {
        perror("Error occured:");
        return 1;
    }

    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) == NULL) {
        perror("Error occured:");
        return 1;
    }

//    printf("Current directory: %s\n", cwd);

    return 0;
}
