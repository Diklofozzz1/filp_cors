module Ent.Diagnosis where

import Ent.Symptoms

data Diagnosis =
    Diagnosis {
        title :: String,
        symptoms :: [Symptoms],
        procedures :: [String],
        drugs :: [String]
    }
    deriving (Eq, Show, Read)