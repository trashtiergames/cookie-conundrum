-- Opening
p_night = TextPieceState(
  "???",
  {
    "Oh man. What a night…",
    "…",
    "What are those?",
    "…",
    "I really need this right now.",
    "crunch crunch crunch",
    "CRUNCH CRUNCH CRUNCH"
  },
  {
    messageColor = {1, 1, 1, 1}
  }
)

p_samsr = MovePieceState("sams_room")

p_wake = TextPieceState(
  "Sam",
  {
    "*yawn*",
    "Oh? Did I fall asleep like this yesterday?",
    "I left those cookies out to cool yesterday, I should really put them away before anything happens to them.",
    "I should MOVE to the kitchen."
  }
)

p_disc = TextPieceState(
  "Sam",
  {
    "What the-- FUCK???",
    "What happened to my cookies??",
    ". -- . -- .",
    "Jesus, they're basically all gone.",
    "There was nobody else here over night, at least as far as I know...",
    "So either April or Em must have helped themselves to a little late night snack.",
    "I should probably INVESTIGATE a little bit and then go and TALK to April and Em at their doors.",
  }
)

p_test = TextPieceState(
  "Sam",
  {
    "Wow! I did a test!",
    "Appears that there is an item hidden behind this beautiful painting."
  }
)

p_ttest = TextPieceState(
  "Sam",
  {
    "Wow! You clicked a button HOLY SHIT!"
  }
)

-- For clickables in Sam's Room
p_paint = TextPieceState(
  "Sam",
  {
    "One of my proudest works."
  }
)

-- For clickables in Kitchen
p_crumbs = TextPieceState(
  "Sam",
  {
    "I definitely put my whole tray of cookies out to cool here yesterday."
  }
)

p_presc = TextPieceState(
  "Sam",
  {
    "I should PRESENT the evidence of the crime to the others."
  }
)

p_beer = TextPieceState(
  "Sam",
  {
    "Looks like someone had a couple drinks here. There's two cans of 'Round Seal Ale'. Only one of them has been opened."
  }
)

p_lipst = TextPieceState(
  "Sam",
  {
    "Emilia doesn't use this color, so it's probably April's lipstick."
  }
)

-- For clickables on Balcony
p_trash = TextPieceState(
  "Sam",
  {
    "There's a bunch of things in this trashcan. Chips bags, random packagings, bottles... Oh. Looks like someone cried a lot very recently."
  }
)


-- After presenting crumbs to Emilia

p_ate = TextPieceState(
  "Sam",
  {
    "As you can see, someone inflicted a horrible tragedy upon this shared apartment, and more importantly, my breakfast."
  }
)

p_brekki = TextPieceState(
  "Emilia",
  {
    "You were gonna eat cookies for breakfast?"
  }
)

p_rlytho = TextPieceState(
  "Sam",
  {
    "Don't interrupt!",
    "I baked them yesterday evening, you must have heard, and I left them out to cool afterwards. But then I went to my room and feel asleep.",
    "Did you eat them? Or did you see who ate them?"
  }
)

p_noate = TextPieceState(
  "Emilia",
  {
    "No, I didn't even notice you were baking something honestly. I went to bed pretty early because I have to study a ton today.",
    "Which I will hopefully be getting back to soon.",
    "I did wake up during the night when April came home drunk, so I think you'll have your prime suspect there."
  }
)

p_wakey = FunctionPieceState(
  function()
    setTalkOptions("April", {
      {
        "Did you eat my cookies?",
        function() 
          gStateStack:push(PieceChainState({
            p_hi
          }))
        end
      }
    })
  end
)

-- April's response to accusations (TODO)
p_hi = TextPieceState(
  "April",
  {
    "Yo good morning.",
    "This is a test largely, I still have to wake up properly man."
  }
)