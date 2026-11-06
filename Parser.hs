{-# OPTIONS_GHC -w #-}
-- Analisador sintático, recebe uma lista de tokens do Lexer e substitui a gramatica das expressões por construtores AST, respeitando as regras de estrutura de Pascal
module Parser where
import Lexer 
import AST
import Prelude
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,143) ([0,1,0,32768,0,0,4096,0,0,0,0,0,0,0,64,4096,0,0,256,0,0,2176,0,0,0,0,0,0,0,12,0,0,0,15872,0,0,4,0,0,0,0,0,6145,0,0,16,2048,0,0,0,0,0,4,0,32768,0,0,16384,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,49159,16,32768,24579,8,0,0,16384,16384,1536,0,0,0,0,0,0,0,0,15360,126,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,112,268,0,0,256,4,0,0,0,0,48926,0,0,32800,0,0,0,49152,12289,4,57344,6144,2,28672,3072,1,14336,34304,0,7168,17152,0,3584,8576,0,1792,4288,0,896,2144,0,448,1072,0,224,536,0,16,0,0,0,0,0,28,67,0,0,16222,0,0,0,0,0,0,0,0,4096,0,57344,1,0,61440,0,0,30720,0,0,15360,0,0,7680,0,0,3840,0,0,0,0,0,0,0,0,384,0,0,192,0,8,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Program","VarDecls","VarDecl","IdentList","Type","StmtList","Stmt","WriteArgs","WriteArg","Expr","num","identifier","stringlit","program","var","begin","end","integer","real","boolean","char","string","writeln","readln","true","false","'+'","'-'","'*'","'/'","'('","')'","':='","'>='","'<='","'<>'","'='","'<'","'>'","';'","':'","','","'.'","%eof"]
        bit_start = st * 47
        bit_end = (st + 1) * 47
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..46]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (17) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (17) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (15) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (47) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (43) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (18) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (15) = happyShift action_10
action_6 (5) = happyGoto action_7
action_6 (6) = happyGoto action_8
action_6 (7) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (15) = happyShift action_10
action_7 (19) = happyShift action_14
action_7 (6) = happyGoto action_13
action_7 (7) = happyGoto action_9
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_2

action_9 (44) = happyShift action_11
action_9 (45) = happyShift action_12
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_5

action_11 (21) = happyShift action_22
action_11 (22) = happyShift action_23
action_11 (23) = happyShift action_24
action_11 (24) = happyShift action_25
action_11 (25) = happyShift action_26
action_11 (8) = happyGoto action_21
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (15) = happyShift action_20
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_3

action_14 (15) = happyShift action_17
action_14 (26) = happyShift action_18
action_14 (27) = happyShift action_19
action_14 (9) = happyGoto action_15
action_14 (10) = happyGoto action_16
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (20) = happyShift action_31
action_15 (43) = happyShift action_32
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_12

action_17 (36) = happyShift action_30
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (34) = happyShift action_29
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (34) = happyShift action_28
action_19 _ = happyReduce_17

action_20 _ = happyReduce_6

action_21 (43) = happyShift action_27
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_7

action_23 _ = happyReduce_8

action_24 _ = happyReduce_9

action_25 _ = happyReduce_10

action_26 _ = happyReduce_11

action_27 _ = happyReduce_4

action_28 (15) = happyShift action_10
action_28 (7) = happyGoto action_45
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (14) = happyShift action_36
action_29 (15) = happyShift action_37
action_29 (16) = happyShift action_38
action_29 (28) = happyShift action_39
action_29 (29) = happyShift action_40
action_29 (34) = happyShift action_41
action_29 (11) = happyGoto action_42
action_29 (12) = happyGoto action_43
action_29 (13) = happyGoto action_44
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (14) = happyShift action_36
action_30 (15) = happyShift action_37
action_30 (16) = happyShift action_38
action_30 (28) = happyShift action_39
action_30 (29) = happyShift action_40
action_30 (34) = happyShift action_41
action_30 (13) = happyGoto action_35
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (46) = happyShift action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (15) = happyShift action_17
action_32 (26) = happyShift action_18
action_32 (27) = happyShift action_19
action_32 (10) = happyGoto action_33
action_32 _ = happyReduce_14

action_33 _ = happyReduce_13

action_34 _ = happyReduce_1

action_35 (30) = happyShift action_47
action_35 (31) = happyShift action_48
action_35 (32) = happyShift action_49
action_35 (33) = happyShift action_50
action_35 (37) = happyShift action_51
action_35 (38) = happyShift action_52
action_35 (39) = happyShift action_53
action_35 (40) = happyShift action_54
action_35 (41) = happyShift action_55
action_35 (42) = happyShift action_56
action_35 _ = happyReduce_15

action_36 _ = happyReduce_34

action_37 _ = happyReduce_36

action_38 _ = happyReduce_35

action_39 _ = happyReduce_37

action_40 _ = happyReduce_38

action_41 (14) = happyShift action_36
action_41 (15) = happyShift action_37
action_41 (16) = happyShift action_38
action_41 (28) = happyShift action_39
action_41 (29) = happyShift action_40
action_41 (34) = happyShift action_41
action_41 (13) = happyGoto action_60
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (35) = happyShift action_58
action_42 (45) = happyShift action_59
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_19

action_44 (30) = happyShift action_47
action_44 (31) = happyShift action_48
action_44 (32) = happyShift action_49
action_44 (33) = happyShift action_50
action_44 (37) = happyShift action_51
action_44 (38) = happyShift action_52
action_44 (39) = happyShift action_53
action_44 (40) = happyShift action_54
action_44 (41) = happyShift action_55
action_44 (42) = happyShift action_56
action_44 (44) = happyShift action_57
action_44 _ = happyReduce_21

action_45 (35) = happyShift action_46
action_45 (45) = happyShift action_12
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_18

action_47 (14) = happyShift action_36
action_47 (15) = happyShift action_37
action_47 (16) = happyShift action_38
action_47 (28) = happyShift action_39
action_47 (29) = happyShift action_40
action_47 (34) = happyShift action_41
action_47 (13) = happyGoto action_73
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (14) = happyShift action_36
action_48 (15) = happyShift action_37
action_48 (16) = happyShift action_38
action_48 (28) = happyShift action_39
action_48 (29) = happyShift action_40
action_48 (34) = happyShift action_41
action_48 (13) = happyGoto action_72
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (14) = happyShift action_36
action_49 (15) = happyShift action_37
action_49 (16) = happyShift action_38
action_49 (28) = happyShift action_39
action_49 (29) = happyShift action_40
action_49 (34) = happyShift action_41
action_49 (13) = happyGoto action_71
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (14) = happyShift action_36
action_50 (15) = happyShift action_37
action_50 (16) = happyShift action_38
action_50 (28) = happyShift action_39
action_50 (29) = happyShift action_40
action_50 (34) = happyShift action_41
action_50 (13) = happyGoto action_70
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (14) = happyShift action_36
action_51 (15) = happyShift action_37
action_51 (16) = happyShift action_38
action_51 (28) = happyShift action_39
action_51 (29) = happyShift action_40
action_51 (34) = happyShift action_41
action_51 (13) = happyGoto action_69
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (14) = happyShift action_36
action_52 (15) = happyShift action_37
action_52 (16) = happyShift action_38
action_52 (28) = happyShift action_39
action_52 (29) = happyShift action_40
action_52 (34) = happyShift action_41
action_52 (13) = happyGoto action_68
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (14) = happyShift action_36
action_53 (15) = happyShift action_37
action_53 (16) = happyShift action_38
action_53 (28) = happyShift action_39
action_53 (29) = happyShift action_40
action_53 (34) = happyShift action_41
action_53 (13) = happyGoto action_67
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (14) = happyShift action_36
action_54 (15) = happyShift action_37
action_54 (16) = happyShift action_38
action_54 (28) = happyShift action_39
action_54 (29) = happyShift action_40
action_54 (34) = happyShift action_41
action_54 (13) = happyGoto action_66
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (14) = happyShift action_36
action_55 (15) = happyShift action_37
action_55 (16) = happyShift action_38
action_55 (28) = happyShift action_39
action_55 (29) = happyShift action_40
action_55 (34) = happyShift action_41
action_55 (13) = happyGoto action_65
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (14) = happyShift action_36
action_56 (15) = happyShift action_37
action_56 (16) = happyShift action_38
action_56 (28) = happyShift action_39
action_56 (29) = happyShift action_40
action_56 (34) = happyShift action_41
action_56 (13) = happyGoto action_64
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (14) = happyShift action_63
action_57 _ = happyFail (happyExpListPerState 57)

action_58 _ = happyReduce_16

action_59 (14) = happyShift action_36
action_59 (15) = happyShift action_37
action_59 (16) = happyShift action_38
action_59 (28) = happyShift action_39
action_59 (29) = happyShift action_40
action_59 (34) = happyShift action_41
action_59 (12) = happyGoto action_62
action_59 (13) = happyGoto action_44
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (30) = happyShift action_47
action_60 (31) = happyShift action_48
action_60 (32) = happyShift action_49
action_60 (33) = happyShift action_50
action_60 (35) = happyShift action_61
action_60 (37) = happyShift action_51
action_60 (38) = happyShift action_52
action_60 (39) = happyShift action_53
action_60 (40) = happyShift action_54
action_60 (41) = happyShift action_55
action_60 (42) = happyShift action_56
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_33

action_62 _ = happyReduce_20

action_63 (44) = happyShift action_74
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (30) = happyShift action_47
action_64 (31) = happyShift action_48
action_64 (32) = happyShift action_49
action_64 (33) = happyShift action_50
action_64 (37) = happyFail []
action_64 (38) = happyFail []
action_64 (39) = happyFail []
action_64 (40) = happyFail []
action_64 (41) = happyFail []
action_64 (42) = happyFail []
action_64 _ = happyReduce_31

action_65 (30) = happyShift action_47
action_65 (31) = happyShift action_48
action_65 (32) = happyShift action_49
action_65 (33) = happyShift action_50
action_65 (37) = happyFail []
action_65 (38) = happyFail []
action_65 (39) = happyFail []
action_65 (40) = happyFail []
action_65 (41) = happyFail []
action_65 (42) = happyFail []
action_65 _ = happyReduce_29

action_66 (30) = happyShift action_47
action_66 (31) = happyShift action_48
action_66 (32) = happyShift action_49
action_66 (33) = happyShift action_50
action_66 (37) = happyFail []
action_66 (38) = happyFail []
action_66 (39) = happyFail []
action_66 (40) = happyFail []
action_66 (41) = happyFail []
action_66 (42) = happyFail []
action_66 _ = happyReduce_27

action_67 (30) = happyShift action_47
action_67 (31) = happyShift action_48
action_67 (32) = happyShift action_49
action_67 (33) = happyShift action_50
action_67 (37) = happyFail []
action_67 (38) = happyFail []
action_67 (39) = happyFail []
action_67 (40) = happyFail []
action_67 (41) = happyFail []
action_67 (42) = happyFail []
action_67 _ = happyReduce_28

action_68 (30) = happyShift action_47
action_68 (31) = happyShift action_48
action_68 (32) = happyShift action_49
action_68 (33) = happyShift action_50
action_68 (37) = happyFail []
action_68 (38) = happyFail []
action_68 (39) = happyFail []
action_68 (40) = happyFail []
action_68 (41) = happyFail []
action_68 (42) = happyFail []
action_68 _ = happyReduce_30

action_69 (30) = happyShift action_47
action_69 (31) = happyShift action_48
action_69 (32) = happyShift action_49
action_69 (33) = happyShift action_50
action_69 (37) = happyFail []
action_69 (38) = happyFail []
action_69 (39) = happyFail []
action_69 (40) = happyFail []
action_69 (41) = happyFail []
action_69 (42) = happyFail []
action_69 _ = happyReduce_32

action_70 _ = happyReduce_26

action_71 _ = happyReduce_25

action_72 (32) = happyShift action_49
action_72 (33) = happyShift action_50
action_72 _ = happyReduce_24

action_73 (32) = happyShift action_49
action_73 (33) = happyShift action_50
action_73 _ = happyReduce_23

action_74 (14) = happyShift action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_22

happyReduce_1 = happyReduce 9 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Identifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (PascalProgram happy_var_2 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (VarDecl happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  7 happyReduction_5
happyReduction_5 (HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  7 happyReduction_6
happyReduction_6 (HappyTerminal (Identifier happy_var_3))
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  8 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn8
		 (IntegerType
	)

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn8
		 (RealType
	)

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn8
		 (BooleanType
	)

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn8
		 (CharType
	)

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn8
		 (StringType
	)

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 ([happy_var_1]
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 (HappyAbsSyn13  happy_var_3)
	_
	(HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn10
		 (AssignStmt happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 10 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (WriteStmt happy_var_3
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn10
		 (ReadLineStmt
	)

happyReduce_18 = happyReduce 4 10 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (ReadStmt happy_var_3
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (WriteExpr happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 5 12 happyReduction_22
happyReduction_22 ((HappyTerminal (Number happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Number happy_var_3)) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (WriteFormat happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  13 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr Add happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr Subtract happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  13 happyReduction_25
happyReduction_25 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr Multiply happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr Divide happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  13 happyReduction_27
happyReduction_27 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr EqualTo happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr NotEqualTo happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  13 happyReduction_29
happyReduction_29 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr LessThan happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  13 happyReduction_30
happyReduction_30 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr LessEqualTo happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  13 happyReduction_31
happyReduction_31 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr GreaterThan happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  13 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (BinaryExpr GreaterEqualTo happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  13 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  13 happyReduction_34
happyReduction_34 (HappyTerminal (Number happy_var_1))
	 =  HappyAbsSyn13
		 (NumberExpr happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 (HappyTerminal (StringLiteral happy_var_1))
	 =  HappyAbsSyn13
		 (StringExpr happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 (HappyTerminal (Identifier happy_var_1))
	 =  HappyAbsSyn13
		 (VariableExpr happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn13
		 (BooleanExpr True
	)

happyReduce_38 = happySpecReduce_1  13 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn13
		 (BooleanExpr False
	)

happyNewToken action sts stk [] =
	action 47 47 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Number happy_dollar_dollar -> cont 14;
	Identifier happy_dollar_dollar -> cont 15;
	StringLiteral happy_dollar_dollar -> cont 16;
	KProgram -> cont 17;
	KVar -> cont 18;
	KBegin -> cont 19;
	KEnd -> cont 20;
	KInteger -> cont 21;
	KReal -> cont 22;
	KBoolean -> cont 23;
	KChar -> cont 24;
	KString -> cont 25;
	KWriteln -> cont 26;
	KReadln -> cont 27;
	KTrue -> cont 28;
	KFalse -> cont 29;
	Plus -> cont 30;
	Minus -> cont 31;
	Times -> cont 32;
	Division -> cont 33;
	LParen -> cont 34;
	RParen -> cont 35;
	Assign -> cont 36;
	GreaterEqual -> cont 37;
	LessEqual -> cont 38;
	NotEqual -> cont 39;
	Equal -> cont 40;
	Less -> cont 41;
	Greater -> cont 42;
	Semicolon -> cont 43;
	Colon -> cont 44;
	Comma -> cont 45;
	Dot -> cont 46;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 47 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


--func para erros sintaticos, chamada qnd seq de tokens nao corresponde a nenhuma express valida da gramatica
parseError :: [Token] -> a
parseError toks = error "parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
