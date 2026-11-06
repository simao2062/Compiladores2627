{
-- Analisador lexical (recebe texto da expr e transforma numa seq de tokens, respeitando regras preced e associat de Pascal)

module Lexer where
import Data.Char (toLower)
}

%wrapper "basic" --indica Alex que vamos gerar analizador lexical básico(recebe texto e devolve tokens)

$digit = 0-9  --define algarismo
@number = $digit+(\.$digit+)?  --um nº pode ser inteiro ou decimal
$letter = [a-zA-Z]  -- define letras (maiusculas ou minusculas)
@identifier = $letter [$letter $digit _]*  --um identificador começa com letra e pode ter letras, nºs ou _ depois
@string = "'" [^'\n]* "'"  --trata de strings com aspas simples e que não podem ter aspas simples ou mud de linha no meio
tokens :-

$white+    ; --ignorar carateres "brancos"(espaços, tabulaçoes e mud de linha)

@number { \s -> Number (read s)} --reconhece nºs e converte para Double
\{ [^\}]* \};                    --ignora os comentários {...}
@string     { \s -> StringLiteral (init (tail s)) }
@identifier { identifierToken }  --envia todas as palavras que não são palavras reservadas para a função identifierToken

-- reconhece operadores aritméticos, parenteses, indentificadores e simbolos matemáticos
":="    { \_ -> Assign }       -- \_ ignora o texto recebido, enquanto que \s recebe o txt reconhecido
">="    { \_ -> GreaterEqual }
"<="    { \_ -> LessEqual }
"<>"    { \_ -> NotEqual }
"="     { \_ -> Equal }
"<"     { \_ -> Less }
">"     { \_ -> Greater }
";"     { \_ -> Semicolon }
":"     { \_ -> Colon }
","     { \_ -> Comma }
"."     { \_ -> Dot }

"+"    {\_ -> Plus}
"-"    {\_ -> Minus}
"*"    {\_ -> Times}
"/"    {\_ -> Division}
"("    {\_ -> LParen}
")"    {\_ -> RParen}

{

-- tipo que representa tokens produzidos pelo Lexer
data Token = Number Double --nº inteiro ou decimal
        | Identifier String
        | StringLiteral String
        | Assign
        | Semicolon
        | Colon
        | Comma
        | Dot
        | Equal
        | NotEqual
        | Less
        | LessEqual
        | Greater
        | GreaterEqual
        | KProgram
        | KVar
        | KBegin
        | KEnd
        | KInteger
        | KReal
        | KBoolean
        | KChar
        | KString
        | KWriteln
        | KReadln
        | KTrue
        | KFalse
        | Plus
        | Minus
        | Times
        | Division
        | LParen
        | RParen
        | KIf
        | KThen
        | KElse
        deriving (Show, Eq)

-- decide se a palavra é reservada ou um identificador
identifierToken :: String -> Token
identifierToken s =
    case map toLower s of
        "program" -> KProgram
        "var"     -> KVar
        "begin"   -> KBegin
        "end"     -> KEnd
        "integer" -> KInteger
        "real"    -> KReal
        "boolean" -> KBoolean
        "char"    -> KChar
        "string"  -> KString
        "writeln" -> KWriteln
        "readln"  -> KReadln
        "true"    -> KTrue
        "false"   -> KFalse
        "if"      -> KIf
        "then"    -> KThen
        "else"    -> KElse
        _         -> Identifier (map toLower s) --se nao for nenhuma das anteriores, devolve id com letras minusculas
}
