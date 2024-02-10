return {
  {
    content = [[
\1\s[素]
\0\s[素]
$ ls -l `which ruby`\n
ってするとwhich rubyの実行結果を引数にlddが実行できるよ。\n
\1
内部的には\n
$ ls -l `which ruby`\n
        ↓\n
$ ls -l /usr/bin/ruby\n
が行われているってことやね。\n
ただ、``で囲むより$()で囲んだ方がネスト出来てええな。\n
\0\s[ドヤッ]
\n[half]
$ ls -l $(which ruby)\n
こうだね！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
bashのalias機能ってどんな時に使うの？@\n
\1
ワンライナーほどのことはやらんけど、いちいちコマンド打つのが面倒な時やね。\n
alias ll='ls -lh'\n
alias wine='WINEDEBUG=-all wine'\n
こんな感じに。\n
\0
\n[half]
複雑なことをやりたい時は？@\n
\1
\n[half]
aliasを使わずにfunctionで関数を定義するんが普通。\n
function mc() { mkdir $1 && cd $1; }\n
みたいに。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[困った]
コマンドの出力先をroot権限のファイルにしようと思って\n
$ sudo command > /path/to/output.txt\n
ってしたんだけど、sudoしてるのに「許可がありません」って出ちゃった…。\n
\1
commandにはsudoの効果がのるけど、> /path/to/output.txtの部分はシェルが処理を行っとるからsudoの効果が及ばんのや。\n
\n[half]
$ command | sudo tee /path/to/output.txt >/dev/null\n
や\n
$ sudo sh -c 'command > /path/to/output.txt'\n
などとすればうまくいくはずや。\n
]],
  },
  {
    -- bashの場合。
    content = [[
\1\s[素]
\0\s[素]
コマンドの説明する時って、\n
$ foo input.txt\n
みたいに書かれてるけど、この「$」って何者？@\n
\1
プロンプトと呼ばれるものやね。\n
デフォルトは\n
ユーザー名@ホスト名:カレントディレクトリ$\n
になっていて、環境変数PS1を弄ることで変えられるで。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
コマンドの説明で\n
$ foo input.txt | bar output.txt\n
みたいな感じで書いてある時のあの「|」とは！@\n
\1
パイプライン(パイプ)やね。\n
fooコマンドの出力結果をbarに入力している感じになるな。\n
\0
\n[half]
中間ファイルを作らずに済むので、途中で大きなファイルを作ってしまう場合
なんかに有用だよ。\n
\1
\n[half]
テキスト処理をするコマンドなら大体のものはパイプに対応しているはずや。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
ぬーさん、標準エラー出力だけパイプを使いたい場合ってどうすればいいかな？@\n
\1
$ foo 2>&1 >/dev/null | bar\n
とすれば出来るで。\n
2>&1と>/dev/nullの順番はこれやないと意味が無いから気をつけてな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
$ < text.txt sed -e 's/うかがか/伺か/g > text.txt'\n
\w9\w9
text.txtの「うかがか」を「伺か」に変換してる…ように見えるけど
これだとうまく動かないんだ。\n
\1
リダイレクトがプログラム起動より先に行われるからやね。\n
\0
\n[half]
処理の順番としては、\n
1. 読み込み用、書き込み用にtext.txtを開く\n
2. sedを起動する\n
となっていて、1番の書き込み用にtext.txtを開いた時点で
ファイルの中身が空っぽになってしまい、
2番でsedは空っぽのファイルを読み込むようになってしまうというわけ。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
sedやperlで文字列置換を行うときの正規表現の部分は\n
"(ダブルクオート)じゃなくて\n
'(シングルクオート)で囲った方がいいよ。\n
こんな感じに。\n
$ sed -e 's/^SEKIRO$/SERIKO/g'\n
\w9\w9
\1
正規表現内で\\とか$とか使うからやね。\n
ダブルクオートだとエスケープされたり変数展開されたりするでな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
シェルには特殊変数$?っていうのがあって、
直前に実行したコマンドの戻り値が入っているんだ。\n
\1\s[素]
$ echo $?\n
なんかで確認出来るで。\n
\0
\n[half]
「直前の」というのがミソで、間に別のコマンドを挟んでしまうと
得られる値が変わる可能性があるから注意だね。\n
\1
\n[half]
$ false\n
$ echo $?\n
$ echo $?\n
なんかが一例やね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
command1とcommand2の出力結果をcommand3で処理するときに\n
$ command1 > output1.txt\n
$ command2 > output2.txt\n
$ cat output1.txt output2.txt | command3\n
と書けるものであれば、\n
$ (command1; command2) | command3\n
と書くことが出来るよ。\n
\1
グループコマンドと呼ばれるやつやね。\n
\0
\n[half]
一時ファイルを作らなくて済むし見た目も綺麗だよね！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
コマンド名や引数にファイル名を入力するとき、
TABキーを押すと補完されるのは知ってる？\n
\1
便利よな。\n
\0
\n[half]
その機能をさらに便利にするために！@\n
bash-completionをインストールしよう！@\n
\1
\n[half]
もしかしたら既に入っとるかもな。\n
\0
\n[half]
説明しよう！@bash-completionとは！@\n
コマンドのオプション名も補完できるようになったり、
sshならリモートのホスト名が補完出来るようになったりと、
通常では補完出来なかったものまで出来るようになる凄いパッケージなのだ！@
\1
\n[half]
systemctlとかの長ったらしいオプションもこれで一発やね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
カレントディレクトリのファイルを全部消す時に\n
$ rm -r *\n
とやりがちだけど、
別のターミナルにフォーカスがある状態で実行してしまうと大変危険なので
\s[落ち込み]
注意…@しようね…@。\n
\1
消すときは一個上のディレクトリに移動してフォルダを指定して消すようにするのがええな。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
ディレクトリを再帰的に走査してコマンドを実行するのに\n
$ find . -name "*.txt" -exec command {} \\+\n
とするのが面倒なら\n
$ shopt -s globstar\n
しておけば\n
$ command **/*.txt\n
で同じ結果が得られるよ。\n
\1
毎度shoptを実行するのが面倒なら.bashrcに書いておくんやで。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
「[](角括弧)」と「{}(波括弧)」の違いって何？@\n
\1
「[]」は存在するファイル/ディレクトリ名だけ展開して、
「{}」は全部展開するようになってるな。\n
\n[half]
例えば、1.txt、2.txt、3.txtとファイルがあったときに、\n
$ echo [12345].txt\n
は\n
1.txt 2.txt 3.txt\n
と出力されて、\n
$ echo {1,2,3,4,5}.txt\n
は\n
1.txt 2.txt 3.txt 4.txt 5.txt\n
と出力されるんや。
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
カレントディレクトリにあるコマンドって
実行する時に\n
$ ./hoge\w9\w9\n
みたいに「./」をつけないと実行出来ないのってなんでだろ？@\n
\1
「./」をつけずに実行出来てしまうと、特にスクリプトなんかで、
実行結果がカレントディレクトリにあるコマンドに
左右されかねないからとちゃうか。\n
あと、「./」をつけなくても実行できてしまうと、逆に
PATH内にあるコマンドを呼び出したい時にいちいち\n
$ /usr/bin/command ...\w9\w9\n
みたいにしないといけない方が面倒ってのもあるかもな。\n
\0\s[おこ]
\n[half]
むむむ、たしかにそれは嫌かも。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
txtファイルだけコマンドの引数に与えたい時に\n
$ command *.txt\w9\w9\n
なんてすることがあるけど、その「*」のことをワイルドカードと呼ぶよ。\n
\1
「?」が任意の一文字、「*」が任意の長さ0以上の文字列に対応するで。\n
\0
\n[half]
「[]」や「{}」とは同時に使えないからうまく使い分けようね！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
ワイルドカードを展開せずにコマンドの引数に渡したい時は
クオートで囲むかバックスラッシュをつければOKだよ。
\1
ワイルドカード以外に、「-」「!」「 」辺りも同じやね。\n
実用上はクオートで囲むことが多いんとちゃうかな。\n
]],
  },
}
