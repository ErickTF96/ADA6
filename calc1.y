%{

#include <math.h>
#include <stdlib.h>

#include <stdio.h>
#define YYSTYPE ComplejoAP
int yylex();
void yyerror(char *s) {
 printf("%s\n",s);
}

%}

//tipo de atributo de los tokens.
%union{
double dval;
}

%token  <dval> NUMBER
%token  PLUS    MINUS   TIMES   DIVIDE  POWER
%token  LEFT_PARENTHESIS        RIGHT_PARENTHESIS
%token  END


%left   PLUS    MINUS
%left   TIMES   DIVIDE
%left   NEG
%right  POWER

%type <dval> Expression
//%type <cval> exp
%start Input

%%

Input:    Line
| Input Line
;

Line:    END
| Expression END                { printf("Result: %f\n",$1); }
;


Expression:    NUMBER                        { $$=$1; }

| Expression PLUS Expression    { $$ = $1+$3; }
| Expression MINUS Expression   { $$=$1-$3; }
| Expression TIMES Expression   { $$=$1*$3; }
| Expression DIVIDE Expression  { $$=$1/$3; }
| MINUS Expression %prec NEG    { $$=-$2; }
| Expression POWER Expression   { $$=pow($1,$3); }
| LEFT_PARENTHESIS Expression RIGHT_PARENTHESIS { $$=$2; }
;


%%

int main(void) {
    yyparse();
}
int yywrap(){
    return 1;
}

 