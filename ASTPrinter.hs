module ASTPrinter (prettyPrintAST) where

import AST

data Tree = Tree String [Tree]

prettyPrintAST :: PascalProgram -> String
prettyPrintAST = unlines . renderTree . programTree

--pega uma AST (de um determinado PascalProgram) e converte numa estrutura de árvore para dar print
programTree :: PascalProgram -> Tree
programTree (PascalProgram name declarations statements) =
    Tree ("PascalProgram " ++ show name)
        [ Tree "Declarations" (map declarationTree declarations)
        , Tree "Statements" (map statementTree statements)
        ]

--trata das declarações (VarDecl) para imprimir na árvore
declarationTree :: VarDecl -> Tree
declarationTree (VarDecl names valueType) =
    Tree ("VarDecl (" ++ show valueType ++ ")")
        (map (\name -> Tree name []) names)

--trata dos statements (Stmt) para imprimir na árvore
statementTree :: Stmt -> Tree
statementTree statement =
    case statement of
        AssignStmt name expression ->
            Tree ("AssignStmt " ++ name) [expressionTree expression]
        WriteStmt arguments ->
            Tree "WriteStmt" (map writeArgTree arguments)
        ReadStmt names ->
            Tree "ReadStmt" (map (\name -> Tree name []) names)
        ReadLineStmt ->
            Tree "ReadLineStmt" []
        IfStmt condition thenStatements elseStatements ->
            Tree "IfStmt"
                ( [Tree "Condition" [expressionTree condition],
                   Tree "Then" (map statementTree thenStatements)]
                  ++ maybe [] (\statements ->
                        [Tree "Else" (map statementTree statements)])
                      elseStatements
                )

--trata dos argumentos WriteArgs para imprimir na árvore
writeArgTree :: WriteArg -> Tree
writeArgTree argument =
    case argument of
        WriteExpr expression ->
            Tree "WriteExpr" [expressionTree expression]
        WriteFormat expression width precision ->
            Tree ("WriteFormat (width " ++ show width
                ++ ", precision " ++ show precision ++ ")")
                [expressionTree expression]

--trata das expressões (Expr) para imprimir na árvore
expressionTree :: Expr -> Tree
expressionTree expression =
    case expression of
        NumberExpr value ->
            Tree ("NumberExpr " ++ show value) []
        StringExpr value ->
            Tree ("StringExpr " ++ show value) []
        BooleanExpr value ->
            Tree ("BooleanExpr " ++ show value) []
        VariableExpr name ->
            Tree ("VariableExpr " ++ name) []
        BinaryExpr operator left right ->
            Tree ("BinaryExpr " ++ show operator)
                [expressionTree left, expressionTree right]


--funções auxiliares para mostrar a árvore em uma lista de strings
renderTree :: Tree -> [String]
renderTree (Tree label children) =
    label : renderChildren "" children

renderChildren :: String -> [Tree] -> [String]
renderChildren _ [] = []
renderChildren prefix children =
    concat
        [ renderChild prefix (index == lastIndex) child
        | (index, child) <- zip [0 ..] children
        ]
  where
    lastIndex = length children - 1

renderChild :: String -> Bool -> Tree -> [String]
renderChild prefix isLast (Tree label children) =
    --let connector = if isLast then "`-- " else "|-- "
    let connector = "|-- "
        childPrefix = prefix ++ if isLast then "    " else "|   "
    in (prefix ++ connector ++ label)
        : renderChildren childPrefix children
