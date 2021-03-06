module Dialog exposing (alert, confirm, prompt)

{-| Task interfaces for native dialog functions

@docs alert, confirm, prompt

-}

import Task exposing (Task)
import Native.Dialog


{-| Display the given message.
-}
alert : String -> Task x ()
alert =
    Native.Dialog.alert


{-| Display the given message and ask for confirmation.
-}
confirm : String -> Task x Bool
confirm =
    Native.Dialog.confirm


{-| Display the given message and ask for the user's input. The first argument
is the message and the second argument is the default input value. Returns
`Nothing` if the user clicks "cancel".
-}
prompt : String -> String -> Task x (Maybe String)
prompt =
    Native.Dialog.prompt
