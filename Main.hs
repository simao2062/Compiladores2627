module Main where

import ASTPrinter (prettyPrintAST)
import Lexer (alexScanTokens)
import Parser (parse)

type Env = [(String, String)]

main :: IO ()
main = do
    source <- readFile "Example1.txt"   --decide qual ficheiro de teste usar
    let tokens = alexScanTokens source
        ast = parse tokens
    --putStrLn "Tokens:"
    --mapM_ print tokens                  --imprime a lista de tokens gerados pelo Lexer
    putStrLn "\nAST:"
    putStr (prettyPrintAST ast)         --imprime a AST com indentação por níveis