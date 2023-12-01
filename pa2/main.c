#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <error.h>
#include "builtin_cmd.h"
#include "executable.h"

#define MAX_ARG 128
#define MAX_PATH_LEN 128

void make_tokens(char *cmd, char *arg[], char *arg2[], char *target)
{
    char *left, *right, *ptr;
    int num = 0;

    left = strtok(cmd, target);
    strcat(left, "\0");
    right = strtok(NULL, target);
    strcat(right, "\0");

    ptr = strtok(left, " ");
    while (ptr != NULL)
    {
        arg[num++] = ptr;
        ptr = strtok(NULL, " ");
    }
    arg[num] = NULL;

    num = 0;
    ptr = strtok(right, " ");
    while (ptr != NULL)
    {
        arg2[num++] = ptr;
        ptr = strtok(NULL, " ");
    }
    arg2[num] = NULL;

    return;
}

int main(int argc, char *argv[])
{
    size_t size;
    char *cmd, *ptr;
    char *arg[MAX_ARG], *arg2[MAX_ARG];
    char path[MAX_PATH_LEN], path2[MAX_PATH_LEN];
    int child_status;
    int fd[2];
    int fdr;

    int num = 0;
    cmd = NULL;
    printf("> ");
    getline(&cmd, &size, stdin);
    cmd[strlen(cmd) - 1] = '\0';

    // Terminate program
    if (strcmp(cmd, "quit") == 0)
    {
        exit_cmd();
    }

    // Pipe
    if (strchr(cmd, '|') != NULL)
    {
        make_tokens(cmd, arg, arg2, "|");

        sprintf(path, "/bin/%s", arg[0]);
        sprintf(path2, "/bin/%s", arg2[0]);

        if (pipe(fd) == -1)
            exit(1);

        if (fork() == 0)
        {
            // Place your code in this if block!
            // Child process
            int child_pid;
            if ((child_pid = fork()) == 0)
            {
                // Child process for the first command
                // Redirect stdout to the write end of the pipe
                close(fd[0]);
                dup2(fd[1], STDOUT_FILENO);
                close(fd[1]);

                char *command = argv[1];

        if (strcmp(command, "cd") == 0 || strcmp(command, "exit") == 0)
        {
            {
                // Run builtin_cmd.h commands
                if (strcmp(command, "cd") == 0)
                {
                    cd(argc, argv);
                }
                else if (strcmp(command, "exit") == 0)
                {
                    exit_cmd(argc, argv);
                }
            }
            else if (
                strcmp(command, "awk") == 0 || strcmp(command, "bc") == 0 || strcmp(command, "cat") == 0 ||
                strcmp(command, "cp") == 0 || strcmp(command, "grep") == 0 || strcmp(command, "head") == 0 ||
                strcmp(command, "ls") == 0 || strcmp(command, "man") == 0 || strcmp(command, "mv") == 0 ||
                strcmp(command, "pwd") == 0 || strcmp(command, "rm") == 0 || strcmp(command, "sort") == 0 ||
                strcmp(command, "tail") == 0)
            {
                // Fork and run executable.h commands in the child process
                pid_t pid = fork();
                if (pid < 0)
                {
                    fprintf(stderr, "Fork failed\n");
                    return 1;
                }
                else if (pid == 0)
                {
                    // Child process
                    if (strcmp(command, "awk") == 0)
                    {
                        awk(argc, argv);
                    }
                    else if (strcmp(command, "bc") == 0)
                    {
                        bc(argc, argv);
                    }
                    else if (strcmp(command, "cat") == 0)
                    {
                        cat(argc, argv);
                    }
                    else if (strcmp(command, "cp") == 0)
                    {
                        cp(argc, argv);
                    }
                    else if (strcmp(command, "grep") == 0)
                    {
                        grep(argc, argv);
                    }
                    else if (strcmp(command, "head") == 0)
                    {
                        head(argc, argv);
                    }
                    else if (strcmp(command, "ls") == 0)
                    {
                        ls(argc, argv);
                    }
                    else if (strcmp(command, "man") == 0)
                    {
                        man(argc, argv);
                    }
                    else if (strcmp(command, "mv") == 0)
                    {
                        mv(argc, argv);
                    }
                    else if (strcmp(command, "pwd") == 0)
                    {
                        pwd(argc, argv);
                        else if (strcmp(command, "rm") == 0)
                        {
                            rm(argc, argv);
                        }
                        else if (strcmp(command, "sort") == 0)
                        {
                            sort(argc, argv);
                        }
                        else if (strcmp(command, "tail") == 0)
                        {
                            tail(argc, argv);
                        }
                        return 0;
                    }
                    else
                    {
                        // Parent process
                        // Wait for the child process to finish
                        int status;
                        waitpid(-1, &status, WNOHANG | WUNTRACED);
                    }
                }
                else
                {
                    printf("mini: command not found");
                    return 1;
                }
            }
                exit(0);
            }
            else
            {
                // Parent process
                // Wait for the first command to finish
                waitpid(-1, &status, WNOHANG | WUNTRACED);

                // Redirect stdin to the read end of the pipe
                close(fd[1]);
                dup2(fd[0], STDIN_FILENO);
                close(fd[0]);

                char *command = argv[1];

        if (strcmp(command, "cd") == 0 || strcmp(command, "exit") == 0)
        {
            {
                // Run builtin_cmd.h commands
                if (strcmp(command, "cd") == 0)
                {
                    cd(argc, argv);
                }
                else if (strcmp(command, "exit") == 0)
                {
                    exit_cmd(argc, argv);
                }
            }
            else if (
                strcmp(command, "awk") == 0 || strcmp(command, "bc") == 0 || strcmp(command, "cat") == 0 ||
                strcmp(command, "cp") == 0 || strcmp(command, "grep") == 0 || strcmp(command, "head") == 0 ||
                strcmp(command, "ls") == 0 || strcmp(command, "man") == 0 || strcmp(command, "mv") == 0 ||
                strcmp(command, "pwd") == 0 || strcmp(command, "rm") == 0 || strcmp(command, "sort") == 0 ||
                strcmp(command, "tail") == 0)
            {
                // Fork and run executable.h commands in the child process
                pid_t pid = fork();
                if (pid < 0)
                {
                    fprintf(stderr, "Fork failed\n");
                    return 1;
                }
                else if (pid == 0)
                {
                    // Child process
                    if (strcmp(command, "awk") == 0)
                    {
                        awk(argc, argv);
                    }
                    else if (strcmp(command, "bc") == 0)
                    {
                        bc(argc, argv);
                    }
                    else if (strcmp(command, "cat") == 0)
                    {
                        cat(argc, argv);
                    }
                    else if (strcmp(command, "cp") == 0)
                    {
                        cp(argc, argv);
                    }
                    else if (strcmp(command, "grep") == 0)
                    {
                        grep(argc, argv);
                    }
                    else if (strcmp(command, "head") == 0)
                    {
                        head(argc, argv);
                    }
                    else if (strcmp(command, "ls") == 0)
                    {
                        ls(argc, argv);
                    }
                    else if (strcmp(command, "man") == 0)
                    {
                        man(argc, argv);
                    }
                    else if (strcmp(command, "mv") == 0)
                    {
                        mv(argc, argv);
                    }
                    else if (strcmp(command, "pwd") == 0)
                    {
                        pwd(argc, argv);
                        else if (strcmp(command, "rm") == 0)
                        {
                            rm(argc, argv);
                        }
                        else if (strcmp(command, "sort") == 0)
                        {
                            sort(argc, argv);
                        }
                        else if (strcmp(command, "tail") == 0)
                        {
                            tail(argc, argv);
                        }
                        return 0;
                    }
                    else
                    {
                        // Parent process
                        // Wait for the child process to finish
                        int status;
                        waitpid(-1, &status, WNOHANG | WUNTRACED);
                    }
                }
                else
                {
                    printf("mini: command not found");
                    return 1;
                }
            }
                exit(0);
            }
        }
        else
            waitpid(-1, &status, WNOHANG | WUNTRACED);
    }
    // > Redirection
    else if (strchr(cmd, '>') != NULL)
    {
        make_tokens(cmd, arg, arg2, ">");
        sprintf(path, "/bin/%s", arg[0]);

        if (fork() == 0)
        {
            // Place your code in this if block!
            // Child process
            // Open the file for writing
            int file_fd = open(arg2[0], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
            if (file_fd == -1)
            {
                perror("open");
                exit(1);
            }

            // Redirect stdout to the file
            dup2(file_fd, STDOUT_FILENO);
            close(file_fd);

            char *command = argv[1];

        if (strcmp(command, "cd") == 0 || strcmp(command, "exit") == 0)
        {
            {
                // Run builtin_cmd.h commands
                if (strcmp(command, "cd") == 0)
                {
                    cd(argc, argv);
                }
                else if (strcmp(command, "exit") == 0)
                {
                    exit_cmd(argc, argv);
                }
            }
            else if (
                strcmp(command, "awk") == 0 || strcmp(command, "bc") == 0 || strcmp(command, "cat") == 0 ||
                strcmp(command, "cp") == 0 || strcmp(command, "grep") == 0 || strcmp(command, "head") == 0 ||
                strcmp(command, "ls") == 0 || strcmp(command, "man") == 0 || strcmp(command, "mv") == 0 ||
                strcmp(command, "pwd") == 0 || strcmp(command, "rm") == 0 || strcmp(command, "sort") == 0 ||
                strcmp(command, "tail") == 0)
            {
                // Fork and run executable.h commands in the child process
                pid_t pid = fork();
                if (pid < 0)
                {
                    fprintf(stderr, "Fork failed\n");
                    return 1;
                }
                else if (pid == 0)
                {
                    // Child process
                    if (strcmp(command, "awk") == 0)
                    {
                        awk(argc, argv);
                    }
                    else if (strcmp(command, "bc") == 0)
                    {
                        bc(argc, argv);
                    }
                    else if (strcmp(command, "cat") == 0)
                    {
                        cat(argc, argv);
                    }
                    else if (strcmp(command, "cp") == 0)
                    {
                        cp(argc, argv);
                    }
                    else if (strcmp(command, "grep") == 0)
                    {
                        grep(argc, argv);
                    }
                    else if (strcmp(command, "head") == 0)
                    {
                        head(argc, argv);
                    }
                    else if (strcmp(command, "ls") == 0)
                    {
                        ls(argc, argv);
                    }
                    else if (strcmp(command, "man") == 0)
                    {
                        man(argc, argv);
                    }
                    else if (strcmp(command, "mv") == 0)
                    {
                        mv(argc, argv);
                    }
                    else if (strcmp(command, "pwd") == 0)
                    {
                        pwd(argc, argv);
                        else if (strcmp(command, "rm") == 0)
                        {
                            rm(argc, argv);
                        }
                        else if (strcmp(command, "sort") == 0)
                        {
                            sort(argc, argv);
                        }
                        else if (strcmp(command, "tail") == 0)
                        {
                            tail(argc, argv);
                        }
                        return 0;
                    }
                    else
                    {
                        // Parent process
                        // Wait for the child process to finish
                        int status;
                        waitpid(-1, &status, WNOHANG | WUNTRACED);
                    }
                }
                else
                {
                    printf("mini: command not found");
                    return 1;
                }
            }
            exit(0);
        }
        else
            waitpid(-1, &status, WNOHANG | WUNTRACED);
    }
    // < REDIRECTION
    else if (strchr(cmd, '<') != NULL)
    {
        make_tokens(cmd, arg, arg2, "<");
        sprintf(path, "/bin/%s", arg[0]);

        if (fork() == 0)
        {
            // Place your code in this if block!
            // Child process
            // Open the file for reading
            int file_fd = open(arg2[0], O_RDONLY);
            if (file_fd == -1)
            {
                perror("open");
                exit(1);
            }

            // Redirect stdin to the file
            dup2(file_fd, STDIN_FILENO);
            close(file_fd);

            //execv...then I need to change all header command[value]
        char *command = argv[1];

        if (strcmp(command, "cd") == 0 || strcmp(command, "exit") == 0)
        {
            {
                // Run builtin_cmd.h commands
                if (strcmp(command, "cd") == 0)
                {
                    cd(argc, argv);
                }
                else if (strcmp(command, "exit") == 0)
                {
                    exit_cmd(argc, argv);
                }
            }
            else if (
                strcmp(command, "awk") == 0 || strcmp(command, "bc") == 0 || strcmp(command, "cat") == 0 ||
                strcmp(command, "cp") == 0 || strcmp(command, "grep") == 0 || strcmp(command, "head") == 0 ||
                strcmp(command, "ls") == 0 || strcmp(command, "man") == 0 || strcmp(command, "mv") == 0 ||
                strcmp(command, "pwd") == 0 || strcmp(command, "rm") == 0 || strcmp(command, "sort") == 0 ||
                strcmp(command, "tail") == 0)
            {
                // Fork and run executable.h commands in the child process
                pid_t pid = fork();
                if (pid < 0)
                {
                    fprintf(stderr, "Fork failed\n");
                    return 1;
                }
                else if (pid == 0)
                {
                    // Child process
                    if (strcmp(command, "awk") == 0)
                    {
                        awk(argc, argv);
                    }
                    else if (strcmp(command, "bc") == 0)
                    {
                        bc(argc, argv);
                    }
                    else if (strcmp(command, "cat") == 0)
                    {
                        cat(argc, argv);
                    }
                    else if (strcmp(command, "cp") == 0)
                    {
                        cp(argc, argv);
                    }
                    else if (strcmp(command, "grep") == 0)
                    {
                        grep(argc, argv);
                    }
                    else if (strcmp(command, "head") == 0)
                    {
                        head(argc, argv);
                    }
                    else if (strcmp(command, "ls") == 0)
                    {
                        ls(argc, argv);
                    }
                    else if (strcmp(command, "man") == 0)
                    {
                        man(argc, argv);
                    }
                    else if (strcmp(command, "mv") == 0)
                    {
                        mv(argc, argv);
                    }
                    else if (strcmp(command, "pwd") == 0)
                    {
                        pwd(argc, argv);
                        else if (strcmp(command, "rm") == 0)
                        {
                            rm(argc, argv);
                        }
                        else if (strcmp(command, "sort") == 0)
                        {
                            sort(argc, argv);
                        }
                        else if (strcmp(command, "tail") == 0)
                        {
                            tail(argc, argv);
                        }
                        return 0;
                    }
                    else
                    {
                        // Parent process
                        // Wait for the child process to finish
                        int status;
                        waitpid(-1, &status, WNOHANG | WUNTRACED);
                    }
                }
                else
                {
                    printf("mini: command not found");
                    return 1;
                }
            }

            return 0;
        }
            exit(0);
        }
    }
    else
        waitpid(-1, &status, WNOHANG | WUNTRACED);
}
// ONLY SINGLE COMMAND
else
{
    ptr = strtok(cmd, " ");
    while (ptr != NULL)
    {
        arg[num++] = ptr;
        ptr = strtok(NULL, " ");
    }
    arg[num] = NULL;

    sprintf(path, "/bin/%s", arg[0]);

    if (fork() == 0)
    {
        char *command = argv[1];

        if (strcmp(command, "cd") == 0 || strcmp(command, "exit") == 0)
        {
            {
                // Run builtin_cmd.h commands
                if (strcmp(command, "cd") == 0)
                {
                    cd(argc, argv);
                }
                else if (strcmp(command, "exit") == 0)
                {
                    exit_cmd(argc, argv);
                }
            }
            else if (
                strcmp(command, "awk") == 0 || strcmp(command, "bc") == 0 || strcmp(command, "cat") == 0 ||
                strcmp(command, "cp") == 0 || strcmp(command, "grep") == 0 || strcmp(command, "head") == 0 ||
                strcmp(command, "ls") == 0 || strcmp(command, "man") == 0 || strcmp(command, "mv") == 0 ||
                strcmp(command, "pwd") == 0 || strcmp(command, "rm") == 0 || strcmp(command, "sort") == 0 ||
                strcmp(command, "tail") == 0)
            {
                // Fork and run executable.h commands in the child process
                pid_t pid = fork();
                if (pid < 0)
                {
                    fprintf(stderr, "Fork failed\n");
                    return 1;
                }
                else if (pid == 0)
                {
                    // Child process
                    if (strcmp(command, "awk") == 0)
                    {
                        awk(argc, argv);
                    }
                    else if (strcmp(command, "bc") == 0)
                    {
                        bc(argc, argv);
                    }
                    else if (strcmp(command, "cat") == 0)
                    {
                        cat(argc, argv);
                    }
                    else if (strcmp(command, "cp") == 0)
                    {
                        cp(argc, argv);
                    }
                    else if (strcmp(command, "grep") == 0)
                    {
                        grep(argc, argv);
                    }
                    else if (strcmp(command, "head") == 0)
                    {
                        head(argc, argv);
                    }
                    else if (strcmp(command, "ls") == 0)
                    {
                        ls(argc, argv);
                    }
                    else if (strcmp(command, "man") == 0)
                    {
                        man(argc, argv);
                    }
                    else if (strcmp(command, "mv") == 0)
                    {
                        mv(argc, argv);
                    }
                    else if (strcmp(command, "pwd") == 0)
                    {
                        pwd(argc, argv);
                        else if (strcmp(command, "rm") == 0)
                        {
                            rm(argc, argv);
                        }
                        else if (strcmp(command, "sort") == 0)
                        {
                            sort(argc, argv);
                        }
                        else if (strcmp(command, "tail") == 0)
                        {
                            tail(argc, argv);
                        }
                        return 0;
                    }
                    else
                    {
                        // Parent process
                        // Wait for the child process to finish
                        int status;
                        waitpid(-1, &status, WNOHANG | WUNTRACED);
                    }
                }
                else
                {
                    printf("mini: command not found");
                    return 1;
                }
            }
        exit(0);
    }
    else
        waitpid(-1, &status, WNOHANG | WUNTRACED);

    
    
    

    
}
/**
Error occurred: <ERRNO> (에러 번호 출력)
*/