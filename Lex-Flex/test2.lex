%option yylineno
%option noyywrap

%{
  #include <stdio.h>
  #include <stdlib.h>
  int aux=0, v=0, a=0, i;
  void imprimir();
%}
%%

"Audio Tag" 			{v=1;}
"Video Tag" 			{a=2;}
"Type: Audio Tag ""("[0-9]*")" 	{aux=2;}
"Type: Video Tag ""("[0-9]*")" 	{aux=1;}
"Data size: "[0-9]+		{if (aux==v)imprimir();}
"Timestamp: "[0-9]+		{if (aux==v){printf("\t\t"); imprimir();printf("\n");}}
	
.	{}
\n 	{}

%%
void main()
{
  printf("Toma de datos Data Size y Timestamp de las etiquetas de Video del archivo Video6.pcap\n");
printf("presentado por Diego Prado\nIngenieria de Sistemas Noc. compiladores analizador lexico\nFundacion Universitaria de Popayan\n\n");
  printf("\n_________________________\nData Size\tTimestamp\n_________________________\n");
  yylex();
  printf("FIN DEL PROCESO\n");

}
void imprimir()
{
for(i=11;i<=yyleng-1;i++)
printf("%c",yytext[i]);
}
