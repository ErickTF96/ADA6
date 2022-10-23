%{
#include "y.tab.h"
#include "complejo.c"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void RmWs(char* str);
%}

white           [ \t]+
digit           [0-9]
integer         {digit}+
complex			\([-]*{integer}[+|-]{integer}\i\)

%%

{white}         { /* Ignoramos espacios en blanco */ }
"exit"|"quit"|"bye"    {printf("Terminando programa\n");exit(0);}
{integer} {
	yylval.dval=atof(yytext);
	return(NUMBER);
}

{complex} {

    double lista[5];
    int i = 0, count = 0, j = 0;

    char delimitador[] = "( + i )";
    char delimitador2[] = " - ";
    char *token = strtok(yytext, delimitador);
    int largo = strlen(yytext);
    for(int k = 0; k < largo; k++){
        if(yytext[k] == '-'){
            count = k-1;
            j++;
        }
    }
    if(token != NULL){
        while(token != NULL){
            if (j == 2){
                token = strtok(token, delimitador2);
                while(token != NULL){
                    yylval.dval = atof(token);
                    lista[i] = yylval.dval*-1;
                    token = strtok(NULL, delimitador);
                    i++;
                }
            }else if(j == 1 && count == 0){
                while(token != NULL){
                    yylval.dval = atof(token);
                    lista[i] = yylval.dval;
                    token = strtok(NULL, delimitador);
                    i++;
                }
            }else if (token[i+count] == '-'){
                token = strtok(token, delimitador2);
                while(token != NULL){
                    yylval.dval = atof(token);
                    lista[i] = yylval.dval;
                    token = strtok(NULL, delimitador);
                    i++;
                }
                lista[1] = lista[1]*-1;
            }
            else{
                while(token != NULL){
                    yylval.dval = atof(token);
                    lista[i] = yylval.dval;
                    token = strtok(NULL, delimitador);
                    i++;
                }
            }
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