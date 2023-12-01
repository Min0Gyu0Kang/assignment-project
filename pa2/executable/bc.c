#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "executable.h"

int bc(int argc, char *argv[]) {
    // Command and its arguments
    //bc [-l] [file]
    char *command[] = {"bc","-l","file"};

    // Execute the command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}
