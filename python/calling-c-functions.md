A procedure for calling C functions from Python

0. Create the C code, `CODE.c`, and the header, `CODE.h`, files
1. Compile C code. This can be done two ways:
    * Compile `.o` then compile the shared object, `.so`, file:
        ```bash
        gcc -c -fPIC CODE_FILE.c -o CODE_FILE.o && \
        gcc CODE_FILE.o -shared -o SHARED_OBJECT.so
        ```
    * Compile only the shared object, `.so`, file:
        ```bash
        gcc -shared -o SHARED_OBJECT.so -fPIC CODE_FILE.c
        ```
2. Import `ctypes` in python:
    ```python
    from ctypes import *
    ```
3. Import the C function from the shared object file:
    ```python
    C_FUNCTIONS = CDLL('./SHARED_OBJECT.so')
    ```
4. Calling functions within python:
    ```python
    C_FUNCTIONS.functionName(arg1, arg2, ...)
    ```
        
