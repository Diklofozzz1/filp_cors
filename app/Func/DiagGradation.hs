{-# LANGUAGE ScopedTypeVariables #-}

module Func.DiagGradation where

import Ent.Symptoms
import Control.Monad
import Ent.Diagnosis
import Data.List (sort)

areEqual :: Diagnosis -> [Symptoms] -> Bool
areEqual _ [] = False
areEqual diag sympts = 
      sort m == sort sympts
    where
      m = symptoms diag

intersect :: (Eq a) => [a] -> [a] -> [a]
intersect [] _ = []
intersect (x:xs) y | (x `elem` y) = x : intersect xs y
                   | otherwise = intersect xs y 

concatinator :: Diagnosis -> [Symptoms] -> Int
concatinator _ [] = 0
concatinator x y = length(intersect a b)
  where
    a = symptoms x
    b = y

gradator :: [Diagnosis] -> [Symptoms] -> [(Int, Diagnosis)]
gradator _ [] = []
gradator [] _ = []
gradator (diag:diags) sympts 
  |  areEqual diag sympts == True = [(cons, diag)]
  |  otherwise = ((concatinator diag sympts), diag) : gradator diags sympts
  where 
     cons :: Int = 100