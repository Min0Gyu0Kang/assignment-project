#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "executable.h"

int awk(int argc, char *argv[])
{
    // Command and its arguments
    // awk [OPTION] [awk program] [ARGUMENT]
    char *command[1] = {"awk"};

    // Check if an option argument was provided
    if (argc ==3)
    {
        // Add the option argument to the command
        command[2] = argv[2];
    }

    command[3] = "argument";
    // Execute the command
    execvp(command[1], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}
