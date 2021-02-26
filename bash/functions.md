# Bash Functions

```bash
function FUNCTION_NAME = {
    ...
}

 OR
FUNCTION_NAME () = {
    ...
}
```




## Function Arguments
Arguments can be passed to functions as follows:
```bash
FUNCTION_NAME [ARG1 [ARG2 [...]]]
```
Arguments are accessed the same as in bash scripts:

* `$1` is the function name
* `$2` is the first argument
* `$3` is the second argument ...




## Exit vs Return from a Function

- Using `return [INTEGER]` will stop function execution and will set `$?` in the parent shell.
- Using `exit` will stop execution and close the parent shell.
