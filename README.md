So i began looking for some tutorial which would provide me with simple example of how i could compile python to compilable ".c" code.
I found example in [cython docs](http://docs.cython.org/src/userguide/external_C_code.html). Those examples weren't very helpful and weren't working.
So here it is:

## Step one: Dependencies

I presume that you have installed python and gcc already.
So additionally youll need 
```
sudo pip install cython
```

##Step two: Making your code compilable

As far as i know it is not possible to directly call your python function when compiling python code to c.
You must expose some functions to be cython valid.

```
def What_did_one_snowman_say_to_the_other_snowman():

	print "Smells like carrot !"



cdef public void hatch():

	What_did_one_snowman_say_to_the_other_snowman()
```

lets save this into `desmond.pyx` file

next we need to create some main for our program:

```
#include <Python.h>

#include "desmond.h"



int main() {

    Py_Initialize(); 

    initdesmond(); //initializes your module

    hatch();	//function call

    Py_Finalize(); 

}

```

I think it's pretty clear what's going on here.

Now the most esential part

##Compiling

```
all: main 



main: main.c 

	cython desmond.pyx 

	g++ -c desmond.c -fPIC -I/usr/include/python2.7/ -lpython2.7 

	g++ main.c -g -fPIC -I/usr/include/python2.7/ -lpython2.7 desmond.o



clean: 

	rm -rf *.o desmond.h desmond.c
```
this simple makefile allows you to compile all of this toghether, if you do not want compile it to be executable, just throw the last line `g++ main.c -g -fPIC -I/usr/include/python2.7/ -lpython2.7 desmond.o`


