return {
  {
    content = [[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1
$ find . -type f -name "?*.txt" -exec sed -i -e 's/ふいんき/ふんいき/g' {} \\;\n
\0\s[素]
\n[half]
カレントディレクトリ以下のtxtファイル内の
「ふいんき」を「ふんいき」に置換するよ。\n
]],
  },
  {
    -- 値に「,」が入ってるとうまく動作しないけど…
    content = [[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1
$ < input.csv cut -f3,5 -d ',' | sort -t ',' -k 2\n
\0\s[素]
\n[half]
input.csvの3列目と5列目のみを抽出して5列目の値でソートしたものを出力するよ。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1
$ find . -type f -name "?*.txt" -exec grep -n "OnSecondChange" {} \\+\n
\0\s[素]
\n[half]
カレントディレクトリ以下の「ほにゃらら.txt」の
「OnSecondChange」が含まれる行をリストアップするよ。\n
どのファイルの何行目にあるかまで分かるおまけ付き！@\n
\1
\n[half]
実用上は\n
$ grep -nr "OnSecondChange" .\n
の方が楽でええかもな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1
$ for i in {0 .. 50}; do mv surface\${i}.png surface$(printf "%03d" $i).png; done
\0\s[素]
\n[half]
surface0.png、surface1.png、…、surface50.pngを\n
surface000.png、surface001.png、…、surface050.pngへリネームするよ。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1
$ cp /path/to/text.txt{,.bak}\n
\0\s[素]
\n[half]
ファイルのバックアップを取るよ。\n
\1
\n[half]
カレントディレクトリ以外のファイルに対しても使えるのがポイントやね。\n
]],
  },
  {
    content = [=[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1]=] ..
string.gsub([[$ sed -i -e 's/.*/&\r/g' input.txt]], [[\]], [[\\]])
.. [[\n
\0\s[素]
\n[half]
LFなファイルの改行コードをCRLFへ変更するよ。\n
\1
\n[half]
Windowsで開いたときにちゃんと改行されるようになるんやね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1
$ ls 2022_0[4-8]_*.txt\n
\0\s[素]
\n[half]
2022年の4月〜8月に作られたファイルをリストアップするよ。\n
\1
\n[half]
前提としてファイルを「yyyy_mm_dd_ほにゃらら.txt」という形式で
保存している必要があるけどな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[ドヤッ]
ワンライナー紹介コーナー！@\n
\1
$ for i in *.wav; do ffmpeg -i $i \${i%.*}.mp3; done\w9\w9\n
\0\s[素]
カレントディレクトリの○○.wavを○○.mp3に変換するよ。\n
\1
「bash 変数展開」でググれば色々出てくるでな。\n
]],
  },
}
