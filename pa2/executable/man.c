#include <stdio.h>
#include <errno.h>
#include <string.h>
#include "executable.h"

int man(int argc, char *argv[])
{
    // some commands are described in man7.org. Others follow PA2's programs section
    if (argc < 1)
    {
        perror("Error occured: ");
    }

    if (strcmp(argv[2], "cd") == 0)
    {
        printf("\
        cd dir\n\
        Change the current working directory to dir\
        ");
    }
    else if (strcmp(argv[2], "exit") == 0)
    {
        printf("\
        exit [NUM]\n\
        Print the string exit on standard error, then exit Mini shell.\n\
        If NUM is specified, NUM is returned as the exit value of the program, otherwise 0.\
        ");
    }
    else if (strcmp(argv[2], "awk") == 0)
    {
        printf("\
        awk [OPTION] [awk program] [ARGUMENT]\n\
        awk — pattern scanning and processing language\
        ");
    }
    else if (strcmp(argv[2], "bc") == 0)
    {
        printf("\
        bc [-l] [file]\n\
        bc — arbitrary-precision arithmetic language\
        ");
    }
    else if (strcmp(argv[2], "cat") == 0)
    {
        printf("\
        cat [FILE]\n\
        file Output the file to standard output.\n\
        file It assumed that file always exist.\
        ");
    }
    else if (strcmp(argv[2], "cp") == 0)
    {
        printf("\
        cp file1 file2\n\
        file1 Make a copy of the file, and name it file2.\n\
        file1 It assumed that file always exist.\n\
        When missing parameters, print cp: missing file operand\n\
        When missing one parameter, print cp: missing destination file operand after file1\
        ");
    }
    else if (strcmp(argv[2], "grep") == 0)
    {
        printf("\
        grep [option] [pattern] [file]\n\
        grep — search a file for a pattern\
        ");
    }
    else if (strcmp(argv[2], "head") == 0)
    {
        printf("\
        head [OPTION] [file]\n\
        file Print 10 lines from the top of the file to standard output.\n\
        -n K Print K lines instead of 10 lines.\n\
        file It assumed that file always exist.\
        ");
    }
    else if (strcmp(argv[2], "ls") == 0)
    {
        printf("\
        ls [OPTION][FILE]\n\
        ls - list directory contents\
        ");
    }
    else if (strcmp(argv[2], "man") == 0)
    {
        printf("\
        man cmd\n\
        show the manual page for minishell commands. \
        ");
    }
    else if (strcmp(argv[2], "mv") == 0)
    {
        printf("\
        mv source destination\n\
        source Rename source to destination or move source to destination\n\
        When missing parameters, print mv: missing file operand\n\
        When missing one parameter, print mv: missing destination file operand after 'source'\
        ");
    }
    else if (strcmp(argv[2], "pwd") == 0)
    {
        printf("\
        pwd\n\
        Print current working directory to stdout.\
        ");
    }
    else if (strcmp(argv[2], "rm") == 0)
    {
        printf("\
        rm file\n\
        file Remove file\
        ");
    }
    else if (strcmp(argv[2], "sort") == 0)
    {
        printf("\
        sort [FILE]\n\
        sort - sort lines of text files\
        ");
    }
    else if (strcmp(argv[2], "tail") == 0)
    {
        printf("\
        tail [OPTION] [file]\n\
        file Print 10 lines from the bottom of the file to standard output.\n\
        -n K Print K lines instead of 10 lines. -n K\n\
        file It assumed that file always exist.\
        ");
    }
}