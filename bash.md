# BASH

# Conditionals
[TLDP list of conditional commands](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html)


# Templates
## Functions
```bash
function function_name = {
    ...
}

# OR
function_name () = {
    ...
}
```

### Arguments
Arguments can be passed to functions as follows:
```bash
function_name [ARG1 [ARG2 [...]]]
```
Arguments are accessed the same as in bash scripts:
* `$1` is the function name
* `$2` is the first argument
* `$3` is the second argument ...

### Exit vs Return
Using `return [INTEGER]` will stop function execution and will set `$?` in the parent shell.
Using `exit` will stop execution and close the parent shell.


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
