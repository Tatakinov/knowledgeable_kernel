return {
  {
    id  = "OnInstallBegin",
    content = [[
\1\s[素]
\0\s[素]
# dpkg -i hogehoge.deb
]],
  },
  {
    id  = "OnInstallComplete",
    content = [[
\1\s[素]
\0\s[素]
インストールに成功したよ。
]],
  },
  {
    id  = "OnInstallFailure",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[おこ]
debじゃないじゃん！\w9\w9
\1
Error: ]] .. ref[0] .. [[\n
らしいで。
]]
    end,
  },
  {
    id  = "OnInstallRefuse",
    content = function(shiori, ref)
      return [[
\1\s[素]
\0\s[おこ]
debじゃなくてrpmだこれー！\w9\w9
\1
]] .. ref[0] .. [[
宛らしいで。
]]
    end,
  },
}
