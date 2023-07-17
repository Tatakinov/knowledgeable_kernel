return {
  {
    content = [[
\1\s[素]
\0\s[素]
「type」は引数に取った文字列をコマンドとして実行するとしたら
何を呼び出すのかを表示するコマンドだよ。\n
\1
whichの強化版やね。\n
コマンドがどこにあるか分かる以外に、
aliasやfunctionなんかも解釈して表示出来るのが強みやで。\n
\0\s[困った]
\n[half]
じゃあ、whichはいらない子…？@\n
\1
\n[half]
whichはコマンドのある場所だけを出力することで\n
$ ldd $(which python)\n
みたいなことが出来るから、用途しだいやね。\n
\0\s[ヮ]
\n[half]
良かった！いらない子じゃなかった！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「import」は画面のスクリーンショットを撮るよ。\n
\1
画面全体かウィンドウ、任意から選べるで。\n
\0
\n[half]
基本的には出力ファイル名で保存形式が決まるので拡張子を忘れずにね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「file」はファイルの形式を調べるコマンドだよ。\n
\1
わかりやすく言うと極窓やね。\n
\0
\n[half]
ご…何て？@\n
\1
\n[half]
そうか…梨奈は極窓知らんのやな…。\n
これも時代の流れか…。\n
\0
\s[おこ]
\n[half]
えっ、ちょっ、一人で感傷に浸らないで教えて！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「man」はコマンドやライブラリの関数の
詳細なヘルプを調べるコマンドだよ。\n
知ってるつもりのコマンドでも調べてみると新たな発見があるかもね。\n
\1
……時々英語だったりするけどな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「grep」は正規表現にマッチした箇所を表示するよ。\n
\1
テキストを検索したり、長いログから特定の言葉を含む部分のみを抽出したりと、
使い方は様々やね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「sed」はテキストの置換を行うコマンドだよ。\n
\1
「s/*/*/」の記法は他でも使う機会があるから覚えておいて損は無いな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「nkf」は日本語の文字コードや改行コードの変換を行ってくれるよ。\n
\1
文字コード変換は他にiconvがあるんやけど、
変換元の文字コードを指定しなくて良い分こっちの方が楽やね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「sort」は入力された文字列を行単位でソートする(並び替える)よ。\n
\1
$ du -sh | sort -h\n
としてファイルサイズの小さい順に表示したり、\n
$ command | sort -u\n
としてソートついでにuniqueにしてみたり…使い道は色々やね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「find」はファイルやディレクトリの検索が出来るよ。\n
\1
検索オプションは名前や作成日時、ファイルのみ/ディレクトリのみなど
沢山あるでな。\n
\0
\n[half]
execオプションも便利だよね！@\n
\1
\n[half]
そやね。\n
-printしてxargsを呼び出す必要がなくなったんは良きかな、良きかな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「conky」はCPUの温度や使用率、メモリ使用率、
現在時刻なんかを表示してくれるよ。\n
\1
背景に表示しておくと便利やね。\n
\0
\n[half]
GUI版とCUI版の2種類あるのでインストールする時は間違わないようにね！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「Visual Studio Code」はクロスプラットフォームかつ高機能なエディタだよ。\n
\1
プラグインも豊富やから小難しいことやるなら是非入れておきたいところやね。\n
しかもなんと！@\n
\0
\n[half]
なんと？@\n
\1
\n[half]
YAYAの辞書やsurfaces.txtが見やすくなるプラグインなんかもあるんや！@\n
\0\s[にこ]
\n[half]
すごい！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「diff」は2つのファイル/ディレクトリ間の差分を取るコマンドだよ。\n
\1
基本的にはテキストファイル群…プログラムのソースコードやドキュメント
なんかに対して使うもんやね。\n
世に出回ってる(Linux界隈の)パッチは
このプログラムで出力される形式のものが多いな。\n
プログラムへのパッチじゃなくソースコードへのパッチなのがポイントやね。\n
\0
\n[half]
対になるコマンドが「patch」で、名前の通りパッチを当てるコマンドだよ。\n
\1
\n[half]
$ diff -u foo.txt bar.txt > hoge.patch\n
したものを\n
$ patch -Np0 < hoge.patch\n
して使う感じやな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「top」はプロセスのリソース使用状況を見られるコマンドだよ。\n
\1
色んな使い方があるけど、
CPU使用率を調べたりメモリ使用量を調べたりするのが主な用途やね。\n
]],
  },
}
