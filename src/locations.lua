locations = {
  ["sams_room"] = Location(
    "Sam's Room",
    "art/bg/sams_room.png", 
    {
      Clickable(
        165,
        150,
        110,
        100,
        false,
        PieceChainState({
          p_paint
        })
      )
    }
  ),
  ["kitchen"] = Location(
    "Kitchen",
    "art/bg/kitchen.png", 
    {
      Clickable(
        807,
        411,
        350,
        91,
        true,
        PieceChainState({
          p_crumbs,
          EviPieceState(
            "Now, there's only crumbs left...",
            "Cookie crumbs",
            "I found these crumbs next to the tray where my cookies were cooling off yesterday.",
            "art/evidence/Crumbs.png"
          ),
          p_presc
        })
      ),
      Clickable(
        135,
        335,
        60,
        90,
        true,
        PieceChainState({
          p_beer,
          EviPieceState(
            "There's lipstick on it.",
            "Beer can",
            "A can of Round Seal Ale with lipstick stains on it.",
            "art/evidence/Beer.png"
          ),
          p_lipst
        })
      ),
      Clickable(
        510,
        425,
        55,
        70,
        true,
        PieceChainState({
          p_buried,
          EviPieceState(
            "It's pretty sternly worded.",
            "Letter",
            "A sternly worded rejection letter to a job application.",
            "art/evidence/Letter.png"
          )
        })
      )
    },
    {}
  ),
  ["emilias_door"] =  Location("Emilia's Door", "art/bg/emilias_door.png", {}, {emilia}),
  ["aprils_door"] =   Location("April's Door",  "art/bg/aprils_door.png", {}, {april}),
  ["balcony"] =       Location("Balcony",       "art/bg/balcony.png", {
    Clickable(
        600,
        315,
        105,
        80,
        true,
        PieceChainState({
          p_trash,
          EviPieceState(
            "Right on top are a bunch of tissues.",
            "Tissues",
            "Used tissues found in the trashcan.",
            "art/evidence/Tissues.png"
          )
        })
      )
  }),
  ["darkness"] =      Location("Darkness",      "art/bg/darkness.png", {})
}
