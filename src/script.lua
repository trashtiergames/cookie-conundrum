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

p_buried = TextPieceState(
  "Sam",
  {
    "It's our paper trash. It's a pretty big stack by now, we should take it out sometime.",
    "Hold up, there's something that seems to have been stuffed to the bottom of the pile.",
    "Looks to be some kind of rejection letter to a job application? I don't remember applying for this."
  }
)

-- For clickables on Balcony
p_trash = TextPieceState(
  "Sam",
  {
    "There's a bunch of things in this trashcan. Chips bags, random packagings, bottles... Oh. Looks like someone cried a lot very recently."
  }
)


-- Dialogue after presenting crumbs to Emilia
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
    "I baked them yesterday evening, you must have heard, and I left them out to cool afterwards. But then I went to my room and fell asleep.",
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
        "Wake up!",
        function() 
          gStateStack:push(PieceChainState({
            p_knock,
            p_hi,
            toggleAprilShowState,
            p_goodm,
            p_def
          }))
        end
      }
    })
  end
)

p_ynight = TextPieceState(
  "Sam",
  {
    "What happened yesterday night?"
  }
)

p_heard = TextPieceState(
  "Emilia",
  {
    "I was getting ready to go to bed early. I think I went to sleep before you got started on the cookies. Or else I didn't notice.",
    "I guess I was pretty caught up in studying and applying for internships.",
    "Anyways, I went to sleep early, but I woke up in the middle of the night. April was coming home with a friend or something and I think they sat down right outside my door at the table.",
    "He didn't stay long, but they talked pretty loudly about some guy that was really rude to them. I'm surprised you didn't wake up."
  }
)

p_slept = TextPieceState(
  "Sam",
  {
    "I was so tired I must've just been completely out."
  }
)

p_culp = TextPieceState(
  "Emilia",
  {
    "Well, I fell asleep after that as well. I don't wanna accuse anyone, but both of them would've had ample opportunity to eat your cookies."
  }
)

p_guest = TextPieceState(
  "Sam",
  {
    "So, this guy... Did he stay over with April?",
  }
)

p_naw = TextPieceState(
  "Emilia",
  {
    "Hmm, I'm not really sure. I fell asleep when they quieted down. I feel like he left, though."
  }
)

-- April's first dialogues
p_knock = TextPieceState(
  "Sam",
  {
    "*KNOCK KNOCK KNOCK*",
    "Wake up, April, I really need to talk to you! I know you ate my cookies!"
  }
)

p_hi = TextPieceState(
  "April",
  {
    ". -- . -- .",
    "What?"
  }
)

p_goodm = TextPieceState(
  "April",
  {
    "Good morning to you, too.",
    "Now what's this cookie business?",
  }
)

-- Set April's menu options after first confrontation
p_def = FunctionPieceState(
  function()
    for _, char in pairs(currentLocation.characters) do
      if char.name == "April" then
        char.dialOptions = {
          {
            "My cookies are gone",
            function()
              gStateStack:push(PieceChainState({
                p_info,
                p_ok,
                p_expl,
                p_pff
              }))
            end
          },
          {
            "Yesterday night",
            function() 
              gStateStack:push(PieceChainState({
                p_ynight2,
                p_home,
                a_exbeer
              }))
            end
          }
        }
      end
    end
  end
)

-- April's dialogues after first confrontation
p_info = TextPieceState(
  "Sam",
  {
    "So I baked some cookies yesterday, which are now gone. I put them out right before I went to sleep."
  }
)

p_ok = TextPieceState(
  "April",
  {
    "Ok, what does that have to do with me? This is why I had to leave the sacred sanctuary that is my bed?"
  }
)

p_expl = TextPieceState(
  "Sam",
  {
    "Well, I didn't eat them, and there are a limited number of people who would have had the chance to do that."
  }
)

p_pff = TextPieceState(
  "April",
  {
    "I didn't do it. Can I go back to bed now?"
  }
)

p_ynight2 = TextPieceState(
  "Sam",
  {
    "What did you do yesterday night?"
  }
)

p_home = TextPieceState(
  "April",
  {
    "I came home from the bar before midnight and went straight to bed, I was super tired. The only places I went were the hallway and the bathroom."
  }
)


-- Setting April up for beer evidence
a_exbeer = FunctionPieceState(
  function()
    for _, char in pairs(currentLocation.characters) do
      if char.name == "April" then
        char:setExpectations(
          "Beer can",
          function()
            gStateStack:push(PieceChainState({
              p_can,
              p_candef
            }))
            char.dialOptions = {
              {
                "Jimmy",
                function() 
                  gStateStack:push(PieceChainState({
                    p_jimmy
                  }))
                end
              },
              {
                "The cookies",
                function() 
                  gStateStack:push(PieceChainState({
                    p_cookies,
                    p_notme
                  }))
                end
              },
              {
                "See anything?",
                function() 
                  gStateStack:push(PieceChainState({
                    p_see,
                    p_gttp,
                    p_sound,
                    e_denial
                  }))
                end
              }
            }
          end
        )
      end
    end
  end
)

p_can = TextPieceState(
  "Sam",
  {
    "You said you went straight to bed?",
    "Then how do you explain this beer can that was on the table?? Plus, Emilia said she heard you talking to some guy? You're trying to cover something up!"
  }
)

p_candef = TextPieceState(
  "April",
  {
    "Ugh. Try to keep one thing to yourself in this apartment. Can't believe Emilia immediately ratted me out.",
    "Ok, I was having a drink with Jimmy. But I swear I didn't eat your cookies. I can explain."
  }
)

-- Dialogue options after presenting the beer to April
p_jimmy = TextPieceState(
  "April",
  {
    "Alright. So I did come in here with Jimmy after the night out, and it might have been a little late. But we just sat down because I needed to vent about today.",
    "We shared a beer and bitched about this guy at the bar for a while. I'll spare you the details, but he was fucking rude. I saw that you had cookies cooling on the tray, but didn't touch them.",
    "Anyways, Jimmy left after a short while and I went to sleep."
  }
)

p_cookies = TextPieceState(
  "Sam",
  {
    "Just so I have that on record, neither you nor Jimmy ate any cookies?"
  }
)

p_notme = TextPieceState(
  "April",
  {
    "Even if I was hangry, I wouldn't be dumb enough to just eat my roommate's cookies and leave an empty tray out.",
    "So no, I didn't eat your cookies. Jimmy did ask about them, but I told them they're not mine, so he didn't eat any either.",
    "Something else happened though that you should know about."
  }
)

p_see = TextPieceState(
  "April",
  {
    "I cannot believe Em would throw me under the bus like that. I was trying to cover for her, but it seems like she can't solve this without blaming me.",
  }
)

p_gttp = TextPieceState(
  "Sam",
  {
    "Alright, get to the point. What did you see."
  }
)

p_sound = TextPieceState(
  "April",
  {
    "I didn't see anything, but I did hear something after I went to my room. Em went out to the balcony to cry. I heard her storm out of her room and open the balcony door.",
    "I was not in a state to deal with it, and I was already basically asleep, so I just kinda passed out.",
    "But if you ask me, she was probably upset about something and ate your cookies, and then tried to pin the whole thing on me."
  }
)

-- New options for Emilia
e_denial = FunctionPieceState(
  function()
    emilia.dialOptions  = {
      {
        "You cried yesterday?",
        function()
          gStateStack:push(PieceChainState({
            p_cried,
            p_nocry,
            p_any,
            a_extis
          }))
        end
      }
    }
  end
)

p_cried = TextPieceState(
  "Sam",
  {
    "Hey Em. Interesting, April says she did not eat the cookies, but she did hear you cry late at night. You didn't mention that when we were talking earlier!"
  }
)

p_nocry = TextPieceState(
  "Emilia",
  {
    "Pfff, sounds to me like April is just trying to shift the blame away from herself. I did not cry yesterday.",
    "You're seriously suspecting me?"
  }
)

p_any = TextPieceState(
  "Sam",
  {
    "It's anyone's game at this point."
  }
)

-- Set up Emilia for tissues evidence
a_extis = FunctionPieceState(
  function()
    emilia:setExpectations(
      "Tissues",
      function()
        gStateStack:push(PieceChainState({
          p_tis,
          p_tisdef,
          a_exlet
        }))
        emilia.dialOptions = {
          {
            "Crying",
            function() 
              gStateStack:push(PieceChainState({
                p_tisdef
              }))
            end
          }
        }
      end
    )
  end
)

-- Dialogue with Emilia after being presented with tissues evidence
p_tis = TextPieceState(
  "Sam",
  {
    "You said you didn't cry yesterday night? Can you you explain how these tissues ended up in the balcony trash can, the exact spot where April said you went to cry??"
  }
)

p_tisdef = TextPieceState(
  "Emilia",
  {
    "You found some tissues? That's your proof? They're not from me, even if you found them on the balcony, they could just as well be yours. Why would I even be crying?"
  }
)

-- Set Emilia up to expect the rejection letter as evidence
a_exlet = FunctionPieceState(
  function()
    emilia:setExpectations(
      "Letter",
      function()
        gStateStack:push(PieceChainState({
          p_letter,
          p_admit,
          p_move,
          p_tokit,
          p_recap,
          p_itsok,
          p_why,
          p_retrace,
          p_cons,
          p_letsgo,
          p_bye,
          p_end,
          p_fin
        }))
      end
    )
  end
)

-- Dialogue after presenting the letter
p_letter = TextPieceState(
  "Sam",
  {
    "I found the reason you cried, Em. Your application got rejected, right? I found it buried in the paper trash."
  }
)

p_admit = TextPieceState(
  "Emilia",
  {
    ". -- . -- .",
    "Yes.",
    "Ok, I admit it, I did it! I ate your cookies! I'm really really sorry, ok? I had a fucking terrible night yesterday."
  }
)

p_move = TextPieceState(
  "Sam",
  {
    "Oh, Em. I'm sorry. Should we talk it over in the living room?"
  }
)

p_tokit = FunctionPieceState(
  function()
    currentLocation = locations.kitchen
    locations.kitchen.characters = {emilia, april}
    table.remove(locations.emilias_door)
    table.remove(locations.aprils_door)
  end
)

-- Ending in kitchen
p_recap = TextPieceState(
  "Emilia",
  {
    "It was me. I'm sorry I ate your cookies. They just looked too delicious and I couldn't help myself. I shouldn't have done that.",
    "And April, I'm sorry I blamed you. I don't know what I expected Sam to think when I told her it wasn't me.. obviously you would be suspicious."
  }
)

p_itsok = TextPieceState(
  "April",
  {
    "Yeah, that was not cool man. I missed some prime beauty sleep."
  }
)

p_why = TextPieceState(
  "Sam",
  {
    "So what exactly happened yesterday?"
  }
)

p_retrace = TextPieceState(
  "Emilia",
  {
    "Well, it started with the letter you found. It was sort of a dream internship and it's been the third rejection letter this week.",
    "After I studied for the finals all day, it all kind of boiled over. I went outside to the balcony to blow off some steam and get some fresh air.",
    "I stayed out there for a while, and when I came back, I noticed the smell of your cookies. It smelled so good! Anyways, the rest is history.",
    "I hid the letter so you wouldn't suspect me and went to bed."
  }
)

p_cons = TextPieceState(
  "Sam",
  {
    "It's ok, Em. I didn't realize you're feeling so crap. How about we get started on another batch together?"
  }
)

p_letsgo = TextPieceState(
  "Emilia",
  {
    "That sounds nice."
  }
)

p_bye = TextPieceState(
  "April",
  {
    "Hooray for you guys. I'm going back to sleep. Byeee!"
  }
)

p_end = TextPieceState(
  "",
  {
    "And so Emilia and Sam got along again and good vibes returned to the apartment."
  }
)

p_fin = FunctionPieceState(
  function()
    gStateStack:push(EndState())
  end
)