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
      ),
      Clickable(
        894,
        141,
        102,
        89,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "I got such nice birthday cards. I wonder if it's time to take them off the board, it's been a while."
          )
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
      ),
      Clickable(
        34,
        109,
        294,
        204,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "Our amazing world map. It doesn't have New Zealand though."
          )
        })
      ),
      Clickable(
        373,
        65,
        163,
        200,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "It's probably time to water our ivy. But it looks like it's doing super well anyways."
          )
        })
      ),
      Clickable(
        421,
        280,
        89,
        57,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "Our board game collection is gathering dust. Everyone's been so busy with finals coming up. Once that's over, it's really time for a good board game night again."
          )
        })
      ),
      Clickable(
        424,
        406,
        80,
        70,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "Nothing but bills and other documents you should save. One folder literally says 'Important Documents'."
          )
        })
      )
    }
  ),
  ["emilias_door"] =  Location("Emilia's Door", "art/bg/emilias_door.png", {
    Clickable(
        1092,
        0,
        185,
        155,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "Our nature painting game is top notch. Love this one."
          )
        })
      ),
      Clickable(
        993,
        408,
        286,
        132,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "Our couch has seen better days."
          )
        })
      )
  }, {emilia}),
  ["aprils_door"] =   Location("April's Door",  "art/bg/aprils_door.png", {
    Clickable(
        65,
        428,
        64,
        64,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "*click*"
          )
        })
      )
  }, {april}),
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
      ),
      Clickable(
        837,
        406,
        93,
        139,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "There used to be a box here, but they're too hard to draw so we put it out of sight."
          )
        })
      ),
      Clickable(
        512,
        47,
        423,
        122,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "Those apartments look kinda nice. Can't really complain about ours for that price though."
          )
        })
      ),
      Clickable(
        0,
        109,
        470,
        175,
        false,
        PieceChainState({
          TextPieceState(
            "Sam",
            "I'm too lazy to go look for evidence in the forest."
          )
        })
      )
  }),
  ["darkness"] =      Location("Darkness",      "art/bg/darkness.png", {})
}
