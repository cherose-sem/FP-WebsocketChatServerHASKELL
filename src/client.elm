import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Json.Decode as Decode

main =
  Html.program
    { init = (Model 0, Cmd.none)
    , view = view
    , update = update
    , subscriptions = \x -> Sub.none }

--model
type alias Model =
  { counter : Int
  }

type Msg
  = Get
  | Set
  | DoPut (Result Http.Error Int)

-- Get Method

--decoding method
decode : Decode.Decoder Int
decode = Decode.at ["data"] Decode.int


getCounter :  Cmd Msg
getCounter =
    let
      url = "http://localhost:3000/counter/"
    in
      Http.send DoPut (Http.get url decode)

-- Put Method

setCounter: Cmd Msg
setCounter =
    let
      url = "http://localhost:3000/counter/1"
    in
      Http.send DoPut (Http.request
        { method = "PUT"
        , headers = []
        , url = url
        , body = Http.emptyBody
        , expect = Http.expectJson decode
        , timeout = Nothing
        , withCredentials = False
        })

--update
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Get ->
      (model, getCounter)
    Set ->
      (model, setCounter)
    DoPut
      (Ok value) -> (Model value, Cmd.none)
    DoPut
      (Err _) -> (model, Cmd.none)

--view
view : Model -> Html Msg
view model =
  div []
      [ button [ onClick Get ] [ text "Get"]
      , button [ onClick Set ] [ text "Set"]
      , div [] [ text (toString model.counter) ]
      ]
