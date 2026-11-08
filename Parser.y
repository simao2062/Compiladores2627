{
-- Analisador sintático, recebe uma lista de tokens do Lexer e substitui a gramatica das expressões por construtores AST, respeitando as regras de estrutura de Pascal
module Parser where
import Lexer 
import AST
import Prelude
}

%name parse --recebe uma lista de tokens, devolve o res do cálculo
%tokentype { Token } --tipo de tokens recebidos do Lexer
%error { parseError } --função chamada qnd a express contém erro sintatico

%token --tokens reconhecidos pelo parser
    num        {Number $$} --$$ representa valor contido no token
    identifier {Identifier $$}
    stringlit  {StringLiteral $$}

    program    {KProgram}
    var        {KVar}
    begin      {KBegin}
    end        {KEnd}
    integer    {KInteger}
    real       {KReal}
    boolean    {KBoolean}
    char       {KChar}
    string     {KString}
    writeln    {KWriteln}
    readln     {KReadln}
    true       {KTrue}
    false      {KFalse}
    if         {KIf}
    then       {KThen}
    else       {KElse}
    while      {KWhile}
    do         {KDo}
    and        {KAnd}
    or         {KOr}
    not        {KNot}

    '+'        {Plus}
    '-'        {Minus}
    '*'        {Times}
    '/'        {Division}     --não é divide pq divide é um construtor de dados do AST, não um token
    '('        {LParen}
    ')'        {RParen}
    ':='       {Assign}
    '>='       {GreaterEqual}
    '<='       {LessEqual}
    '<>'       {NotEqual}
    '='        {Equal}
    '<'        {Less}
    '>'        {Greater}
    ';'        {Semicolon}
    ':'        {Colon}
    ','        {Comma}
    '.'        {Dot}


--preced e assoc dos operadores, declaraçao mais abaixo tem mais precedência
%nonassoc then
%nonassoc else
%left or
%left and
%right not     --o valor do not fica à direita do operador, assoc nao importa
%nonassoc '=' '<>' '<' '<=' '>' '>='--preced de comparacoes menor do que preced de soma e mult, associatividade nao importa
%left '+' '-' --left diz que sao associativos à esq
%left '*' '/' --estes tẽm preced superior
%%

--lê o nome do programa, as variáveis declaradas e a lista de statements, devolve uma estrutura de dados que representa o programa
Program
    : program identifier ';' var VarDecls begin StmtList end '.'
        { PascalProgram $2 $5 $7 }

--lê as variáveis declaradas (uma só ou um conjunto delas), devolve uma lista
VarDecls
    : VarDecl
        { [$1] }
    | VarDecls VarDecl
        { $1 ++ [$2] }

--vê o grupo das variáveis declaradas e vê o type de cada uma
VarDecl
    : IdentList ':' Type ';'
        { VarDecl $1 $3 }

--separ as variáveis declaradas por vírgula, devolve uma lista de strings
IdentList
    : identifier
        { [$1] }
    | IdentList ',' identifier
        { $1 ++ [$3] }

--cria os types para as variáveis declaradas
Type
    : integer  { IntegerType }
    | real     { RealType }
    | boolean  { BooleanType }
    | char     { CharType }
    | string   { StringType }

--lê a lista de statements(depois do begin, separados por ;)
StmtList
    : Stmt
        { [$1] }
    | StmtList ';' Stmt
        { $1 ++ [$3] }
    | StmtList ';'
        { $1 }

--lê cada statement(faz assigns, writeln, readln)
Stmt
    : identifier ':=' Expr
        { AssignStmt $1 $3 }
    | writeln '(' WriteArgs ')'
        { WriteStmt $3 }
    | readln
        { ReadLineStmt }
    | readln '(' IdentList ')'
        { ReadStmt $3 }
    | if Expr then Stmt %prec then
        { IfStmt $2 [$4] Nothing }
    | if Expr then Stmt else Stmt
        { IfStmt $2 [$4] (Just [$6]) }
    | while Expr do Stmt
        { WhileStmt $2 [$4] }
    | begin StmtList end
        { BlockStmt $2 }

--lida com os argumentos do writeln(separados por vírgula), devolve uma lista de WriteArg
WriteArgs
    : WriteArg
        { [$1] }
    | WriteArgs ',' WriteArg
        { $1 ++ [$3] }

--cada argumento do writeln pode ser expressao ou expressao com formato(percentage:0:1), devolve WriteArg
WriteArg
    : Expr
        { WriteExpr $1 }
    | Expr ':' num ':' num
        { WriteFormat $1 $3 $5 }

--gramatica das express aritmeticas e booleanas, devolve estrutura de dados que representa a expressao
Expr    
    : Expr '+' Expr
        { BinaryExpr Add $1 $3 }
    | Expr '-' Expr
        { BinaryExpr Subtract $1 $3 }
    | Expr '*' Expr
        { BinaryExpr Multiply $1 $3 }
    | Expr '/' Expr
        { BinaryExpr Divide $1 $3 }
    | Expr '=' Expr
        { BinaryExpr EqualTo $1 $3 }
    | Expr '<>' Expr
        { BinaryExpr NotEqualTo $1 $3 }
    | Expr '<' Expr
        { BinaryExpr LessThan $1 $3 }
    | Expr '<=' Expr
        { BinaryExpr LessEqualTo $1 $3 }
    | Expr '>' Expr
        { BinaryExpr GreaterThan $1 $3 }
    | Expr '>=' Expr
        { BinaryExpr GreaterEqualTo $1 $3 }
    | Expr and Expr
        { BinaryExpr And $1 $3 }
    | Expr or Expr
        { BinaryExpr Or $1 $3 }
    | not Expr
        { UnaryExpr Not $2 }
    | '(' Expr ')'
        { $2 }
    | num
        { NumberExpr $1 }
    | stringlit
        { StringExpr $1 }
    | identifier
        { VariableExpr $1 }
    | true
        { BooleanExpr True }
    | false
        { BooleanExpr False }


{ --func para erros sintaticos, chamada qnd seq de tokens nao corresponde a nenhuma express valida da gramatica
parseError :: [Token] -> a
parseError toks = error "parse error"  
}
