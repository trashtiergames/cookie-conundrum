sa_hello = TextPieceState(
  "Sam",
  {
    "*knock, knock, knock*",
    "Hey April? Wanna come open the door real quick?",
    ". -- . -- .",
    "Seems like she's not waking up."
  }
)

april = Character(
  "April",
  "art/characters/april.png",
  {
    {"Hello?",
    function() 
      gStateStack:push(PieceChainState({
        sa_hello
      }))
    end}
  }
)