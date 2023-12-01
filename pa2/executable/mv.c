#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include "executable.h"

int mv(int argc, char *argv[]) {
    // Command and its arguments
    //mv file1 file2
    char *command[] = {"mv","file1","file2"};

    // Execute the command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}

