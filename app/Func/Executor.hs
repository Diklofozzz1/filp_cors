{-# LANGUAGE ScopedTypeVariables, OverloadedStrings, OverloadedLabels, LambdaCase, InstanceSigs #-}
 
module Func.Executor where 

import qualified Data.Text as Text
import Data.Maybe
import Data.Int

import qualified GI.Gtk as Gtk
import Data.GI.Base

import qualified Data.Text.IO as T

getBuilderObj :: forall o'
               . GObject o' 
               => Gtk.Builder 
               -> Text.Text 
               -> (ManagedPtr o' -> o') 
               -> IO (Maybe o')
getBuilderObj builder name gtkConstr = #getObject builder name >>= \case 
  Just obj -> castTo gtkConstr obj
  Nothing -> do
    T.putStrLn $ "Object named '" <> name <> "' could not be found."
    return Nothing

extractEntryText :: Gtk.Builder -> Text.Text -> IO Text.Text
extractEntryText builder entryId = do
    Just entry <- getBuilderObj builder entryId Gtk.Entry
    buffer :: Gtk.EntryBuffer <- #getBuffer entry
    text :: Text.Text <- #getText buffer
    return text

connectButtonClicked :: Gtk.Builder -> Text.Text -> IO () -> IO ()
connectButtonClicked builder buttonId handler = getBuilderObj builder buttonId Gtk.Button >>= \case
  Just button -> do 
    on button #clicked $ do handler
    return ()
  Nothing -> return ()

changeTextBuffer :: Gtk.Builder -> Text.Text -> Text.Text -> IO()
changeTextBuffer builder textBufferId text = do
    Just buffer <- getBuilderObj builder textBufferId Gtk.TextBuffer
    -- let _text = Text.length(text) :: Int32 
    #setText buffer text $ (-1)
    
