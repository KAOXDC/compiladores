%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+ 	{yylval.numero=atoi(yytext);return(NUM);};
"\t"	return('\t');
"\n"	;
.	{printf("error lexico");};
%%
