module Components.Home.Model exposing (..)

import Material


type alias Model =
    { mdl : Material.Model
    }


initialModel : Model
initialModel =
    { mdl = Material.model
    }