all: main 

main: main.c 
	cython desmond.pyx 
	g++ -c desmond.c -fPIC -I/usr/include/python2.7/ -lpython2.7 
	g++ main.c -g -fPIC -I/usr/include/python2.7/ -lpython2.7 desmond.o

clean: 
	rm -rf *.o desmond.h desmond.c