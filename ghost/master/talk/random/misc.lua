return {
  {
    id  = "0Poke",
    content = function(shiori,ref)
      return shiori:talk("OnTalkRandom")
    end,
  },
  {
    id  = "t_Key",
    content = function(shiori,ref)
      return shiori:talk("OnTalkRandom")
    end,
  },
  {
    id  = "OnTalkRandom",
    content = function(shiori,ref)
      return shiori:talkRandom()
    end,
  },
}
