%{
#include "y.tab.h"
#include "complejo.c"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
%}

white           [ \t]+
digit           [0-9]
integer         {digit}+
complex			\(([\-]{integer}|{integer})[+|-]{integer}\i\)

%%

{white}         { /* Ignoramos espacios en blanco */ }
"exit"|"quit"|"bye"    {printf("Terminando programa\n");exit(0);}
{integer} {
	yylval.dval=atof(yytext);
	return(NUMBER);
}

{complex} {
	
    double lista[5];
    int i = 0;
 
    char delimitador[] = "( + - i )";
    char *token = strtok(yytext, delimitador);
    if(token != NULL){
        while(token != NULL){
            yylval.dval = atof(token);
            lista[i] = yylval.dval;
            token = strtok(NULL, delimitador);
            i++;
        }
    }
    yylval.cval = creacionComplejo(lista[0], lista[1]);
    return (CNUMBER);
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