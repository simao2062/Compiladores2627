module Main where

import AST
import Lexer (alexScanTokens)
import Parser (parse)

type Env = [(String, String)]

main :: IO ()
main = do
    source <- readFile "Example1.txt"   --decide qual ficheiro de teste usar
    let tokens = alexScanTokens source
    putStrLn "Tokens:"
    mapM_ print tokens                  --imprime a lista de tokens gerados pelo Lexer
    putStrLn "\nAST:"
    print (parse tokens)                --imprime a AST, usando os tokens gerados pelo Lexer e a função parse do Parser