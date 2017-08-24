Skip to content
This repository
Search
Pull requests
Issues
Marketplace
Explore
 @Guipupio
 Sign out
 Watch 1
  Star 1
  Fork 23 EAxxx/emailscrapper
 Code  Issues 0  Pull requests 0  Projects 0  Wiki Insights 
Branch: master Find file Copy pathemailscrapper/test.sh
066c608  4 days ago
@tiagoft tiagoft Script de teste foi corrigido
1 contributor
RawBlameHistory    
67 lines (52 sloc)  1.58 KB
# Script para testes de unidade automaticos

# Configuracao: escolhe se o programa retonara mensagens teste-a-teste
verbose=$2

# A primeira linha indica que o script foi inicializado corretamente
if [ $verbose -eq 1 ]; then
  echo "Testando $1"
fi;

# A variavl dirtestes indica onde os arquivos teste (.in e .out) estao
dirtestes=./tests

# Essas variaveis de contagem devem ser inicializadas com zero
ntestes=0
npassou=0
program=$1

# Expressao do SED que significa: substituir .in por .out
sedexpression='s/\.in/\.out/'

# tests sera inicializada com o resultado da expressao find,
# encontrando todos os arquivos .in do diretorio dirtestes
tests=`find $dirtestes -name '*.in'`

# Para cada teste...
for t in $tests
do
  # Adiciona 1 no contador de testes
  ntestes=`echo $ntestes + 1 | bc`

  # Encontra o nome do arquivo relacionado a saida do teste
  o=`echo $t | sed $sedexpression`

  # Executa o programa que foi compilado usando o arquivo de teste.in como
  # entrada
  $program < $t > ./$$.out

  # Verifica se a diferenca entre a saida encontrada e a saida desejada
  # eh uma string de comprimento nao-zero
  d=`cat ./$$.out | diff  $o -`
  rm $$.out
  if [ -n "$d" ]; then
    if [ $verbose -eq 1 ]; then
      echo "Teste: $t - Falhou"
    fi
  else
    if [ $verbose -eq 1 ]; then
      echo "Teste $t - OK!"
    fi
    npassou=`echo $npassou + 1 | bc`
  fi
done

indice=`echo "(100.0 * $npassou) / $ntestes" | bc`

if [ $verbose -eq 1 ]; then
  echo "Total de testes: $ntestes"
  echo "Total de acertos: $npassou"
  echo "Indice de acertos: $indice"
fi;

if [ $verbose -eq 0 ]; then
  echo $indice
fi;

© 2017 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
API
Training
Shop
Blog
About
