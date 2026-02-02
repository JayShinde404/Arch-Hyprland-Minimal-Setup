Tags: [[CS50]]


Color representation in Memory(RGB):
Uses the *0x000000*(black) hexadecimal format

The "**0x**" indicates that this is a hexadecimal number(base system 16) to deal with ambiguity for human reading.

Each pair of digits in {00}{00}{00}  represents Red, Blue and Green(RGB) and their amount/concentration respectively.

A total color representation for a pixel takes 3 bytes.(1 byte for 2 digit hex numbers)




## Pointers
'&/Ampersand' => "Address of" Operator | e.g.&d => Address of 'd'
'Asterisk => "Dereference" Operator | helps to go to an Address in Memory.
Example Code:

```
#include <stdio.h>

int main(void)
{
  int n = 50;
  int *p = &n;
  printf("%p\n", p); //pointers are called using %p
  return 0;
}
```
