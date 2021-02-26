# Bash Variables




## Special Parameters
| Variable | Meaning                                                                    |
|----------|----------------------------------------------------------------------------|
| `$*`     | Positional parameters. Expands to a single word with spaces.               |
| `$@`     | Positional parameters. Expands to separate words.                          |
| `$#`     | The number of positional parameters                                        |
| `$?`     | Exit status of the most recently executed foreground pipeline              |
| `$-`     | Current option flags                                                       |
| `$$`     | Process ID of the shell                                                    |
| `$!`     | Process ID of the most recently executed background (asynchronous) command |
| `$0`     | Name of the shell or shell script                                          |
| `$_`     | Last argument(s) to the previous command                                   |

[source: TLDP](https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html)




## String Manipulation
### String Length
```bash
LENGTH=$((${#STRING}-1))
```

Notes:

- Only works in BASH and its derivatives.
- `STRING` must be a variable that is prepended by an octothorpe (`#`), not a dollar sign (`$`)

### Substrings
```bash
 The command has the form: SUB_STRING=${STRING:start:length}
STRING='Hello World'

SUBSTR=${STRING:0:5}
echo $SUBSTR   # prints 'Hello'

SUBSTR=${STRING:3:5}
echo $SUBSTR   # prints 'lo Wo'

SUBSTR=${STRING:6:-1}
echo $SUBSTR   # prints 'Worl'
```
Notes:

- `STRING` must be a variable. It is NOT prepended by a dollar sign (`$`)
- The index of the first element is `0`
- Values of the last element, `length`, can be negative. This is how many elements to be ignored at the end of `STRING`
