#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "executable.h"

int cp(int argc, char *argv[]) {
    // Command and its arguments
    char *command[] = {"cp", "file.txt", "file2.txt"};

    // Execute the command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}
