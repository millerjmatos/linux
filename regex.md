As expressões regulares (regex) são uma linguagem de busca e manipulação de texto bastante poderosa. Elas são usadas em muitas linguagens de programação, em ferramentas de linha de comando como o shell e em editores de texto avançados.

Existem duas principais formas de expressões regulares: as expressões regulares básicas (BRE) e as expressões regulares estendidas (ERE). As BREs são suportadas por padrão pela maioria dos shells, enquanto as EREs exigem que você use uma opção específica ao chamar o comando que suporta as EREs.

A utilização de aspas duplas é recomendada.

## Expressões regulares básicas (BRE)

Caracteres literais:

    "a" corresponde à letra "a"

Âncoras:

    "^" Corresponde ao início da linha

    "$" Corresponde ao final da linha

Caracteres especiais:

Precisam ser escapados com uma barra invertida " \ " se você quiser correspondê-los literalmente (grep). Alguns desses são:

    "."  Corresponde a qualquer caractere

    "|" Operador "OU"

    "*"  Corresponde a zero ou mais ocorrências do caractere anterior

    "?"  Corresponde a zero ou uma ocorrência do caractere anterior

    "+"  Corresponde a uma ou mais ocorrências do caractere anterior

    "^$" Corresponde a uma string que não contém nenhum caractere, ou seja, linha vazia

Conjuntos de caracteres:

    "[abc]" Corresponde a um único caractere que é "a", "b" ou "c"

    "[a-z]" Corresponde a um único caractere que ESTÁ ENTRE "a" e "z"

    "[^abc]" Corresponde a um único caractere que NÃO É "a", "b" ou "c"

    "( )" usado para agrupar uma ou mais partes da expressão regular em um grupo que pode ser tratado como uma única unidade

    Note que "(a|e|i|o|u)" é similar a "[aeiou]"

## Expressões regulares estendidas (ERE)

Âncoras:

As âncoras básicas nas EREs são as mesmas que nas BREs, mas as EREs adicionam outras âncoras, alguns desses são:

    "\b" Corresponde a uma fronteira de palavra.

    "\w" Corresponde a qualquer caractere alfanumérico, similar a [A-Za-z0-9_]

Exemplo, para encontrar todas as palavras que começam com a letra "p":

    "\bp\w+\b"

Quantificadores:

    "{n,m}" Correspondência de n a m ocorrências do caractere anterior

    "{n,}" Correspondência de pelo menos n ocorrências do caractere anterior

    "{N}"  Corresponde exatamente a N ocorrências do caractere anterior