#include <Python.h>
#include "desmond.h"

int main() {
    Py_Initialize(); 
    initdesmond(); //initializes your module
    hatch();	//function call
    Py_Finalize(); 
}
