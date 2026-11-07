module Main where

import ASTPrinter (prettyPrintAST)
import Lexer (alexScanTokens)
import Parser (parse)
import Semantic (checkUndeclaredVariables)
import System.Exit (exitFailure)

type Env = [(String, String)]

main :: IO ()
main = do
    source <- readFile "Example1.txt"   --decide qual ficheiro de teste usar
    let tokens = alexScanTokens source
        ast = parse tokens
        errors = checkUndeclaredVariables ast
    --putStrLn "Tokens:"
    --mapM_ print tokens                  --imprime a lista de tokens gerados pelo Lexer
    case errors of
        [] -> do
            putStrLn "\nAST:"
            putStr (prettyPrintAST ast)         --imprime a AST com indentação por níveis
        _ -> do
            putStrLn "Semantic errors:"
            mapM_ putStrLn errors
            exitFailure