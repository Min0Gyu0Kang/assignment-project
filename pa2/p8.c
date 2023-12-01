#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>

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

int main()
{
    size_t size;
    char *cmd, *ptr;
    char *arg[MAX_ARG], *arg2[MAX_ARG];
    char path[MAX_PATH_LEN], path2[MAX_PATH_LEN];
    int child_status;
    int fd[2];
    int fdr;

    while (1)
    {
        int num = 0;
        cmd = NULL;
        printf("> ");
        getline(&cmd, &size, stdin);
        cmd[strlen(cmd) - 1] = '\0';

        // Terminate program
        if (strcmp(cmd, "quit") == 0)
        {
            break;
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

                    execv(path, arg);
                    exit(0);
                }
                else
                {
                    // Parent process
                    // Wait for the first command to finish
                    waitpid(child_pid, NULL, 0);

                    // Redirect stdin to the read end of the pipe
                    close(fd[1]);
                    dup2(fd[0], STDIN_FILENO);
                    close(fd[0]);

                    execv(path2, arg2);
                    exit(0);
                }
            }
            else
                wait(&child_status);
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

                execv(path, arg);
                exit(0);
            }
            else
                wait(&child_status);
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

                execv(path, arg);
                exit(0);
            }
        }
        else
            wait(&child_status);
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
            execv(path, arg);
            exit(0);
        }
        else
            wait(&child_status);
    }

    return 0;
}
