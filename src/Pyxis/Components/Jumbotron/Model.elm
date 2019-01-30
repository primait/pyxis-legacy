module Pyxis.Components.Jumbotron.Model exposing
    ( Model
    , Jumbotron
    , initialModel
    , Msg
    , Image
    )

type Msg = Click String

type alias Image =
    { src : String
    , alt : String
    }

testImage : Maybe Image
testImage = Just <| Image "https://i.kym-cdn.com/entries/icons/original/000/000/091/TrollFace.jpg" "Trollface"

type alias Jumbotron =
    { title : String
    , subtitle : String
    , image:  Maybe Image
    , content:  Maybe String
    }
type alias Model = List (Jumbotron)

initialModel : Model
initialModel =
    [ Jumbotron "Titolo" "Sottotitolo" testImage (Just staticPlateNumber)
    ]
    
staticPlateNumber : String
staticPlateNumber =
    "<div class='a-container plate-number--container'>         <form action='/preventivo/controllo-targa/fq' novalidate='' name='plateNumberForm'>             <div id='plate-number' data-selected-vehicle='car'>                 <div>                     <div class='plate-number__wrapper'>                         <div class='plate-number__form__field'>                             <div class='vehicle__toggle__wrapper'>                                 <ul class='vehicle__toggle'>                                     <li class='vehicle__toggle__item'><i class='icon icon-motorcycle'></i></li>                                     <li class='vehicle__toggle__item is-selected'><i class='icon icon-car'></i></li>                                     <li class='vehicle__toggle__item'><i class='icon icon-van'></i></li>                                 </ul>                             </div>                             <input class='form__field__input' name='plateNumber' id='infoPlateNumber'                                    placeholder='Inserisci la targa' maxlength='8' autocomplete='off'                                    autocapitalize='off' spellcheck='false'>                             <button class='form__btn -primary'><span class='btn__cta'>Preventivo</span> <span                                     class='btn__cta--mobile'>Procedi</span> <span class='btn__cta'>Calcola</span></button>                         </div>                     </div>                     <div id='plateNumberSentinel'></div>                 </div>             </div>         </form>     </div>"