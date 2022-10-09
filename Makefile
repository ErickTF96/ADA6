all: hola clean

hola: prueba.o
	gcc -o hola prueba.o
prueba.o: prueba.c
	gcc -c prueba.c 
clean:
	rm *.o