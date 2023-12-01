#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <io.h>
#include <fcntl.h>
#include <sys/types.h>

int main() {
    char filename[] = "Aladdin how many lines correct.txt";
    int fd;
    int fd2;
    int num = 0;
    char buffer[16];
    off_t pos = 0;

    fd = _open(filename, O_RDONLY);
    fd2 = _open("Aladdin_num.txt", O_RDWR | O_CREAT, 0775);
    _read(fd, buffer, 1);
    fd2 = _write(fd2, buffer, 1);
    fd = _lseek(fd, 1, SEEK_CUR);
    //}
    
    fd2 = _lseek(fd2, 0, SEEK_SET);
    buffer[0] = '1';
    fd2 = _write(fd2, buffer, 1);
    _close(fd);
    _close(fd2);

}