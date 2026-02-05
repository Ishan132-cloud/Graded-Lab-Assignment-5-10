This script accepts a directory path as an argument and creates a backup subdirectory inside it.

Each file in the directory is moved to the backup folder using a background process (&).
For every move operation, the script prints the Process ID (PID) of the background job using $!.

The wait command is used to ensure the parent script waits until all background processes complete before exiting.
