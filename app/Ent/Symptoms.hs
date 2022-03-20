module Ent.Symptoms where

data Symptoms = 
    Symptoms{
        _title :: String
    }
    deriving (Eq, Ord, Show, Read)