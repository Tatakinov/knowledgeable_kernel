local StringBuffer  = require("string_buffer")

return {
  {
    id  = "OnBoot",
    content = [[
\1\s[-1]
\0\s[-1]
\b[0]
\_q[    ] Loading SHIORI modules.\_q\w9\_q\_l[0,]  \f[color,lime]ok\f[color,default]\n\_q
\_q[    ] Loading SAORI modules.\_q\w4\_q\_l[0,]  \f[color,lime]ok\f[color,default]\n\_q
\_q[    ] Loading variable.\_q\w6\_q\_l[0,]  \f[color,lime]ok\f[color,default]\n\_q
\_q[    ] Starting Login Service.\_q\w9\_q\_l[0,]  \f[color,lime]ok\f[color,default]\n\_q
\w9\w9
\![raise,OnLogin]
]],
  },
  {
    id  = "OnLogin",
    content = function(shiori, ref)
      local __  = shiori.var
      if __("User") then
        return [=[\![raise,OnBootCompleted]]=]
      end
      return [[
\1\s[-1]
\0\s[-1]
\_qLogin: \![open,inputbox,OnUsernameInput]\_q
]]
    end,
  },
  {
    id  = "OnUsernameInput",
    content = function(shiori, ref)
      local __  = shiori.var
      __("User", ref[0])
      return [[
\C
${User}\w9\n
\_qPassword: \_q
\_w[3000]
\![raise,OnFirstBootCompleted]
]]
    end,
  },
  {
    id  = "OnFirstBootCompleted",
    content = function(shiori, ref)
      local str = StringBuffer()
      str:append([[
\_q\b[-1]\c\_q
\0\s[にこ]\b[0]
\1\s[素]
\0
ようこそ、Linuxの世界へ！@\n
]])
      if shiori:saori("os_detect")("getOSName")() == "Linux" then
        str:append([[
\1
既にLinux使うてるみたいやで。\n
\0\s[驚き]
\n[half]
えっ……。\n
\0\s[目閉じ]
ま、まあ？@そそそんなこともあるだろうと思ってたし？@\n
\1
\n[half]
めっちゃ動揺しとるやん…。\n
\0
\n[half]
…こほん。自己紹介といこうか。\n
\n[half]
\0\s[素]
ボクは楠木。楠木梨奈(くすのき りな)。\n
こっちの鈍色っぽいのがぬーさんことぐにゅうだよ。\n
よろしくね！@\n
\1
\n[half]
よろしゅうな。\n
]])
      else
        str:append([[
\n[half]
\0\s[素]
ボクは楠木。楠木梨奈(くすのき りな)。\n
こっちの鈍色っぽいのがぬーさんことぐにゅうだよ。\n
\1\s[素]
よろしゅうな。\n
\0\s[にこ]
\n[half]
早速だけど、仮想マシンを用意してLinuxを入れる作業に入\w9\n
\1
\n[half]
こらこら。\n
\0
\s[苦笑]
\n[half]
…残念。\n
]])
      end
      return str
    end,
  },
  {
    id  = "OnBootCompleted",
    content = function(shiori, ref)
      local str = StringBuffer()
      str:append([[
\0\s[素]\b[-1]
\1\s[素]
]])
      return str
    end,
  },
  {
    id  = "OnClose",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[素]
$ systemctl poweroff\w9\w9\n
]] .. shiori:talk("終了")
    end,
  },
  {
    id  = "OnClose",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[素]
# poweroff\w9\w9\n
]] .. shiori:talk("終了")
    end,
  },
  {
    id  = "OnClose",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[素]
# halt\w9\w9\n
]] .. shiori:talk("終了")
    end,
  },
  {
    id  = "OnClose",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[ドヤッ]
$ systemctl reboot！@\n
\1
こらこら。\n
]] .. shiori:talk("終了")
    end,
  },
  {
    id  = "OnClose",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[素]
$ systemctl poweroff\w9\w9\n
\w9\w9
…あれ、終了しないね。\n
\1\s[素]
スワップインに時間が掛かっとるんやろな。\n
\0
\n[half]
じゃあもう少し喋っ
]] .. shiori:talk("終了")
    end,
  },
  {
    id  = "OnClose",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[素]
# shutdown -h -t 0\w9\w9\n
]] .. shiori:talk("終了")
    end,
  },
  {
    id  = "終了",
    content = [[
\_q
\0\s[-1]\c
\1\s[-1]\c\b[-1]
\_q
\0\b[0]
\_q[    ] Saving variable.\_q\w6\_q\_l[0,]  \f[color,lime]ok\f[color,default]\_q\n
\_q[    ] Unloading SAORI modules.\_q\w4\_q\_l[0,]  \f[color,lime]ok\f[color,default]\_q\n
\_q[    ] Unloading SHIORI modules.\_q\w9\_q\_l[0,]  \f[color,lime]ok\f[color,default]\_q\n
\w9
\_qSystem halted.\_q\n
\w9\w9
\-
]],
  },
}
