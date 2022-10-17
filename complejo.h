#include <string.h>

struct complejo{
    double real, imaginario;

};

typedef struct complejo Complejo;
typedef struct complejo *Complejo;

Complejo *creacionComplejo(int real, int imaginario);
Complejo *suma(Complejo *, Complejo *);
Complejo *resta(Complejo *, Complejo *);
Complejo *multiplicar(Complejo *, Complejo *);
Complejo *dividir(Complejo *, Complejo *);

void imprimir(Complejo *c);

#define YYSTYPE ComplejoAP

