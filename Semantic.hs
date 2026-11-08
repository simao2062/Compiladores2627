module Semantic (checkUndeclaredVariables) where

import AST

checkUndeclaredVariables :: PascalProgram -> [String]
checkUndeclaredVariables (PascalProgram _ declarations statements) =
    concatMap (checkStmt declared) statements
  where
    declared = concat [names | VarDecl names _ <- declarations]

checkStmt :: [String] -> Stmt -> [String]
checkStmt declared statement =
    case statement of
        AssignStmt name expression ->
            checkName declared "assignment target" name
                ++ checkExpr declared expression
        WriteStmt arguments ->
            concatMap (checkWriteArg declared) arguments
        ReadStmt names ->
            concatMap (checkName declared "readln target") names
        ReadLineStmt ->
            []
        IfStmt condition thenStatements elseStatements ->
            checkExpr declared condition
                ++ concatMap (checkStmt declared) thenStatements
                ++ maybe [] (concatMap (checkStmt declared)) elseStatements
        WhileStmt condition statements ->
            checkExpr declared condition
                ++ concatMap (checkStmt declared) statements
        BlockStmt statements ->
            concatMap (checkStmt declared) statements

checkWriteArg :: [String] -> WriteArg -> [String]
checkWriteArg declared argument =
    case argument of
        WriteExpr expression ->
            checkExpr declared expression
        WriteFormat expression _ _ ->
            checkExpr declared expression

checkExpr :: [String] -> Expr -> [String]
checkExpr declared expression =
    case expression of
        NumberExpr _ ->
            []
        StringExpr _ ->
            []
        BooleanExpr _ ->
            []
        VariableExpr name ->
            checkName declared "expression" name
        BinaryExpr _ left right ->
            checkExpr declared left ++ checkExpr declared right
        UnaryExpr _ operand ->
            checkExpr declared operand

checkName :: [String] -> String -> String -> [String]
checkName declared context name
    | name `elem` declared = []
    | otherwise = ["Undeclared variable '" ++ name ++ "' in " ++ context ++ "."]
