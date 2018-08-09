# 3.spikeを検出し自動的に押し戻す方法
spikeは、vやΔaを変化させながら再安定形状を計算して行く際に、ある1つのvertexにパラメータの変化量の"しわ寄せ"が生じ、周囲の形状からvertexが飛び出してしまうことで生じる。  
spikeであるvertexは、曲率が平均と比べ異常値を示すため、sqcurveを調べることによって検出が可能である。

## spikeの検出
    showsc:= {
        asc:=avg(vertex,sqcurve);
	msc:=max(vertex,sqcurve);
	rsc:=msc/asc;
	printf "asc=%g\nmsc=%g\nrate=%g\n",asc,msc,rsc;
    }

このコマンドでは、sqcurveの平均であるasc、全vertexの中で最も大きいsqcurveであるmscから、2つの比rscを計算している。このrscが異常に大きな値を示したら、spikeが存在していると言えるはずである。経験上5以下の値であればspikeは存在していない。  
このコマンドを元に自動的にspikeを押し戻すコマンドを作成する。

## spikeの押し戻し
    fixspike:={
        asc:=avg(vertex,sqcurve);
	foreach vertex vv where vv.sqcurve > 10*asc do {raw_vertex_average vv}5;
	foreach vertex vv where vv.sqcurve > 5*asc do {raw_vertex_average vv}5;
	V 10;
	}

このコマンドでは、先ほどの`showsc`と同様にascを計算した後、それぞれのvertexのsqcurveに対して、ascと比較している。まずこの比が10より大きい、大きなspikeに対して`raw_vertex_average`（体積や面積のconstraintを無視した平均化）を行うことで、強制的に隣り合うvertexの中心にvertexを移動している。次に、より小さなspikeに対しても同様の処理を行い、最後に全体のvertexを平均している。

## 使い方
spikeは`g`コマンドを行った後に生じるので、`g`コマンドを複数回行った後にfixspikeを使う。ただし、fixspike内で用いている`raw_vertex_average`は体積や面積のconstraintを無視しているため、このコマンドを行った後は体積や面積がtargetの値からずれてしまう。したがって、自分はfixpikeを用いる安定化コマンドと、fixspikeを用いない安定化コマンドの2種類を用意し、fixspikeを用いた後には必ずfixspikeを用いない安定化コマンドを使用するようにしている。その後、spikeの有無を確認し、spikeがあればもう一度fixspikeを用いる安定化コマンドを繰り返し、spikeがなければ形状は安定化されたと判断し、計算を終了する。  

使用例（fixspikeを用いる安定化コマンド）:
    c0 := {
        j 0.01; 
        g 10; 
	u; 
	V 10; 
	g 10; 
	asc := avg(vertices ,sqcurve); 
	msc := max(vertices ,sqcurve); 
	if ( msc > 2*asc ) then fixspike; 
	es 2; 
	V 10
    }
a
