return {
  {
    content = [[
\1\s[素]
/proc/PID/はそのPIDのプロセスの情報が載ってるで。\n
\0\s[素]
どんな時に使うの？@\n
\1
\n[half]
直接何かするっていうよりは、プログラムがここを参照して何かするって感じやな。\n
実行されたプログラムが自分がどこで実行されたかを取得したり、
自分のプログラム名で挙動が変わったり。
\0
\n[half]
ほえ〜\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
/dev/nullって何者なの？@\n
ぬるぽ？@\n
\1
ｶﾞｯ\w9\w9\n
……やのうて、何かと便利な特殊デバイスやね。\n
主に標準出力やエラー出力を端末に表示させたくない時に使う。\n
\0
\n[half]
例えば？@\n
\1
\n[half]
$ grep "てすと" * 2>/dev/null\n
とかやね。\n
*にはディレクトリも含まれる場合があってgrepがエラーを出すけど、
それを抑制する形になっているんや。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
/dev/zeroって何者？@\n
\1
延々と0x00を出力し続ける特殊デバイスやね。\n
突然100MBのファイルを作りたくなった時や、
ファイルを完全に削除したい時などに使うんや。\n
…もっとも、後者はshredを使うことの方が多いけどな。\n
]],
  },
  {
    content = [[
\1\s[素]
そういえば、以前ルイズコピペを垂れ流すデバイスを作った人がいたな。\n
\0\s[苦笑]
えぇ…@。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
スクリプトの先頭の\n
#!/bin/sh\n
とか\n
#!/usr/bin/python\n
とかって何者？@\n
\1
Shebangやね。\n
そのファイルをどのプログラムで実行するかが書かれているんや。\n
プログラムは絶対パスで記述しないとダメだから注意やな。\n
\0
\n[half]
環境によってはプログラムが/usr/bin以下に無いこともありそうだけど、
そういうのに対応したいときはどうすれば良いのさ？@\n
\1
\n[half]
#!/usr/bin/env python\n
みたいに書けば対応出来るな。\n
\0
\n[half]
($ man env)\w9\w9\n
env本来の使い方というよりハック的な感じだね。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
なんかsof-audio-pci-intel辺りでエラー吐いてフリーズするんだけど、
ぬーさんは何か解決方法知らない？@\n
\1
根本的な解決方法は分からんけど、
snd-intel-dspcfgのdsp_driverを1にすると回避出来るかもしれんな。\n
試してみて大丈夫そうなら/etc/modprobe.d/にファイル作って書いておくんやで。\n
\0
\n[half]
はーい。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[困った]
ぬーさん…。\n
\1
何や。\n
\0
\n[half]
実はボク、親が亡くなってるんだ…。\n
\1
\n[half]
そうだったんか…。\n
\0
\n[half]
今はsystemdさんの養子になっていて…。\n
\1
\n[half]
うん…うん？@\n
\0\s[ドヤッ]
\n[half]
神様になっちゃった！！！@\n
\1\s[開眼]
\n[half]
デーモンやんけ！@\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
Windowsの実行ファイルを実行するときに\n
$ wine hoge.exe\n
って呼び出すけど、ネイティブの実行ファイルと同じように\n
$ ./hoge.exe\n
って呼び出せるようにならない？@\n
\1
binfmtを使うんや。説明は割愛。\n
\0\s[おこ]
えぇー。\n
\1
systemdかsysvinitかで話が変わってくるでな。\n
いやー、説明したいんやけどなー。残念やわー。\n
\0\s[--]
(絶対に面倒くさいだけなやつだ…@！)\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
Linux6.1でRustをサポートしたんだって。\n
まだkernelの機能すべてを使えるわけではないみたいだけど。\n
\1
UbuntuとかFedora辺りで簡単に試せるっぽいな。\n
\0
\n[half]
試すの？@\n
\1
\n[half]
Rust全然わからん。
\0\s[苦笑]
\n[half]
あー…。\n
]],
  },
  {
    content = [[
\1\s[素]
\0\s[素]
CPUがpae命令に対応していればpaeカーネルが使えるとかなんとか。\n
\1
古めのPCで32bitしか対応してなくてもメモリ上限が4Gを超えて使える機能やね。\n
とはいえ32bitオンリーのマシンはいい加減買い換えた方がええんとちゃうか。\n
\0
\n[half]
いやでもほらサーバー利用とかで延命を…。\n
\1
\n[half]
ラズパイでええやろ。\n
\0\s[--]
\n[half]
圧倒的正論…！@\n
]],
  },
}
