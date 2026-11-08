--representação da AST(Abstract Syntax Tree) do Pascal, com construtores de dados para cada tipo de nó
--ele constrói um valor usando os construtores de dados
module AST where

data PascalProgram = PascalProgram String [VarDecl] [Stmt]
    deriving (Show, Eq)

data VarDecl = VarDecl [String] PascalType
    deriving (Show, Eq)

data PascalType
    = IntegerType
    | RealType
    | BooleanType
    | CharType
    | StringType
    deriving (Show, Eq)

data Stmt
    = AssignStmt String Expr
    | WriteStmt [WriteArg]
    | ReadStmt [String]
    | ReadLineStmt
    | IfStmt Expr [Stmt] (Maybe [Stmt])
    | WhileStmt Expr [Stmt]
    | BlockStmt [Stmt]
    deriving (Show, Eq)

data WriteArg
    = WriteExpr Expr
    | WriteFormat Expr Double Double
    deriving (Show, Eq)

data Expr
    = NumberExpr Double
    | StringExpr String
    | BooleanExpr Bool
    | VariableExpr String
    | BinaryExpr BinOp Expr Expr
    | UnaryExpr UnOp Expr
    deriving (Show, Eq)

data BinOp
    = Add | Subtract 
    | Multiply | Divide
    | EqualTo | NotEqualTo
    | LessThan | LessEqualTo
    | GreaterThan | GreaterEqualTo
    | And | Or
    deriving (Show, Eq)

data UnOp = Not
    deriving (Show, Eq)