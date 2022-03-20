{-# LANGUAGE ScopedTypeVariables, OverloadedStrings, OverloadedLabels, LambdaCase, InstanceSigs #-}

import System.IO
import System.Environment (getArgs)

import Ent.Symptoms
import Ent.Diagnosis
import Func.DiagFinder (findDiagnos)
import Func.DiagGradation (gradator)
import Func.Sorter (sortGT)
import Func.Parser (composerIn, composerOut)

import Func.Executor
import Func.IDPacker as ID

import Data.Text (Text, pack, unpack)
import Data.List
import Data.Maybe
import Data.GI.Base
import qualified GI.Gtk as Gtk

import qualified Data.Text.IO as T


printQuit :: Text -> IO ()
printQuit t = do
    T.putStrLn $ "Quitting by " <> t <> "."
    Gtk.mainQuit
    return ()


connector :: Gtk.Builder -> IO()
connector builder = do
    symptomText <- extractEntryText builder (ID.packSymtomEntryId)
    
    let symptStr = unpack symptomText
    let res = composerIn symptStr

    case res == [] of
        True -> do 
            Just warnDialog <- getBuilderObj builder ID.packWarnDialogId Gtk.Dialog
            #show warnDialog
        _ -> do
            contents :: String <- readFile "./app/txt/diags.txt"
            let arr :: [Diagnosis] = read contents

            let diags = findDiagnos arr res
            let sortedDiag = sortBy sortGT (gradator diags res) 
            
            case sortedDiag == [] of 
                True -> do 
                    let emptyDiagStr :: String = "Sorry! We don't know what's wrong with you! You better see a doctor"
                    let packedEmptyDiagStr :: Text = pack emptyDiagStr
                    changeTextBuffer builder ID.packTextBufferId packedEmptyDiagStr
                    print $ "|UNKOWN ILLNESS|: res: " ++ show packedEmptyDiagStr
                _ -> do
                    let actDiag = head sortedDiag
                    let foo = composerOut actDiag
                    let packedDiagStr :: Text = pack foo 
                    changeTextBuffer builder ID.packTextBufferId packedDiagStr
                    print $ "|ILLNESS FOUND|: res: " ++ show packedDiagStr
                 

main :: IO ()
main = do
    args <- getArgs
    let targs = map pack args
    Gtk.init $ Just targs

    let filename = case targs of
                   [] -> "D:\\tryui\\app\\front.glade"
                   arg:[] -> arg
                   _ -> error "Too many command line arguments."

    T.putStrLn $ "filename=\"" <> filename <> "\""

    builder <- new Gtk.Builder []
    #addFromFile builder filename

    connectButtonClicked builder ID.packSymtomEntryButtonId $ connector builder 
    
    Just warnDialog <- getBuilderObj builder ID.packWarnDialogId Gtk.Dialog
    connectButtonClicked builder ID.packCloseBtnId $ #hide warnDialog

    Just window <- getBuilderObj builder ID.packMainWindowId Gtk.Window
    on window #destroy $ printQuit "windows close button"

    Gtk.main