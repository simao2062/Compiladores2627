Introdução:
    Para a criação deste compilador básico de Pascal, decidimos escolher a linguagem Haskell. Apesar de C ter mais controlo na memória e na implementação, achamos que Haskell seria mais simples
de usar e funciona bem para a criação da Abstract Syntax Tree. Após selecionarmos a linguagem, fomos ver exemplos de códigos em Pascal (e vimos um pouco da Wikipédia) para perceber a linguagem.
Algumas conclusões a que chegamos: é uma linguagem estruturada (código executa de forma linear), temos de ter cuidado com as suas palavras reservadas (program, var, begin, end, ...), bem como as
expressões e instruções, respeitar ordem de operadores (* -> + -> <= -> else -> then), respeitar estrutura de blocos (begin/end, if/then/else). Após ver os exercícios da prática 2 como exemplo,
passamos aos próximos passos:

Criação do Lexer.x:
    Criamos um Lexer inicial simples usando Alex. O Lexer servirá como analizador lexical do código fornecido, ou seja, lê o código Pascal todo e transforma numa sequência de tokens, respeitando
as regras de precedência e associativade de Pascal. Inicialmente, o nosso Lexer tinha as seguintes funções:
    - definia o que eram algarismos, nºs, letras, identificadores e strings
    - lia os nºs e ignorava comentários
    - reconhecia alguns operadores aritméticos(+,-,*,/), parênteses, identificadores e outros símbolos matemáticos.
    - criava tokens para os tais operadores/símbolos acima referidos
    - criava tokens separados para os identifiers específicos do Pascal (como program, var e begin)

Criação do Parser.y:
    Criamos um Parser inicial também simples usando Happy. O parser serve de analizador sintático, ou seja, recebe a lista de tokens do Lexer e substitui a gramática de expressões por Construtores AST
(falamos mais à frente). Inicialmente, o Parser tinha as seguintes funções:
    - identificava os tokens reconhecidos por ele próprio (iguais ao Lexer)
    - lidava com precedência e associatividade dos operadores que já tínhamos(por exemplo, * tem maior precedência que +)
    - criava uma gramatica das expressões aritmeticas, com regras para calcular contas matemáticas e como colocar parênteses

Criação da AST.hs:
    Criamos a AST (Abstract Syntax Tree) incial para termos alguns construtores de dados para cada tipo de nós(que o Parser chama). A AST cria esses construtores dentro de alguns tipos separados 
que nós criamos, como:
    - PascalType(para Integer, Real, Bool, Char, String)
    - Stmt(para o assign, write e read)
    - WriteArg para dar print dos argumentos
    - Expr para as expressões
    - BinOp para contas matemáticas(Add, Multiply...) e para booleans(LessThan, NotEqualTo...)

Criação do Main.hs:
    Criamos um Main.hs que recebe um código de exemplo em Pascal(neste caso um ficheiro txt como Example1.txt) e depois chama o Lexer e o Parser para compilar o código e imprimir os 
construtores da AST.

Criação do Example1.txt e Example2.txt:
    Exemplos simples de códigos que tiramos da Internet(e alteramos), para testar o que já tínhamos feito com o Main.hs .


- Criar um Scanner/Lexer.x que lé código caracter a caracter e agrupa em tokens (IF, WHILE, READ, WRITE, op aritm)
- Criar um Parser.y (analisador sintático) que analisa a seq de tokens gerada pelo Scanner com base nas regras gramaticais do Pascal (verifica gramatica)
- Definir a AST.hs, estrutura de dados/classes que representam os nós da AST, o parser vai usar os nós para construir arvore hierarquica
- Criar ficheiro Main.hs que lê ficheiro de entrada do Pascal e invoca o Scanner e Parser (e depois imprime resultado)
- Criar ASTPrinter.hs para imprimir a AST em árvore, com indentação por níveis (O Main usa ASTPrinter.prettyPrintAST para mostrar a estrutura da AST)
- Anotar tudo neste README (breve descrição do projeto)




//para testar só o Lexer (com o Alex instalado), imprime os tokens:
alex Lexer.x -o Lexer.hs && ghci Lexer.hs
input <- readFile "Example1.txt"
mapM_ print (alexScanTokens input)


//para testar Lexer e Parser sem o Main(com o Alex/Happy instalados), imprime AST:
alex Lexer.x -o Lexer.hs && happy Parser.y -o Parser.hs && ghci -ignore-dot-ghci Lexer.hs AST.hs Parser.hs -e 'readFile "Example1.txt" >>= print . Parser.parse . Lexer.alexScanTokens'


//para testar Main com Example1, imprime tokens e AST:
alex Lexer.x -o Lexer.hs && happy Parser.y -o Parser.hs && ghc Main.hs -o teste && ./teste