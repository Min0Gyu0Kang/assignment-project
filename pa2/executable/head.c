#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "executable.h"

int head(int argc, char *argv[]) {
    // Command and its arguments
    //head [OPTION] [file]
    char *command[] = {"head"};

    // Check if an option argument was provided
    if (argc == 2) {
        // Add the option argument to the command
        command[1] = argv[1];
    }

    command[2] = "file";

    // Execute the command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}