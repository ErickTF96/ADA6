#include <stdio.h>
#include <stdlib.h>
#include "complejo.h"

Complejo *creacionComplejo(int real, int imaginario){
    Complejo *nvo = (Complejo*) malloc(sizeof(Complejo));
    nvo -> real = real;
    nvo -> imaginario = imaginario;
    return nvo;
}
Complejo *suma(Complejo *c1, Complejo *c2){
    return creacionComplejo(c1 -> real + c2 -> real, c1 -> imaginario + c2 -> imaginario);
}

void imprime(double d){
    printf("Resultado: %f\n", d);
}

void imprimirC(Complejo *c){
    if (c->imaginario !=0){
        printf("%f%+fi\n", c->real, c->imaginario);
    }else{
        printf("Resultado: %f\n", c->real);
    }
    
}
// int main(){

//     complejo c1 = {4,3}, c2 = {4,-3};
//     printf("El numero complejo es: "); 
//     imprimirComplejo(c1);
//     printf("El numero complejo es: "); 
//     imprimirComplejo(c2);
//     printf("El resultado es: ");
//     imprimirComplejo(suma(c1,c2));
//     return 0;
// }