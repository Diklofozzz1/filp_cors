{-# LANGUAGE ScopedTypeVariables #-}

module Func.IDPacker where 

import Data.Text (Text, pack)

packTextBufferId :: Text = pack "textbuffer1"
packMainWindowId :: Text = pack "mainWindow"
packSymtomEntryId :: Text = pack "symtomEntry"
packSymtomEntryButtonId :: Text = pack "symtomEntryButton"
packdiseaseOutputId :: Text = pack "diseaseOutput"


packCloseBtnId :: Text = pack "closeWarningWindowBtn"
packWarnDialogId :: Text = pack "warnDialog"