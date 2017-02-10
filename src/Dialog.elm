module Dialog exposing (alert, confirm, prompt)

{-| Task interfaces for native dialog functions

@docs alert, confirm, prompt

-}

import Task exposing (Task)
import Native.Dialog


{-| Display a native alert
-}
alert : String -> Task x ()
alert =
    Native.Dialog.alert


{-| Display the given message and ask for confirmation
-}
confirm : String -> Task x Bool
confirm =
    Native.Dialog.confirm


{-| Display the given message and ask for the user's input
-}
prompt : String -> String -> Task x String
prompt =
    Native.Dialog.prompt
