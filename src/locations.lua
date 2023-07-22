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
            "Definitely not evil",
            "art/Placeholder_Evidence_Icon.png"
          )
        })
      )
    }
  ),
  ["kitchen"] =       Location("Kitchen",    "art/bg/kitchen.png", {}),
  ["emilias_door"] =  Location("Emilia's Door", "art/bg/emilias_door.png", {}),
  ["aprils_door"] =   Location("April's Door",  "art/bg/aprils_door.png", {}),
  ["balcony"] =       Location("Balcony",       "art/bg/balcony.png", {}),
  ["darkness"] =      Location("Darkness",      "art/bg/darkness.png", {})
}
