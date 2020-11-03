# Programming in C

## Pointers
A variable that points to an address in memory.

### Basics
Pointers can be initialized outright or created for an existing variable.
```c
char var1 = "Hello";
pointer1 = *char1;

char *pointer2 = "Hello"
```
Then, the following will print the same output:
```c
printf("%s", var1);
printf("%s", pointer1);
printf("%s", pointer2);
```


### Pointers in C++
Since memory is deleted at the end of an objects life, you need to be careful
passing values to pointers in C++. For example,
