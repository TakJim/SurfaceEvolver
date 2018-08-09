# 4.spikeを検出し自動的に押し戻す方法

3章ではspikeの主な原因となる接続数の少ないvertexの対処をしたが、それ以外でもspikeが生じることはある。そのような時に、自動的にspikeを検出し、押し戻すようなコマンドを定義する。

## spikeの押し戻し
    fixspike:={
        asc:=avg(vertex,sqcurve);
	foreach vertex vv where vv.sqcurve > 10*asc do {raw_vertex_average vv}5;
	foreach vertex vv where vv.sqcurve > 5*asc do {raw_vertex_average vv}5;
	V 10;
	}

このコマンドでは、先ほどの`showsc`と同様にascを計算した後、それぞれのvertexのsqcurveに対して、ascと比較している。まずこの比が10より大きい、大きなspikeに対して`raw_vertex_average`（体積や面積のconstraintを無視した平均化）を行うことで、強制的に隣り合うvertexの中心にvertexを移動している。次に、より小さなspikeに対しても同様の処理を行い、最後に全体のvertexを平均している。

## 使い方
spikeは`g`コマンドを行った後に生じるので、`g`コマンドを複数回行った後にfixspikeを使う。ただし、`fixspike`内で用いている`raw_vertex_average`は体積や面積のconstraintを無視しているため、このコマンドを行った後は体積や面積がtargetの値からずれてしまう。したがって、自分は`fixspike`を用いる安定化コマンドと、`fixspike`を用いない安定化コマンドの2種類を用意し、`fixspike`を用いた後には必ず`fixspike`を用いない安定化コマンドを使用するようにしている。その後、spikeの有無を確認し、spikeがあればもう一度`fixspike`を用いる安定化コマンドを繰り返し、spikeがなければ形状は安定化されたと判断し、計算を終了する。  

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

※このコマンドは`fixspike`の後に`g`を行っていないため、必ず`fixspike`を用いない安定化コマンドを、このコマンドの後に使うこと。

## 課題
3章で保存した、spikeを持つベシクル形状に対して`fixspike`を用いてspikeを押し戻してください。その後`fixspike`を**用いない**安定化コマンドを使用すると、接続数の小さいvertexは修正されていないためspikeが再び現れるはずです。`fixspike`を行った直後に`es`を使用することで、その後`fixspike`を**用いない**安定化コマンドを使用してもspikeが再び現れないことを確認してください。
