%{
	#include <stdio.h>
	#include "y.tab.h"
	int yylval;
%}

%%
[0-9][0-9]* { yylval = atoi(yytext); return ID; }
[+-*/] { return yytext[0]; }
. {;}
\n { return 0; }
%%
