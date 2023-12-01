#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "executable.h"

int rm(int argc, char *argv[]) {
    // Command and its arguments
    //rm file
    char *command[] = {"rm","file"};

    // Execute the command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}

