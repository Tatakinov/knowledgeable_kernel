return {
  {
    id  = "m_Key",
    content = function(shiori, ref)
      return shiori:talk("OnMenu")
    end,
  },
  {
    id  = "OnMenu",
    content = [[
\0\s[素]
\![*]\q[何か話して,OnTalkRandom]\n
\![*]\q[設定,OnSetting]\n
\n
\n
\n
\n
\n
\n
\![*]\q[閉じる,OnCloseMenu]\n
]],
  },
  {
    id  = "OnCloseMenu",
    content = nil,
  },
  {
    id  = "OnTalkRandom",
    content = function(shiori, ref)
      return shiori:talkRandom()
    end,
  },
  {
    id  = "OnSetting",
    content = function(shiori, ref)
      local __  = shiori.var
      local interval  = __("TalkInterval") or 120
      if ref[0] == "interval" then
        local t = {
          [60]  = 120,
          [120] = 180,
          [180] = 300,
          [300] = 60,
        }
        interval  = t[interval]
        __("TalkInterval", interval)
      end

      return string.format([[
\_q
\0\s[素]
トーク間隔\_l[120]%d秒\_l[200]\q[【変更】,OnSetting,interval,%d]\n
\n
\n
\n
\n
\n
\n
\n
\![*]\q[閉じる,OnCloseMenu] \![*]\q[戻る,OnMenu]\n
\_q
]], interval, interval)
    end,
  },
}
