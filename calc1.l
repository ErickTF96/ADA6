%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
%}

white           [ \t]+
digit           [0-9]
integer         {digit}+
complex			\({digit}+[+|-]{digit}+i\)

%%

{white}         { /* Ignoramos espacios en blanco */ }
"exit"|"quit"|"bye"    {printf("Terminando programa\n");exit(0);}
{integer} {
	yylval.dval=atof(yytext);
	return(NUMBER);
}

{complex} {
    typedef struct{
        double real, img;
    }complejo;

    double lista[10], a;
    int i=0;
    char delimitador[] = "( + - i ) ";
    char *token = strtok(yytext, delimitador);
    if(token != NULL){
        while(token != NULL){
            // Sólo en la primera pasamos la cadena; en las siguientes pasamos NULL
            printf("Token: %s\n", token);
            yylval.dval = atof(token);
            lista[i] = yylval.dval;
            // printf("lista: %f\n",lista[i]);
            token = strtok(NULL, delimitador);
            i++;
        }
    }
    complejo *nvo = (complejo*)malloc(sizeof(complejo));
    nvo->real = lista[0];
    nvo->img = lista[1];
    return nvo;
    // return lista[10];
	// printf("Token: %s\n", token);
}


"+"           return(PLUS);
"-"           return(MINUS);
"*"           return(TIMES);
"/"           return(DIVIDE);
"^"           return(POWER);
"("           return(LEFT_PARENTHESIS);
")"           return(RIGHT_PARENTHESIS);
"\n"          return(END);

%%