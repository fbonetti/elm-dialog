module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dialog
import Task


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }


type alias Model =
    { alertMessage : String
    , confirmMessage : String
    , promptMessage : String
    , confirmed : Maybe Bool
    , promptInput : Maybe String
    }


type Msg
    = SetAlertMessage String
    | SetConfirmMessage String
    | SetPromptMessage String
    | SetConfirmed Bool
    | SetPromptInput (Maybe String)
    | ShowAlert
    | ShowConfirm
    | ShowPrompt
    | NoOp


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )


initModel : Model
initModel =
    Model "alert" "confirm" "prompt" Nothing Nothing


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetAlertMessage alertMessage ->
            ( { model | alertMessage = alertMessage }, Cmd.none )

        SetConfirmMessage confirmMessage ->
            ( { model | confirmMessage = confirmMessage }, Cmd.none )

        SetPromptMessage promptMessage ->
            ( { model | promptMessage = promptMessage }, Cmd.none )

        SetConfirmed confirmed ->
            ( { model | confirmed = Just confirmed }, Cmd.none )

        SetPromptInput promptInput ->
            ( { model | promptInput = promptInput }, Cmd.none )

        ShowAlert ->
            ( model, alert model.alertMessage )

        ShowConfirm ->
            ( model, confirm model.confirmMessage )

        ShowPrompt ->
            ( model, prompt model.promptMessage "" )

        NoOp ->
            ( model, Cmd.none )


alert : String -> Cmd Msg
alert =
    Task.perform (always NoOp) << Dialog.alert


confirm : String -> Cmd Msg
confirm =
    Task.perform SetConfirmed << Dialog.confirm


prompt : String -> String -> Cmd Msg
prompt message defaultValue =
    Task.perform SetPromptInput (Dialog.prompt message defaultValue)


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ label [] [ text "Alert Messsage" ]
            , br [] []
            , input
                [ type_ "text"
                , value model.alertMessage
                , onInput SetAlertMessage
                ]
                []
            , button [ onClick ShowAlert ] [ text "Show" ]
            ]
        , div []
            [ label [] [ text "Confirm Messsage" ]
            , br [] []
            , input
                [ type_ "text"
                , value model.confirmMessage
                , onInput SetConfirmMessage
                ]
                []
            , text "Confirmed? "
            , text (toString model.confirmed)
            , button [ onClick ShowConfirm ] [ text "Show" ]
            ]
        , div []
            [ label [] [ text "Prompt Messsage" ]
            , br [] []
            , input
                [ type_ "text"
                , value model.promptMessage
                , onInput SetPromptMessage
                ]
                []
            , text "Prompt input: "
            , text (toString model.promptInput)
            , button [ onClick ShowPrompt ] [ text "Show" ]
            ]
        ]
