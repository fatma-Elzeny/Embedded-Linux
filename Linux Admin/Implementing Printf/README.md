## To implement a custom `printf` function that accepts a file descriptor, you can use the `write` system call to send the formatted output to the desired file descriptor.


### Explanation:
1. **Formatting with `vsnprintf`:**
   - The function formats the string using `vsnprintf` to safely handle variable arguments.
   - This ensures that the output string fits within the buffer.

2. **Writing with `write`:**
   - The `write` system call is used to send the formatted string to the given file descriptor.
   - It can handle standard output (`STDOUT_FILENO`), standard error (`STDERR_FILENO`), or any other valid file descriptor.

3. **Error Handling:**
   - If an error occurs during formatting or writing, the function returns `-1`.
   - For debugging, errors from `write` are printed using `perror`
