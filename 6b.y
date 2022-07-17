%{
	#include <stdio.h>
	#include <stdlib.h>
	int id = 0, dig = 0, key = 0, op = 0;
%}

%token ID DIGIT KEY OP

%%
input:
	DIGIT input { dig++; }
	| ID input { id++; }
	| KEY input { key++; }
	| OP input { op++; };
%%

#include <stdio.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;

main() {
	FILE *file = fopen("f2.c", "r");
	yyin = myfile;
	do {
		yyparse();
	} while (!feof(yyin));

	printf("numbers = %d\nkeywords = %d\nidentifiers = %d\noperators = %d\n", dig, key, id, op);
}

void yyerror() {
	printf("Error parsing");
	exit(0);
}
