return {
  {
    id  = "OnUserInputCancel",
    content = function(shiori, ref)
      if ref[0] == "OnUsernameInput" then
        return [=[\![raise,OnLogin]]=]
      end
    end,
  },
}
