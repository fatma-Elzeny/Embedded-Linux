#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>

int main() {
    const char *name = "/shared_buffer";
    const size_t SIZE = 4096;
    
    int shm_fd = shm_open(name, O_RDONLY, 0666);
     if (shm_fd == -1) {
        perror("shm_open");
        exit(EXIT_FAILURE);
    }
    void *shared_mem = mmap(0, SIZE, PROT_READ, MAP_SHARED, shm_fd, 0);
     if (shared_mem == MAP_FAILED) {
        perror("mmap");
        exit(EXIT_FAILURE);
    }
    
    printf("Message from shared memory: %s\n", (char *)shared_mem);
    return 0;
}

