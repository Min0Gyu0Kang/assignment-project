#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include "executable.h"

int grep(int argc, char *argv[]) {
    // Command and its arguments
    //grep [option] [pattern] [file] grep 'error'
    char *command[] = {"grep"};

   // Check if an option argument was provided
    if (argc == 2) {
        // Add the option argument to the command
        command[1] = argv[1];
    }

    // Add the file argument
    command[2] = "pattern";
    if(argc==4){
        // Add the option argument to the command
        command[3] = argv[3];
    }
    // Execute the command
    execvp(command[0], command);

    // If execvp returns, there was an error
    perror("Error occurred:");
    return 1;
}
