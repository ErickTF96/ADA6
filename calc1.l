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
	printf("valor: %s\n",yytext);
	// printf("valor: %s\n",yylval.dval);
    char delimitador[] = "( + - i ) ";
    char *token = strtok(yytext, delimitador);
    if(token != NULL){
        while(token != NULL){
            // Sólo en la primera pasamos la cadena; en las siguientes pasamos NULL
            printf("Token: %s\n", token);
            token = strtok(NULL, delimitador);
        }
    }
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