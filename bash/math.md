# Math in Bash

It is important to remember that every variable in Bash is a string.
To do math you need to surround the equations with `$((` and `))`.
Otherwise, operations like `+` will keep their string behavior, in this case, concatenation.

```bash
i=0
while [[ $i -lt 5 ]]; do
    i=$((i+1))
    echo "$i"
done
````
