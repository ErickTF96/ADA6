#include <stdio.h>
#include <stdlib.h>
#include "complejo.h"

Complejo *creacionComplejo(double real, double imaginario){
    Complejo *nvo = (Complejo*) malloc(sizeof(Complejo));
    nvo -> real = real;
    nvo -> imaginario = imaginario;
    return nvo;
}
Complejo *suma(Complejo *c1, Complejo *c2){
    return creacionComplejo(c1 -> real + c2 -> real, c1 -> imaginario + c2 -> imaginario);
}

/*
Complejo *resta(Complejo *c1, Complejo *c2){
    
}
/*
Complejo *multiplicar(Complejo *, Complejo *){
    
}
*/
Complejo *dividir(Complejo *c1, Complejo *c2){
    double d = c2 -> real * c2 -> real + c2 -> imaginario * c2 -> imaginario;
    return creacionComplejo( (c1 -> real * c2 -> real + c1 -> imaginario * c2 -> imaginario)/d,
                            (c1 -> imaginario * c2 -> real - c1 -> real * c2 -> imaginario)/d);
}

void imprime(double c){
    printf("Resultado: %f\n", c);
}
void imprimeComp(Complejo *c){
    printf("%.2f%+.2fi\n", c->real, c->imaginario);
}

void imprimirC(Complejo *c){
    if(c->imaginario != 0){
        printf("%.3f%+.3fi\n", c->real, c->imaginario);
    }else{
        printf("%.3f\n", c->real);
    }
}
