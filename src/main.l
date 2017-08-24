%{
#include <string.h>

%}


POSSIVEIS_A_ESQUERDA [A-Za-z0-9_.-]
CARACTERES_ESPECIAIS [^_. -]
POSSIVEIS_A_DIREITA [A-Za-z0-9_.-]*[A-Za-z0-9]

USUARIO {POSSIVEIS_A_ESQUERDA}+
DOMINIO {POSSIVEIS_A_DIREITA}

%%

{USUARIO}[^_. -][@]{DOMINIO}[-][ ] ;

{USUARIO}[^_. -][@]{DOMINIO} {
	printf ("%s\n", yytext);
}
 
. ;
[[:space:]] ;

%%

int main(){

 yylex();
 return 0;	

}
