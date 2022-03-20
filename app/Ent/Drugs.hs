module Ent.Drugs where 

data Drugs = 
    Drugs {
        title :: String
    } 
    deriving (Eq, Show, Read)