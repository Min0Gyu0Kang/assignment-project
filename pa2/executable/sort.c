#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "executable.h"

int sort(int argc, char *argv[]) {
    // Command and its arguments
    //sort [FILE]
    char *command[] = {"sort","file"};

    // Execute the command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}

