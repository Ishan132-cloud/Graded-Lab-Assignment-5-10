#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <sys/wait.h>

void handle_sigterm(int sig) {
    printf("Parent received SIGTERM (signal %d)\n", sig);
}

void handle_sigint(int sig) {
    printf("Parent received SIGINT (signal %d). Exiting gracefully.\n", sig);
    exit(0);
}

int main() {
    pid_t pid1, pid2;

    signal(SIGTERM, handle_sigterm);
    signal(SIGINT, handle_sigint);

    pid1 = fork();
    if (pid1 == 0) {
        sleep(5);
        kill(getppid(), SIGTERM);
        exit(0);
    }

    pid2 = fork();
    if (pid2 == 0) {
        sleep(10);
        kill(getppid(), SIGINT);
        exit(0);
    }

    printf("Parent running indefinitely. PID = %d\n", getpid());

    while (1) {
        pause();
    }

    return 0;
}
