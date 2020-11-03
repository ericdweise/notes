# GCC - GNU Compiler Collection


## Basic Compilation
```bash
gcc FILENAME.c -Wall -o OUTPUT_FILE
```

## Useful Options
`-Wall` -- Print all compiler warnings
`-o` -- Change the output file


## External Libraries
When you have to include headers from other projects using `#include <>` gcc will search for these header files (`.h`) and shared object files (`.so`).
When compiling you need to tell GCC to include these files as well.

### Using External Libraries
The skinny: Use `-l` to include libraries in an external 
```bash
gcc FILENAME.c -l<lib-name>
```

#### NOTES
- Order is important. `-l<lib-name>` has to come after `FILENAME.c`
- No space between `-l` and `<lib-name>`
- Example: To include `libmyfunctions.so` use `-lmyfunctions`

### Linked Object Directory.
The skinny: Use `-L` to add a directory with an external `.so` file
```bash
gcc FILENAME.c -L/home/user/lib/ -l<lib-name>
```

GCC knows where to look for external libraries.
Usually developers know put these libraries where GCC can find them, e.g. `/usr/lib`.
However, not all libraries are stored where GCC can find them.
In this case you need to add the directory with your shared object to GCC's search path using `-L`
