{-# LANGUAGE ScopedTypeVariables #-}

module Func.Parser where

import Ent.Symptoms
import Ent.Diagnosis

import Data.String
import Data.List

deleteSpase :: Char -> String -> String
deleteSpase _ "" = ""
deleteSpase c (x:xs) | c==x = deleteSpase c xs
                | otherwise = x : (deleteSpase c xs)

parser    :: (Char -> Bool) -> String -> [String]
parser  p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : parser  p s''
                            where (w, s'') = break p s'

putInStruct :: [String] -> [Symptoms]
putInStruct [] = []
putInStruct (x:xs) = [Symptoms x] ++ putInStruct xs

composerIn :: String -> [Symptoms]
composerIn "" = []
composerIn str  
    | length massOfStr > 1 = structOfSymptoms
    | otherwise            = []
    where
        whithOutSpase = deleteSpase ' ' str
        massOfStr = parser (==',') whithOutSpase
        structOfSymptoms = putInStruct massOfStr


structExtractor :: [Symptoms] -> [String]
structExtractor [] = []
structExtractor (x:xs) = structExtractor xs ++ mass
    where 
        sympt = _title x
        mass = [sympt] :: [String]
       

strComposer :: Diagnosis -> String
strComposer x = resStr  
    where
        struct = x
        symptStruct = symptoms struct
        symptMass = structExtractor symptStruct
        procedMass = procedures struct
        drugMass = drugs struct
        _diagnosis = title struct
        -- _symptoms = unwords symptMass
        _symptoms = intercalate ", " symptMass
        _proced = intercalate ", " procedMass
        _drugs = intercalate ", " drugMass
        resStr = "Probably you have the following illnesses: " ++ _diagnosis ++ "\n" ++ "********************" ++ "\n" ++
                 "This disease may present with the following symptoms: " ++ _symptoms ++ "\n" ++ "********************" ++ "\n" ++
                 "With this disease, the following procedures are expected: " ++ _proced ++ "\n" ++ "It is suggested to take the following medicines: " ++ _drugs ++ "\n" ++ "********************" ++ "\n" ++
                 "Please consult a specialist!" ++ "\n" ++ "********************" 



composerOut :: [(Int, Diagnosis)] -> String
composerOut [] = ""
composerOut (x:xs) = strComposer xBase ++ "\n" ++ "--------------------------\\--------------------------" ++ "\n" ++ composerOut xs
    where
        xBase = snd x


slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

checker :: [(Int, Diagnosis)] -> [Symptoms] -> [(Int, Diagnosis)]
checker [] _ = [] 
checker _ [] = [] 
checker (x:xs) sympt
    | cons == length(sympt) = founded ++ [x]
    | otherwise = founded
    where
      cons = fst x
      founded :: [(Int, Diagnosis)] = checker xs sympt
