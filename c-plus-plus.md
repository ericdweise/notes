# Operators

## Scope Resolution Operator (`::`)
Can be used to define a function outside of a class.
```c
# include<iostream>
using namespace std;
class Example {
    int num;
    public:
    Example() {
        num = 10;
    }
    void display();
};
void Example::display() {
   cout << "The value of num is: " << num;
}

int main() {
    Example obj;
    obj.display();
    return 0;
}
```
gives the output
```
The value of num is: 10
```

Also can be used to access a global variable when there is a local variable with the same name
```c
#include<iostream>
using namespace std;
int num = 7;
ing main() {
    ing num = 3;
    cout << "Local Variable:  " << num << endl;
    cout << "Global variable: " << ::num << endl;
    return 0;
}
```
