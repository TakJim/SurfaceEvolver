# 課題の手引き
## 弾性エネルギーと試行回数のプロット
bene_v0.76_dela1.024.dmpはdaが1.024で安定している。このデータのdaが0.001増えるようにmciを設定したとき、エネルギーが最小値を取るまで必要な安定化コマンドの回数をカウントした。また、refinementコマンド`r`が2回と3回で場合分けした。以下の繰り返しのコマンドで回数を記録する。     
試行回数ごとに出力先ファイルの名前も変更しておくと良い。
```
cycl :=
{
quiet ON;

cycle := 0;
out_ene := {printf "%g %g\n",cycle,bene.value >> "bene_cycle1000.txt"};


//out_ene;

while(cycle <= 1000) do
{
	cycle += 1;
	{g 10;V 5;u};
	out_ene;
};

quiet OFF
}
```

`r`2回
![bene_cycle](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/bendingEnergy/chiba/bene_r2_1000.png)
`r`3回
![bene r3](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/bendingEnergy/chiba/bene_r3_1000.png)
安定化コマンドの目安として、refineが2回のときは50回ほど、refineが3回のときは200回ほどすれば良い。
