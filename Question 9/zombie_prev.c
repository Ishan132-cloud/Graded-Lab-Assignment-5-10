#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    int i;
    pid_t pid;

    for (i = 0; i < 3; i++) {
        pid = fork();

        if (pid == 0) {
            printf("Child process created. PID = %d\n", getpid());
            sleep(2);
            exit(0);
        }
    }

    while ((pid = wait(NULL)) > 0) {
        printf("Parent cleaned up child with PID = %d\n", pid);
    }

    printf("All child processes cleaned. No zombies remain.\n");
    return 0;
}
