{-# LANGUAGE ScopedTypeVariables #-}

module Func.Parser where

import Ent.Symptoms
import Ent.Diagnosis

import Data.String


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
       

composerOut :: (Int, Diagnosis) -> String
composerOut x = resStr
    where
        struct = snd x
        symptStruct = symptoms struct
        symptMass = structExtractor symptStruct
        procedMass = procedures struct
        drugMass = drugs struct
        _diagnosis = title struct
        _symptoms = unwords symptMass
        _proced = unwords procedMass
        _drugs = unwords drugMass
        resStr = "***************************************" ++ "\n" ++ "You are likely to have the following illnesses: " ++ _diagnosis ++ "\n" ++ "***************************************" ++ "\n" ++
                 "This disease may present with the following symptoms: " ++ _symptoms ++ "\n" ++ "***************************************" ++ "\n" ++
                 "With this disease, the following procedures are expected: " ++ _proced ++ "\n" ++ "It is suggested to take the following medicines: " ++ _drugs ++ "\n" ++ "***************************************" ++ "\n" ++
                 "Please consult a specialist!" ++ "\n" ++ "***************************************" 
