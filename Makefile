all: calc1 clean

calc1: lex.yy.c y.tab.c y.tab.h
	cc -std=c99 -o calc1 lex.yy.c y.tab.c -ll -ly
lex.yy.c:	calc1.l
	flex calc1.l
y.tab.c: calc1.y	
	yacc -d calc1.y
y.tab.h: calc1.y
	yacc -d calc2.y
clean:
	rm *.o