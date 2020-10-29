# BASH


# Variables
## Special Parameters
| Variable | Meaning |
|----------|---------|
| $\*	   | Positional parameters, starting from one. In double quotes expands to a single word. |
| $@	   | Positional parameters, starting from one. In double quotes each parameter expands to a separate word. |
| $#	   | The number of positional parameters |
| $?	   | Exit status of the most recently executed foreground pipeline |
| $-	   | Current option flags |
| $$	   | Process ID of the shell |
| $!	   | Process ID of the most recently executed background (asynchronous) command |
| $0	   | Name of the shell or shell script |
| $\_    | Last argument(s) to the previous command |

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
# The command has the form: SUB_STRING=${STRING:start:length}
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


# Conditionals
## Format of `If Then Else`
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
### Single vs Double Bracket
### Useful Conditionals
[TLDP list of conditionals](https://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html)


# Loops
## For Loops
```bash
for VAR in $LIST; do
    ...
done
```

## While Loops
```bash
while [[ CONDITION ]]; do
    ...
done
```

# Functions
```bash
function function_name = {
    ...
}

# OR
function_name () = {
    ...
}
```

## Function Arguments
Arguments can be passed to functions as follows:
```bash
function_name [ARG1 [ARG2 [...]]]
```
Arguments are accessed the same as in bash scripts:
* `$1` is the function name
* `$2` is the first argument
* `$3` is the second argument ...

## Exit vs Return from a Function
Using `return [INTEGER]` will stop function execution and will set `$?` in the parent shell.
Using `exit` will stop execution and close the parent shell.
