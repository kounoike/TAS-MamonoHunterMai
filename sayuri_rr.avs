# 魔物ハンター舞　佐祐理モード
# サムネ候補
# 05m 54s 483ms さゆりん＆たい焼きおやじ
# -500 [ms]音ズレ対策値 AviSourceにしたら変わるかなぁ？
# 40084F, 11:08.07 rr2849

# プラグイン（拡大縮小用）
LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\nnedi3.dll")
LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\warpsharp.dll")
#LoadPlugin("C:\Program Files (x86)\AviSynth 2.5\plugins\framenumber.dll")

# 字幕色設定
global halocolor = $40000030
global textcolor = $7cfc00


function WriteText(clip m, string text, int firstframe, int "contframe")
{
    contframe = default(contframe, 150)

    mv = Subtitle(m, text, align = 2, lsp = 20, spc = 0, \
        font = "メイリオ", size = 28, \
        first_frame = firstframe, last_frame = firstframe + contframe, \
        text_color = textcolor, halo_color=halocolor )
    return mv
}

function WriteText2(clip m, string text, int firstframe, int "contframe")
{
    contframe = default(contframe, 180)
    # 640x360
    # ypos = 328

    # 640x480
    ypos = 454

    mv = Subtitle(m, text, x = -1, y = ypos, lsp = 0, spc = 0, \
        font = "メイリオ", size = 28, \
        first_frame = firstframe, last_frame = firstframe + contframe, \
        text_color = textcolor, halo_color=halocolor )
    return mv
}


# ムービー
#m = DirectShowSource("C:\Games\mai\avi\sayuri.avi")
m = AviSource("C:\Games\mai\avi\sayuri.avi")
snd = WavSource("C:\Games\mai\avi\sayuri_snd.avi")
m = AudioDub(m, snd)

# トリミング：寸劇前
#m = Trim(m,0,51199)
# トリミング：寸劇後
m = Trim(m, 0, 55020)



# 640x360
#m = nnedi3_rpow2(m, rfactor = 2, nsize = 4, nns = 0, qual = 1, cshift = "LanczosResize", fwidth = 480, fheight = 360, ep0 = 4)
#m = AddBorders(m, 80, 0, 80, 0)

# 640x480
m = nnedi3_rpow2(m, rfactor = 2, nsize = 4, nns = 0, qual = 1, cshift = "LanczosResize", fwidth = 640, fheight = 480, ep0 = 4)


m = Amplify(m, 0.75)

#Import("sayuri_input.avs")
#m = rr_input(m)
WScript("sayuri_input.js", "JScript")


m = WriteText(m, "どうも。待望（？）の佐祐理モードです", 30)
m = WriteText(m, "メモリ解析とかできてないけどやっちゃいました", 270)
m = WriteText2(m, "佐祐理は通常攻撃の威力が8と低い（舞：10）ので、\n緑などの雑魚も一撃では倒せません", 510)
m = WriteText(m, "そこで重要となってくるのがサブウェポンとキックです", 750)
m = WriteText2(m, "サブウェポンは赤を選択します。\n攻撃力が最強の25で消費は2です", 960)
m = WriteText2(m, "キックは普通に当てると浮いてしまうのですが\n着地と同時に当てることで即地上行動ができます", 1170)
m = WriteText(m, "ここまででも何度か披露しています", 1380)
m = WriteText(m, "キックは舞の通常攻撃と同じ威力10なので緑が一撃です", 1590)
m = WriteText(m, "そうこう言っているうちにもう中ボス戦です", 1800)

m = WriteText(m, "乱れ切りにならない通常攻撃の最速連打", 2450)
m = WriteText(m, "最後だけ最速連打", 3000)
m = WriteText2(m, "まあ、こうなりますよね", 3210)

m = WriteText2(m, "ジャンプ最速キックはフレーム単位で移動を\n調整することで大体着地と同時に当てられます", 3400)

m = WriteText2(m, "佐祐理はサブウェポンゲージの自動回復(1秒につき2)\nがあるので道中でも使っていきます", 3610)
m = WriteText(m, "舞と比べて通常攻撃が弱い分サブウェポンが強力です", 3820)
m = WriteText(m, "しかし、被ダメが舞に比べて大きいところが後々厄介です", 4030)
m = WriteText(m, "また、壁キックの軌道が低いという違いもあります", 4240)

m = WriteText(m, "早くも名雪戦", 4500)
m = WriteText2(m, "雪うさぎに赤玉が食われてるのが残念です", 5300)

#m = WriteText(m, "右下のフレームカウンタは録画の都合上2Fずれています", 6300)

# Stage2
m = WriteText(m, "Stage2序盤は緑が多いのでキック祭りです", 6900)
m = WriteText(m, "といってもここまでなんですが", 7100)
#m = WriteText2(m, "スライディングから6F後にジャンプでキャンセルができて\nジャンプから最速でキックが出せます", 7110)

#m = WriteText(m, "ジョニーは赤が当てやすい良い高さです", 9480)

m = WriteText(m, "舞と違って回復アイテムを取らなくて良いのでこの辺は楽です", 10500)

m = WriteText(m, "真琴戦の前のピロは佐祐理だと出てきません", 10800)

# Stage3
m = WriteText2(m, "Stage3は舞ではごり押ししてましたが、\n佐祐理は紙防御なので適度に倒しつつ進みます", 13200)
m = WriteText(m, "雪だるまでダメージを食らわないよう微妙に調節しています", 13410)


m = WriteText(m, "香里戦です", 15500)
m = WriteText2(m, "香里の攻撃が出ちゃってるのでスライディングで回避します", 16100)
#m = WriteText(m, "ホットケーキ美味しいです(^p^)", 16800)

m = WriteText2(m, "栞もアイスビームの下をくぐってしまえば何も問題ありません", 17930)

# Stage4
m = WriteText(m, "Stage4はうって変わってごり押しです。食らう場面が少ないので", 19700)
m = WriteText(m, "とはいえ、できるだけダメージを食らわないよう回避します", 19910)
m = WriteText(m, "木箱の上のけろびーが厄介ですね", 20120)

m = WriteText2(m, "OYAJIは強敵です。サブウェポンゲージをほとんど使い切ります", 21500)
#m = WriteText2(m, "攻撃モーションに入ったのが分かったでしょうか", 21800)

m = WriteText(m, "この後のあゆは体力が低いので自然回復分で十分です", 22000)
m = WriteText(m, "OYAJIのゲージが残るバグは健在です", 22200)

m = WriteText2(m, "OYAJIのゲージが回復するのも舞のときと一緒です", 23700)

m = WriteText(m, "移動し始めた直後で何とか倒せました", 24550)

# Stage5
m = WriteText(m, "少しでも食らいを少なくしつつ進みます", 26300)
m = WriteText(m, "所々でキックで緑を倒してるのが分かるでしょうか", 26600)

m = WriteText2(m, "今回はお願いして前に出てきてもらいました。\n具体的には2F待機しました", 27600)

m = WriteText2(m, "満タンにはなりませんが、自然回復があるのでケーキで十分です", 28250)

m = WriteText2(m, "サブウェポンはヒットストップが短いのでここまで動かれました", 29950)

# Stage6
m = WriteText(m, "Stage6でも食らいを少なくしつつ進みます", 31380)
#m = WriteText(m, "おにぎりおいしいです(^p^)", 35720)
m = WriteText(m, "佐祐理は通常攻撃もヒットストップ短いんですね", 37500)
m = WriteText(m, "まいは本体にも判定があるので厄介です", 38900)
m = WriteText(m, "名前入力してMovie End.", 40082)


#m = Info(m)
#m = FrameNumber(m)

#m = ConvertToYUY2(m)

return m
