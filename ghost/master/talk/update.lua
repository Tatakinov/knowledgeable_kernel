local StringBuffer  = require("string_buffer")

return {
  {
    id  = "OnUpdateBegin",
    content = function(shiori, ref)
      if ref[3] ~= "ghost" then
        return string.format([[
\1\s[素]
\0\s[素]
# apt install %s\w9\w9\n
\_qパッケージリストを読み込んでいます...\_q\w4\_q完了\_q\n
\_q依存関係ツリーを作成しています...\_q\w5\_q完了\_q\n
\_q状態情報を読み取っています...\_q\w3\_q完了\_q\n
]], ref[3])
      end
      return [[
\1\s[素]
\0\s[素]
# apt upgrade\w9\w9\n
\_qパッケージリストを読み込んでいます...\_q\w4\_q完了\_q\n
\_q依存関係ツリーを作成しています...\_q\w5\_q完了\_q\n
\_q状態情報を読み取っています...\_q\w3\_q完了\_q\n
\_qアップグレードパッケージを検出しています...\_q\w8\_q完了\_q\n
]]
    end,
  },
  {
    id  = "OnUpdateReady",
    content = function(shiori, ref)
      local __  = shiori.var
      if ref[3] ~= "ghost" then
        return string.format([[
\C
\1\s[素]
\0\s[素]
\_q
以下のパッケージはアップグレードされます:\n
 %s\n
アップグレード: 1 個、@新規インストール: 0 個、@削除: 0 個、@保留: 0 個。@\n
続行しますか? [Y/n]\n
\_q
]], ref[3])
      end
      local str = StringBuffer()
      str:append([[
\C
\1\s[素]
\0\s[素]
\_q
]])
      local upgrade = {}
      local new     = {}
      for filename in string.gmatch(ref[1], "[^,]+") do
        local fh  = io.open(__("_path") .. '../../' .. filename, "rb")
        if fh then
          fh:close()
          table.insert(upgrade, filename)
        else
          table.insert(new, filename)
        end
      end
      if #new > 0 then
        str:append([[
以下のパッケージが新たにインストールされます:\n
 ]])
        str:append(table.concat(new, " "))
        str:append([[\n]])
      end
      if #upgrade > 0 then
        str:append([[
以下のパッケージはアップグレードされます:\n
 ]])
        str:append(table.concat(upgrade, " "))
        str:append([[\n]])
      end
      str:append(string.format([[
アップグレード: %d 個、@新規インストール: %d 個、@削除: 0 個、@保留 0 個。@\n
続行しますか? [Y/n]\n
\_q
]], #upgrade, #new))
      return str
    end,
  },
  {
    id  = "OnUpdateComplete",
    content = function(shiori, ref)
      if ref[0] == "none" then
        return [[
\C
\1\s[素]
\0\s[素]
\_q
アップグレード: %d 個、@新規インストール: %d 個、@削除: 0 個、@保留 0 個。@\n
\_q
]]
      end
    end,
  },
  {
    id  = "OnUpdate.OnDownloadBegin",
    content = function(shiori, ref)
      if ref[3] ~= "ghost" then
        return nil
      end
      return string.format([[
\C
\1\s[素]
\0\s[素]
\_q
取得:%d https://github.com/Tatakinov knowledgeable_kernel/master i386 %s\n
\_q
]], (tonumber(ref[1]) + 1), ref[0])
    end,
  },
  {
    id  = "OnUpdate.OnMD5CompareBegin",
    content = function(shiori, ref)
      if ref[3] ~= "ghost" then
        return nil
      end
      return string.format([[
\C
\1\s[素]
\0\s[素]
\_q
%s を展開する準備をしています ...\n
\_q
]], ref[0])
    end,
  },
  {
    id  = "OnUpdate.OnMD5CompareComplete",
    content = function(shiori, ref)
      if ref[3] ~= "ghost" then
        return nil
      end
      return string.format([[
\C
\1\s[素]
\0\s[素]
\_q
%s で上書き展開しています ...\n
\_q
]], ref[0])
    end,
  },
}
