se_hello = TextPieceState(
  "Sam",
  {
    "*knock, knock, knock*",
    "Hey Emily? Are you awake?",
  }
)

es_sleepy = TextPieceState(
  "Emily",
  {
    ". -- . -- .",
    "Urgh.. Sam? What do you need so early? Go back to sleep...",
    "Unless you have something really important that you need to PRESENT to me, let me go back to sleep please...",
  }
)

emilia = Character(
  "Emilia",
  {
    {"Hello?",
    function() 
      gStateStack:push(PieceChainState({
        se_hello,
        es_sleepy
      }))
    end}
  }
)