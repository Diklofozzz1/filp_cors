{-# LANGUAGE ScopedTypeVariables #-}

module Func.DiagFinder where

import Ent.Symptoms
import Ent.Diagnosis

isMember n [] = False
isMember n (x:xs)
    | n == x = True
    | otherwise = isMember n xs

isOccorencess :: [Symptoms] -> [Symptoms] -> Bool
isOccorencess [] _ = False
isOccorencess _ [] = False
isOccorencess (x:xs) symptDiag = res 
  where
    res = (isOccorencess xs symptDiag) || (isMember x symptDiag)

findDiagnos :: [Diagnosis] -> [Symptoms] -> [Diagnosis]
findDiagnos [] _ = []
findDiagnos _ [] = []
findDiagnos (diag:diags) sympts 
  | findRes == True   = founded ++ [diag]
  | findRes == False  = founded ++ [] 
  | otherwise         = founded
  where
    findRes = isOccorencess s sympts
    s = symptoms diag
    founded :: [Diagnosis] = findDiagnos diags sympts
