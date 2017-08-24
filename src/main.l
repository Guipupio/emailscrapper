%{
#include <string.h>
int total=0;
%}


POSSIVEIS_A_ESQUERDA [A-Za-z0-9\_\-\.]
CARACTERES_ESPECIAIS [^\_\-\.\ ]
POSSIVEIS_A_DIREITA [A-Za-z0-9\_.\-]*[A-Za-z0-9]

USUARIO {POSSIVEIS_A_ESQUERDA}+
DOMINIO {POSSIVEIS_A_DIREITA}

%%

[[:space:]] {
		total+=1;
}

[A-Za-z]* {
		total+=1;
}


[\!\-\@\.\,\ ] {
		total+=1;
}

{USUARIO}[^\_\-\.\ ][@]{DOMINIO}[\-][\ ] {
		total+=1;
}

{USUARIO}[^\_\-\.\ ][@]{DOMINIO} {
	printf ("%s\n", yytext);
}
 

%%

int main(){

 yylex();
 return 0;	

}
