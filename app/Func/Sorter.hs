{-# LANGUAGE ScopedTypeVariables #-}

module Func.Sorter where

sortGT (a1, _) (a2, _)
  | a1 < a2 = GT
  | a1 > a2 = LT
  | a1 == a2 = GT
