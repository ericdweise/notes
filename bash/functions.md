```bash
function function_name = {
    <commands>
}
```


## Calling Functions
```bash
function_name [ARG1[ ARG2[ ...]]]
```


## Arguments
Arguments operate the same as bash scripts: `$1` is the first argument, `$2` the second, etc.


## Ending Function Execution

### Return
Use `return` to stop function execution and set the exit code, `$?`.
```bash
function are_you_eric {
    if [ $1 == 'Eric' ]; then
        echo 'Yes, you are Eric'
        return 0
    else
        echo 'You are not Eric'
        return 1
    fi
}
```
Using the terminal the function will behave like this:
```bash
user@computer:~$ are_you_eric Eric
Yes, you are Eric
user@computer:~$ echo $?
0
user@computer:~$ are_you_eric Mathias
You are not Eric
user@computer:~$ echo $?
1
```

### Exit
Use `exit` to stop function execution, clear the execution shell, and set `$?` in the parent shell.
The difference between `exit` and `return` is that `exit` will terminate the shell in which the function is running.
Using a similar example to above:
```bash
function are_you_eric {
    if [ $1 == 'Eric' ]; then
        echo 'Yes, you are Eric'
        return 0
    else
        echo 'You are not Eric'
        exit 1
    fi
}
```
Using the terminal the function will behave like this:
```bash
user@computer:~$ are_you_eric Eric
Yes, you are Eric
user@computer:~$ are_you_eric Bob
# Shell (and terminal) close
```


## Accessing Variables
Setting variables inside a function will set them outside of the function
```bash
VAR1='variable one'
function func {
    VAR1='first variable'
    VAR2='second variable'
}
echo $VAR1  # 'variable one'
echo $VAR2  # ''
func
echo $VAR1  # 'first variable'
echo $VAR2  # 'second variable'
```


## Alternative Method for Defining Functions
```bash
function_name () = {
    <commands>
}
```
