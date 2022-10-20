typedef union{
    double dval;
    void *cval;
} YYSTYPE;
#define	NUMBER	257
#define	CNUMBER	258
#define	PLUS	259
#define	MINUS	260
#define	TIMES	261
#define	DIVIDE	262
#define	POWER	263
#define	LEFT_PARENTHESIS	264
#define	RIGHT_PARENTHESIS	265
#define	END	266
#define	NEG	267


extern YYSTYPE yylval;
