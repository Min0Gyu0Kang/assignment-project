CC = gcc
CFLAGS = -Wall -Wextra -g

# List of source files
SOURCES = main.c *.c

# List of header files
HEADERS = executable.h builtin_cmd.h

# Object files generated from source files
OBJECTS = $(SOURCES:.c=.o)

# Target executable
TARGET = pa2

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(TARGET)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGET)
