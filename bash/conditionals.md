# Bash Conditionals



## If Then Else
```bash
if [[ CONDITION ]]; then
    COMMANDS
elif [[ CONDITION ]]; then
    COMMANDS
else
    COMMANDS
fi
```



## Boolean Expressions
Also called "Test Commands" or "Primaries"

### Form
```bash
[ EXPRESSION ]
 OR
[[ EXPRESSION ]]
```

Notes:

- It is important to include spaces between the brackets (`[`, `]`, `[[`, and `]]`) and the `EXPRESSION`.

### Negating Boolean Expressions
```bash
if ! [[ EXPRESSION ]]; then
    # If EXPRESSION evaluates to False, the commands here will execute
fi
```

### Single vs Double Bracket
There are two different bracket types that be used to evaluate a Boolean expression, `[ EXPRESSION ]` and ``[[ EXPRESSION ]]``. While these can be used interchangeably, they handle `EXPRESSION` differently. The reason for this is historical. the single bracket, `[` was developed in the Thompson shell, and is more limited than the double bracket, `[[`, operator. The double bracket was introduced in the Korn shell and adopted by others (including Bash). It is an extension of the `[` operator, and adds functions like pattern matching.

The general rules I follow are:

- Use single brackets, `[`, when you are writing scripts that might be used on older systems, or needs to be run by a variety of shells.
- When you use single brackets always quote your variables: `[ -n "$VARIABLE" ]`, (not `[ -n $VARIABLE ]` .)

### Useful Conditionals
[TLDP list of conditionals](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html)

### Primaries acting on Integer Variables

| Primary              | Evaluates to                                          |
|----------------------|-------------------------------------------------------|
| `[ ARG1 -eq ARG2 ]`  | True if `ARG1` is **equal to** `ARG2`                 |
| `[ ARG1 -ne ARG2 ]`  | True if `ARG1` is **not equal to** `ARG2`             |
| `[ ARG1 -lt ARG2 ]`  | True if `ARG1` is **strictly less than** `ARG2`       |
| `[ ARG1 -le ARG2 ]`  | True if `ARG1` is **less than or equal to** `ARG2`    |
| `[ ARG1 -gt ARG2 ]`  | True if `ARG1` is **strictly greater than** `ARG2`    |
| `[ ARG1 -ge ARG2 ]`  | True if `ARG1` is **greater than or equal to** `ARG2` |

### Primaries on String Variables

| Primary              | Evaluates to                                          |
|----------------------|-------------------------------------------------------|
| `[ -z STRING ]`      | True of the length if `STRING` is zero.               |
| `[ -n STRING ]`      | True if the length of `STRING` is non-zero.           |
| `[ STRING ]`         | Same as above.                                        |
| `[ STR1 == STR2 ]`   | True if the strings are equal.                        |
| `[ STR1 = STR2 ]`    | Same as above but is stritly POSIX compliant.         |
| `[ STR1 != STR2 ]`   | True if the strings are not equal.                    |
| `[ STR1 '<' STR2 ]`  | True if `STR1` sorts before `STR2` lexicographically. |
| `[ STR1 '>' STR2 ]`  | True if `STR1` sorts after `STR2` lexicographically.  |
| `[ -o OPTIONNAME ]`  | True if shell option `OPTIONNAME` is enabled.         |

### Primaries acting on files

| Primary               | Evaluates to                                                           |
|-----------------------|------------------------------------------------------------------------|
| `[ -a FILE ]`         | True if `FILE` exists                                                  |
| `[ -e FILE ]`         | True if `FILE` exists                                                  |
| `[ -f FILE ]`         | True if `FILE` exists and is a regular file                            |
| `[ -d FILE ]`         | True if `FILE` exists and is a directory                               |
| `[ -L FILE ]`         | True if `FILE` exists and is a symbolic link                           |
| `[ -h FILE ]`         | True if `FILE` exists and is a symbolic link                           |
| `[ -p FILE ]`         | True if `FILE` exists and is a named pipe (FIFO)                       |
| `[ -S FILE ]`         | True if `FILE` exists and is a socket                                  |
| `[ -s FILE ]`         | True if `FILE` exists and has a size greater than zero                 |
| `[ -b FILE ]`         | True if `FILE` exists and is a block-special file                      |
| `[ -c FILE ]`         | True if `FILE` exists and is a character-special file                  |
| `[ -r FILE ]`         | True if `FILE` exists and is readable                                  |
| `[ -w FILE ]`         | True if `FILE` exists and is writable                                  |
| `[ -x FILE ]`         | True if `FILE` exists and is executable                                |
| `[ -u FILE ]`         | True if `FILE` exists and its SUID (set user ID) bit is set            |
| `[ -g FILE ]`         | True if `FILE` exists and its SGID bit is set                          |
| `[ -k FILE ]`         | True if `FILE` exists and its sticky bit is set                        |
| `[ -O FILE ]`         | True if `FILE` exists and is owned by the effective user ID            |
| `[ -G FILE ]`         | True if `FILE` exists and is owned by the effective group ID           |
| `[ -t FD ]`           | True if file descriptor `FD` is open and refers to a terminal          |
| `[ -N FILE ]`         | True if `FILE` exists and has been modified since it was last read     |
| `[ FILE1 -nt FILE2 ]` | True if `FILE1` has been changed more recently than `FILE2`            |
| `[ FILE1 -ot FILE2 ]` | True if `FILE1` is older than `FILE2`                                  |
| `[ FILE1 -ef FILE2 ]` | True if `FILE1` and `FILE2` refer to the same device and inode numbers |
