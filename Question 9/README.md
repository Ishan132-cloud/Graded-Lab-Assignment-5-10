
This program demonstrates zombie process prevention in Linux.

The parent process creates multiple child processes using fork(). Each child prints its PID, sleeps briefly, and exits.

The parent uses wait() in a loop to collect all terminated child processes. This ensures that no child process remains in a zombie state.

The output confirms that every child process is properly cleaned up before the parent exits.
