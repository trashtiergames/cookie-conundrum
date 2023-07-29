se_hello = TextPieceState(
  "Sam",
  {
    "*knock, knock, knock*",
    "Hey Em? Are you awake?",
  }
)

es_sleepy = TextPieceState(
  "Emilia",
  {
    ". -- . -- .",
    "Urgh.. Sam? What do you need so early? Go back to sleep...",
    "Unless you have something really important that you need to PRESENT to me, let me go back to sleep please...",
  }
)

e_crumb = FunctionPieceState(
  function()
    for _, char in pairs(currentLocation.characters) do
      if char.name == "Emilia" then
        char:setExpectations(
          "Cookie crumbs",
          function()
            gStateStack:push(PieceChainState({
              TextPieceState(
                "Emilia",
                {
                  "What's that? Someone ate your cookies? Ok, let me come out."
                }
                -- CONTINUE HERE AND SHOW HER CHARACTER
              )
            }))
          end
        )
      end
    end
  end
)

emilia = Character(
  "Emilia",
  {
    {"Hello?",
    function() 
      gStateStack:push(PieceChainState({
        se_hello,
        es_sleepy,
        e_crumb
      }))
    end}
  }
)