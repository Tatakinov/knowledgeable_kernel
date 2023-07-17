local ReadElf = require("talk._readelf")

return {
  {
    id  = "0BustNade",
    content = [[
\1\s[素]
\0\s[目閉じ]
Permission denied、だよ。\n
]],
  },
  {
    id  = "0BustPoke",
    content = function(shiori, ref)
      local __  = shiori.var
      local success, name = pcall(ReadElf, __("_path") .. "liblightningmomer.so.1")
      if success then
        if name == "grope" then
          return [[
\1\s[素]
\0\s[おこ]
へ、変態だーーーーー！！！\n
]]
        else
          return [[
\0\s[目閉じ]
knowledgeable_kernel: symbol lookup error: knowledgeable_kernel: undefined symbol: grope、だよ。\n
]]
        end
      else
        print(name)
        if string.match(name, "ELF class") then
          return [[
\0\s[目閉じ]
error while loading shared libraries: liblightningmomer.so.1: wrong ELF class: ELFCLASS64、だよ。\n
]]
        else
          return [[
\0\s[目閉じ]
error while loading shared libraries: liblightningmomer.so.1: cannot open shared object file: No such file or directory、だよ。\n
]]
        end
      end
    end,
  },
}
