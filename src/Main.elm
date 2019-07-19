module Main exposing (..)
import Dict exposing (Dict)
import Browser
import Html exposing (Html, text, div, h1, img)
import Html.Attributes exposing (src)


---- MODEL ----


type alias Model =
    { currentPlayer : Player
    , board : Board }

type Player 
    = White 
    | Black 

type Square 
    = Piece Player Figure 
    
type Figure
    = Knight
    | Pawn
    | Queen
    | King
    | Bishop
    | Rook

type alias Position = (Int, Int)
type alias Board =  Dict Position Square

init : ( Model, Cmd Msg )
init =
    ( initModel
    , Cmd.none )

---- initialBoard : Board
initialBoard = Dict.fromList
    [ ((0,0), Piece White Rook)
    , ((0,1), Piece White Bishop)
    , ((0,2), Piece White Knight)
    , ((0,3), Piece White King)
    , ((0,4), Piece White Queen)
    , ((0,5), Piece White Knight)
    , ((0,6), Piece White Bishop)
    , ((0,7), Piece White Rook)
    , ((1,0), Piece White Pawn)
    , ((1,1), Piece White Pawn)
    , ((1,2), Piece White Pawn)
    , ((1,3), Piece White Pawn)
    , ((1,4), Piece White Pawn)
    , ((1,5), Piece White Pawn)
    , ((1,6), Piece White Pawn)
    , ((1,7), Piece White Pawn)
    , ((6,0), Piece White Pawn)
    , ((6,1), Piece White Pawn)
    , ((6,2), Piece White Pawn)
    , ((6,3), Piece White Pawn)
    , ((6,4), Piece White Pawn)
    , ((6,5), Piece White Pawn)
    , ((6,6), Piece White Pawn)
    , ((6,7), Piece White Pawn)
    , ((7,0), Piece White Rook)
    , ((7,1), Piece White Bishop)
    , ((7,2), Piece White Knight)
    , ((7,3), Piece White Queen)
    , ((7,4), Piece White King)
    , ((7,5), Piece White Knight)
    , ((7,6), Piece White Bishop)
    , ((7,7), Piece White Rook)
    ]
---- initModel : Model
initModel = {currentPlayer = White, board = initialBoard}

---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Your Elm App is working!" ]
        , div [] [ pintarInicial  ]
        ]

pintarInicial = Loop.while ( (<) 8 ) 0 ((+) 1)

---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
