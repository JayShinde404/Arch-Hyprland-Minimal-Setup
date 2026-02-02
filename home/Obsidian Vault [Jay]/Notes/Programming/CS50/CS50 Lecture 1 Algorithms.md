Tags: [[CS50]]

Running time notations -> Asymptotic Notations

# STRING COMPARE
strlen/strcmp function -> <string.h> 
strcmp(s1,s2): compares strings ASCIIbetically and returns
1. 0 if s1 ans s2 are entirely identical
2. >0 if s1 comes after s2
3. <0 if s1 comes before s2  


## Struct
[Example Syntax] 
```
typedef struct{
    string name;
    string number;
}
person;
```

We can then call it using something like:
`person people[]`
and then assign inner values to it like as follows below;
```
people[0].name = "Jay";
people[0].number = "+91-797-233-1128";
```



## Sorting Algorithms:
    1. Bubble Sort
    2. Selection Sort
    3. Merge Sort

### Bubble Sort: 
Compare 2 values and keep swapping them from left to right(will get fixed sorted places in the right side/end, thus usually sorting [largest values] first in a typical example)]

### Selection Sort: 
Compare all values of the array first, and then keep the 1st smallest in the 1st spot, and move on again to the 2nd and so forth
### Merge Sort: 
Recursively (take the list and split it into 2 parts(halves) and when combining the halves, compare the 2 values of the halves and then sort them one by one(while taking out the lowest of the sorted halves out) until you get a completely sorted array).


## Recursion: 
The function is called in itself.
If the function is recalled/re-executed before it fully executes, it will begin to stack, and when the recursion stacking stops, the latest recursion will execute first and then move out to the rest systematically.


