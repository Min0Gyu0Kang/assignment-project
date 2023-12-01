#include <sys/select.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <arpa/inet.h>

#define MAXLINE 80
#define MAX_NAME_LENGTH 10
int main(int argc, char *argv[])
{
    ssize_t num_bytes;
    size_t connected_address_length;
    int connected_fd, listening_fd;
    struct sockaddr_in socket_address, connected_address;
    char buffer[MAXLINE];
    char client_name[MAX_NAME_LENGTH + 1][11];
    int i = 0;
    if (argc < 2)
    {
        printf("Received %d arguments. Please enter port number!\n", argc - 1);
        exit(1);
    }

    uint16_t port = (uint16_t)strtoul(argv[1], NULL, 10);

    if ((listening_fd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
    {
        printf("socket() failed.\n");
        exit(2);
    }

    memset((char *)&socket_address, 0, sizeof(socket_address));
    socket_address.sin_family = AF_INET;
    socket_address.sin_addr.s_addr = htonl(INADDR_ANY);
    socket_address.sin_port = htons(port);
    if (bind(listening_fd, (struct sockaddr *)&socket_address, sizeof(socket_address)) < 0)
    {
        printf("bind() failed.\n");
        exit(3);
    }

    if (listen(listening_fd, 5) < 0)
    {
        printf("listen() failed.\n");
        exit(4);
    }

    fd_set read_set, copy_set;
    FD_ZERO(&read_set); /* initialize socket set */
    FD_SET(listening_fd, &read_set);
    int fd_max = listening_fd, fd_num;

    while (1)
    {
        copy_set = read_set;

        if ((fd_num = select(fd_max + 1, &copy_set, NULL, NULL, NULL)) < 0)
        {
            printf("select() failed.\n");
            exit(5);
        }

        if (fd_num == 0)
        {
            printf("Time out.\n");
            continue;
        }

        for (int fd = 0; fd < fd_max + 1; fd++)
        {
            if (FD_ISSET(fd, &copy_set))
            {
                // Store the client's name in a variable or process it as needed

                client_name[i][strcspn(client_name[i], "\n")] = '\0';
                if (fd == listening_fd)
                {
                    connected_address_length = sizeof(connected_address);
                    if ((connected_fd = accept(listening_fd, (struct sockaddr *)&connected_address, (socklen_t *)&connected_address_length)) < 0)
                    {
                        printf("accept() failed.\n");
                        continue;
                    }
                    FD_SET(connected_fd, &read_set);
                    if (fd_max < connected_fd)
                        fd_max = connected_fd;
                }
                else
                {
                    // Send the name to the server
                    if (recv(listening_fd, buffer, strlen(buffer), 0) < 0)
                    {
                        perror("receive failed");
                        exit(EXIT_FAILURE);
                    }
                    // Send the name to the server
                    if (send(listening_fd, buffer, strlen(buffer), 0) < 0)
                    {
                        perror("Send failed");
                        exit(EXIT_FAILURE);
                    }
                    if ((num_bytes = read(listening_fd, buffer, MAXLINE)) > 0)
                    {
                        printf("Received %lu bytes from user %s.\n", num_bytes, listening_fd);

                        // Send the message to other clients
                        for (int other_fd = 0; other_fd < fd_max + 1; other_fd++)
                        {
                            if (FD_ISSET(other_fd, &read_set) && other_fd != listening_fd && other_fd != fd)
                            {
                                write(other_fd, buffer, (size_t)num_bytes);
                            }
                        }
                    }
                    else
                    {
                        FD_CLR(fd, &read_set);

                        close(fd);
                    }
                }
            }
        }
    }
    return 0;
}
