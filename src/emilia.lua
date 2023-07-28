se_hello = TextPieceState(
  "Sam",
  {
    "*knock, knock, knock*",
    "Hello, Emily? Are you awake?",
    "This is a test message"
  }
)

emilia = Character(
  "Emilia",
  {
    {"Hello?",
    function() 
      gStateStack:push(PieceChainState({
        se_hello
      }))
    end},
    {"Test",
    function() print("testerino!!!") end}
  }
)