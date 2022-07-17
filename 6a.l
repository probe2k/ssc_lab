%{
	#include <stdio.h>
	int sl = 0, ml = 0;
%}

%%
"/*"[a-zA-Z0-9' '\t\n]+"*/" ml++;
"//".* sl++;
%%

main() {
	yyin = fopen("f1.c", "r");
	yyout = fopen("f2.c", "w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	printf("Number of single line comments : %d\nNumber of multi line comments : %d", sl, ml);
}
