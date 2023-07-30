locations = {
  ["sams_room"] = Location(
    "Sam's Room",
    "art/bg/sams_room.png", 
    {
      Clickable(
        "getTestEvidence",
        149,
        132,
        140,
        140,
        true,
        PieceChainState({
          p_test,
          EviPieceState(
            "It's a flower.",
            "Flower",
            "Definitely not evil. Just a really nice flower that was hidden behind a painting.",
            "art/Placeholder_Evidence_Icon.png"
          )
        })
      ),
      Clickable(
        "getTestDialogue",
        300,
        300,
        100,
        100,
        false,
        PieceChainState({
          p_ttest
        })
      )
    }
  ),
  ["kitchen"] = Location(
    "Kitchen",
    "art/bg/kitchen.png", 
    {
      Clickable(
        "getCrumbz",
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
      )
    }),
  ["emilias_door"] =  Location("Emilia's Door", "art/bg/emilias_door.png", {}, {emilia}),
  ["aprils_door"] =   Location("April's Door",  "art/bg/aprils_door.png", {}, {april}),
  ["balcony"] =       Location("Balcony",       "art/bg/balcony.png", {}),
  ["darkness"] =      Location("Darkness",      "art/bg/darkness.png", {})
}
