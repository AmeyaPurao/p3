module Value
  ( Value (..),
    valueToInt,
    valueToBool,
    valueToString,
    valueToTuple,
    isIntVal,
    isBoolVal,
    isStringVal,
    extractInt,
    extractBool,
    extractString,
  )
where

data Value
  = IntVal Integer
  | BoolVal Bool
  | StringVal String
  | Tuple [Value]
  deriving (Eq, Show)

valueToInt :: Value -> Either String Integer
valueToInt (IntVal n) = Right n
valueToInt (BoolVal _) = Left "Type error: expected integer, got boolean"
valueToInt (StringVal _) = Left "Type error: expected integer, got string"
valueToInt (Tuple _) = Left "Type error: expected integer, got tuple"

valueToBool :: Value -> Either String Bool
valueToBool (BoolVal b) = Right b
valueToBool (IntVal _) = Left "Type error: expected boolean, got integer"
valueToBool (StringVal _) = Left "Type error: expected boolean, got string"
valueToBool (Tuple _) = Left "Type error: expected boolean, got tuple"

valueToString :: Value -> Either String String
valueToString (StringVal s) = Right s
valueToString (IntVal _) = Left "Type error: expected string, got integer"
valueToString (BoolVal _) = Left "Type error: expected string, got boolean"
valueToString (Tuple _) = Left "Type error: expected string, got tuple"

valueToTuple :: Value -> Either String [Value]
valueToTuple (Tuple s) = Right s
valueToTuple (IntVal _) = Left "Type error: expected tuple, got integer"
valueToTuple (BoolVal _) = Left "Type error: expected tuple, got boolean"
valueToTuple (StringVal _) = Left "Type error: expected tuple, got string"

isIntVal :: Value -> Bool
isIntVal (IntVal _) = True
isIntVal _ = False

isBoolVal :: Value -> Bool
isBoolVal (BoolVal _) = True
isBoolVal _ = False

isStringVal :: Value -> Bool
isStringVal (StringVal _) = True
isStringVal _ = False

extractInt :: Value -> Integer
extractInt (IntVal n) = n
extractInt _ = error "extractInt: not an IntVal"

extractBool :: Value -> Bool
extractBool (BoolVal b) = b
extractBool _ = error "extractBool: not a BoolVal"

extractString :: Value -> String
extractString (StringVal s) = s
extractString _ = error "extractString: not a StringVal"
