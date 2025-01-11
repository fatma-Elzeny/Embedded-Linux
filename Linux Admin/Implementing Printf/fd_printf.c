#include <stdarg.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#define BUFFER_SIZE 1024

int fd_printf(int fd, const char *format, ...) {
    char buffer[BUFFER_SIZE];
    va_list args;
    int written;

    // Start processing the variadic arguments
    va_start(args, format);
    // Format the string into the buffer
    int length = vsnprintf(buffer, BUFFER_SIZE, format, args);
    va_end(args);

    // Check if formatting was successful
    if (length < 0) {
        // Error occurred during formatting
        return -1;
    }

    // Write the formatted string to the provided file descriptor
    written = write(fd, buffer, length);
    if (written == -1) {
        // Error occurred during writing
        perror("write");
        return -1;
    }

    return written;
}

int main() {
    // Example usage: writing to standard output (fd = 1)
    fd_printf(1, "Hello, %s! The number is %d.\n", "world", 42);

    // Example usage: writing to standard error (fd = 2)
    fd_printf(2, "This is an error message: %s\n", strerror(errno));

    return 0;
}

