module Main where

import ASTPrinter (prettyPrintAST)
import Lexer (alexScanTokens)
import Parser (parse)
import ErrorCheck (checkUndeclaredVariables)
import System.Exit (exitFailure)

type Env = [(String, String)]

main :: IO ()
main = do
    source <- getContents
    let tokens = alexScanTokens source
        ast = parse tokens
        errors = checkUndeclaredVariables ast
    case errors of
        [] -> do
            putStrLn "\nAST:"
            putStr (prettyPrintAST ast)         --imprime a AST com indentação por níveis
        _ -> do
            putStrLn "Semantic errors:"
            mapM_ putStrLn errors
            exitFailure