return {
  -- ここからSHIORIの情報なので弄らない
  {
    passthrough = true,
    id  = "version",
    content = "1.0.4",
  },
  {
    passthrough = true,
    id  = "craftman",
    content = "Tatakinov",
  },
  {
    passthrough = true,
    id  = "craftmanw",
    content = "タタキノフ",
  },
  {
    passthrough = true,
    id  = "name",
    content = "Kagari_Kotori",
  },
  -- ここまで
  {
    passthrough = true,
    id  = "username",
    content = function(shiori, ref)
      local __  = shiori.var
      return __("User") -- 直接content=__("User")だと動的にならない。
    end,
  },
  {
    passthrough = true,
    id  = "sakura.recommendsites",
    content = function(shiori, ref)
      return shiori:createURLList(
        {
          {"Debian JP Project", "https://www.debian.or.jp/"},
          {"Ubuntu", "https://jp.ubuntu.com/"},
          {"The CentOS Project", "https://www.centos.org/"},
          {"Arch Linux JP Project", "https://www.archlinux.jp/"},
          {"-", "-", "-"},
          {"ArchWiki", "https://wiki.archlinux.jp/index.php/%E3%83%A1%E3%82%A4%E3%83%B3%E3%83%9A%E3%83%BC%E3%82%B8"},
        })
    end,
  },
  {
    passthrough = true,
    id  = "vanishbuttoncaption",
    content = [[apt purge knowledgeable-kernel]]
  },
  {
    passthrough = true,
    id  = "balloon_tooltip",
    content = function(shiori, ref)
      if ref[1] then
        return shiori:talk(ref[1] .. "_tooltip")
      end
      return nil
    end,
  },
}
