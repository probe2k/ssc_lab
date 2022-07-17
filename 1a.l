%{
	#include <stdio.h>
	int v = 0, op = 0, id = 0, flag = 0;
%}

%%
[0-9][0-9]* { id++; printf("\nIdentifier : "); ECHO; }
[+-*/] { op++; printf("\nOperator : "); ECHO; }
"(" { v++; }
")" { v--; }
";" { flag = 1; }
.|\n { return 0; }
%%

int main() {
	yylex();
	if ((op + 1) == id && v == 0 && flag == 0)
		printf("Valid");
	else
		printf("Invalid");
}
