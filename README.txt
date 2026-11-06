- Criar um Scanner/Lexer.x que lé código caracter a caracter e agrupa em tokens (IF, WHILE, READ, WRITE, op aritm)
- Criar um Parser.y (analisador sintático) que analisa a seq de tokens gerada pelo Scanner com base nas regras gramaticais do Pascal (verifica gramatica)
- Definir a AST.hs, estrutura de dados/classes que representam os nós da AST, o parser vai usar os nós para construir arvore hierarquica
- Criar ficheiro Main.hs que lê ficheiro de entrada do Pascal e invoca o Scanner e Parser (e depois imprime resultado)
- Anotar tudo neste README (breve descrição do projeto)


-- Para dar print da AST, podemos pôr tabs para mostrar estrutura direito


//para testar só o Lexer (com o Alex instalado), imprime os tokens:
alex Lexer.x -o Lexer.hs
ghci Lexer.hs
input <- readFile "Example1.txt"
mapM_ print (alexScanTokens input)

//para testar Lexer e Parser sem o Main(com o Alex/Happy instalados), imprime AST:
alex Lexer.x -o Lexer.hs
happy Parser.y -o Parser.hs
ghci -ignore-dot-ghci Lexer.hs AST.hs Parser.hs -e 'readFile "Example1.txt" >>= print . Parser.parse . Lexer.alexScanTokens'

//para testar Main com Example1, imprime tokens e AST:
alex Lexer.x -o Lexer.hs
happy Parser.y -o Parser.hs
ghc Main.hs -o teste
./teste