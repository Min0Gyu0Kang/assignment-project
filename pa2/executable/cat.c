#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "executable.h"

int cat(int argc, char *argv[]) {
    // Command and its arguments
    char *command[] = {"cat", "file"};

    // Execute the cat command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("execvp");
    return 1;
}
