
This program demonstrates signal handling in Linux using C.
The parent process runs indefinitely and installs handlers for SIGTERM and SIGINT. One child process sends SIGTERM to the parent after 5 seconds, which is handled without terminating the program. Another child sends SIGINT after 10 seconds, which is handled by printing a message and exiting gracefully.
