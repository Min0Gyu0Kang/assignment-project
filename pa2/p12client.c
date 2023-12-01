#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

#define MAXLINE 80
#define MAX_USER 10

int main(int argc, char *argv[])
{
    ssize_t num_bytes;
    int connected_fd;
    struct hostent *host_entry;
    struct sockaddr_in socket_address;
    char buffer[MAXLINE];
    char name[MAX_USER][11];
    int num_users = 0;

    if (argc < 3)
    {
        printf("Received %d arguments. Please enter host address and port number!\n", argc - 1);
        exit(1);
    }

    char *host = argv[1];
    uint16_t port = (uint16_t)strtol(argv[2], NULL, 10);

    if ((connected_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
    {
        printf("socket() failed.\n");
        exit(2);
    }

    if ((host_entry = gethostbyname(host)) == NULL)
    {
        printf("invalid hostname %s\n", host);
        exit(3);
    }

    memset((char *)&socket_address, 0, sizeof(socket_address));
    socket_address.sin_family = AF_INET;
    memcpy((char *)&socket_address.sin_addr.s_addr, (char *)host_entry->h_addr, (size_t)host_entry->h_length);
    socket_address.sin_port = htons(port);

    if (connect(connected_fd, (struct sockaddr *)&socket_address, sizeof(socket_address)) < 0)
    {
        printf("connect() failed.\n");
        exit(4);
    }

    // Get the client's name
    printf("Enter your name: ");
    fgets(name[num_users], sizeof(name[num_users]), stdin);
    name[num_users][strcspn(name[num_users], "\n")] = '\0';

    // Send the name to the server
    if (send(connected_fd, name[num_users], strlen(name[num_users]), 0) < 0)
    {
        perror("Send failed");
        exit(EXIT_FAILURE);
    }
    num_users++;

    while ((num_bytes = read(STDIN_FILENO, buffer, MAXLINE)) > 0)
    {
        // Check if the user wants to quit
        if (strncmp(buffer, "quit", 4) == 0)
        {
            printf("%s leaved. %d current user(s)\n", name[num_users - 1], num_users - 1);
            num_users--;
            break;
        }

        printf("%s joined. %d current user(s)\n", name[num_users], num_users);

        write(connected_fd, buffer, (size_t)num_bytes);
        num_bytes = read(connected_fd, buffer, MAXLINE);
        write(STDOUT_FILENO, buffer, (size_t)num_bytes);
    }

    close(connected_fd);

    return 0;
}
