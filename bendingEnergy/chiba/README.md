# 課題の手引き
## 弾性エネルギーと試行回数のプロット
test_spike.dmpは安定化する前の状態である。ここに以下の繰り返しコマンドを入力する。          　　
試行回数ごとに出力先ファイルの名前も変更しておくと良い。
```
cycl :=
{
quiet ON;

cycle := 0;
out_ene := {printf "%g %g\n",cycle,bene.value >> "bene_cycle100.txt"};


out_ene;

while(cycle <= 100) do
{
	cycle += 1;
	fixspike;
	es 2;
	u;
	g 30;
	V 10;
	j 10^(-1-cycle);
	out_ene
	
};

quiet OFF
}
```  
bene_cycle.epsには試行回数が100回と1000回のデータがそれぞれプロットされている。
