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

このコマンドでは、sqcurveの平均であるasc、全vertexの中で最も大きいsqcurveであるmscから、2つの比rscを計算している。このrscが異常に大きな値を示したら、spikeが存在していると言えるはずである。経験上3以下の値であればspikeは存在していない。  
このコマンドを元に自動的にspikeを押し戻すコマンドを作成する。

## spikeの押し戻し
    fixspike:={
	asc:=avg(vertex,sqcurve);
	foreach vertex vv where vv.sqcurve > 10*asc do {raw_vertex_average vv}5;
	foreach vertex vv where vv.sqcurve > 5*asc do {raw_vertex_average vv}5;
	V 10;
    }