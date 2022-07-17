%{
	#include <stdio.h>
	#include <stdlib.h>
%}

%token A B

%%
input:s'\n' { printf("Success"); exit(0); }
s: A s1 B | B
s1: ; | A s1
%%

main() {
	yyparse();
}

int yyerror() {
	printf("Error");
	exit(0);
}
