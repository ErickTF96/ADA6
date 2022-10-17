#include <stdio.h>
#include <stdlib.h>
#include "complejo.h"

Complejo *creacionComplejo(int real, int imaginario){
    Complejo *nvo(Complejo*) malloc(sizeof(Complejo));
    nvo -> real = real;
    nvo -> imaginario = imaginario;
    return nvo;
}
Complejo *suma(Complejo *, Complejo *){
    return creacionComplejo(c1 -> real + c2 -> real, c1 -> imaginario + c2 -> imaginario);
}

/*Complejo *resta(Complejo *, Complejo *){

}

Complejo *multiplicar(Complejo *, Complejo *){

}

Complejo *dividir(Complejo *, Complejo *){

}*/

