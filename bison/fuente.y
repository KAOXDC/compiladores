%{
#include<stdio.h>
//imprimir(int q,int w);
int ic1=0,x,r1=0,aux=0,i=0,a,b,c,d,vec[10];
%}

%union {int numero;}

%start entrada;
%token <numero> NUM

%type <numero> entrada
%type <numero> expnum
%type <numero> NUMK

%left '\t'
%%
entrada	:	expnum 	 		{};
		|entrada expnum 
;
expnum	: 	NUMK			{printf("\n");
					} 
;
NUMK	:	NUMK '\t''\t' NUMK	{printf("%d\t\t%d\t\t%d\t\t%d\t\t",a,b,c,d);}
		|NUM			{$$=$1; 
					x=$1;
					r1=x-aux;
					if(r1<0){r1=r1*(-1);}
					if(i==0){a=x;c=r1; i=1;}
					else if(i==1){b=x;d=r1; i=0;}
		 			aux=ic1; 
					ic1=x;}
;
%%
int yyerror(char * s){
printf("\n error de sintasis %s\n",s);
return 0;
}

int main(){
/************************************************************************
* Toma de datos Data Size y Timestamp y hace la diferencia de tamaño 	*
* de paquetes de datos y la diferencia de tiempo que hay entre linea 	*
* y linea generando una lista de 4 columnas con los siguientes datos.	*
*									*
* Presentado por Diego Prado--Ingenieria de Sistemas Noc. compiladores 	*
* analizador lexico y analizador sintactico (Flex y Bison)	 	*
* Fundacion Universitaria de Popayan					*
************************************************************************/
printf("_______________________________________________________________\n");
printf("Data Size\tTimestamp\tResta DataSize\tResta timestamp\n");
printf("_______________________________________________________________\n");

yyparse();
return 0;
}



