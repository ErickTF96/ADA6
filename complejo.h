#include <string.h>

struct complejo{
    double real, imaginario;

};

typedef struct complejo Complejo;
typedef struct complejo *Complejo;

Complejo *creacionComplejo(int real, int imaginario);
complejo *suma(complejo *, Complejo *);
complejo *resta(complejo *, Complejo *);
complejo *multiplicar(complejo *, Complejo *);
complejo *dividir(complejo *, Complejo *);

void imprimir(Complejo *c);

#define YYSTYPE ComplejoAP

