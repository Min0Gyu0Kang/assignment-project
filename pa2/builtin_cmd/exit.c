#include <stdio.h>
#include <stdlib.h>

int exit_cmd(int argc, char *argv[]) {
    // if (argc > 2) {
    //     fprintf(stderr, "Usage: %s [NUM]\n", argv[0]);
    //     return 1;
    // }

    int exitValue = 0;
    if (argc == 2) {
        exitValue = atoi(argv[1]);
    }

    perror("Error occurred:");
    exit(exitValue);
}
