# spikeを検出し、その原因となる接続数が4以下のvertexを修正する
spikeは、vやΔaを変化させながら再安定形状を計算して行く際に、ある1つのvertexにパラメータの変化量の"しわ寄せ"が生じ、周囲の形状からvertexが飛び出してしまうことで生じる。  
spikeであるvertexは、曲率が平均と比べ異常値を示すため、sqcurveを調べることによって検出が可能である。

## spikeの検出
    showsc:= {
        asc:=avg(vertex,sqcurve);
        msc:=max(vertex,sqcurve);
        rsc:=msc/asc;
        printf "asc=%g\nmsc=%g\nrate=%g\n",asc,msc,rsc;
    }

このコマンドでは、sqcurveの平均であるasc、全vertexの中で最も大きいsqcurveであるmscから、2つの比rscを計算している。このrscが異常に大きな値を示したら、spikeが存在していると言えるはずである。経験上rscが5以下の値であればspikeは存在していない。  

## spikeの原因
あるvertexが持つedgeの数、すなわち接続数はvertexごとに異なるが、接続数が4以下のvertexはspikeとなってしまうことが経験上多い。よって、このような接続数の少ないvertexを自動的に判別し、edge swapによって接続数を増やすコマンドファイルを定義した。

## es
    es:={
        foreach facet ff where ((ff.vertex[1].valence<5) or (ff.vertex[2].valence<5) or (ff.vertex[3].valence<5)) do {
            foreach ff.edge ee where ((ee.vertex[1].valence>5) and (ee.vertex[2].valence>5)) do {
                edgeswap ee
            }
        }
    }

このコマンドでは、全てのfacetに対し、1つのfacetが持つ3つのvertexの接続数を調べ、どれか1つでも5より小さかった場合、残りの2つのvertexの接続数が5より大きいことを確認した上で、それらをつなぐedgeをedgeswapする。この操作によって接続数が少ないvertexは新たなedgeをもらい、edgeを渡したvertexは接続数が4以下になることはない。

## 使い方
安定化のコマンドを自作するときに、`u`でエッジの組み換えをした場合、`es 2`をすることで接続数4以下のvertexが生まれてしまっても自動的に修正してくれます。

## 課題
test_sphere.dmpはcube.feから`gogo`コマンドで作成した球で、接続数が4のvertexを6個持っています（TODO:場所がわかるような図を入れる）。  
このdmpファイルに曲げ弾性エネルギーを定義し（表面張力は`set facets density 0`で無効化する）、vを減らしたりdaを増減させたりした時に、接続数4のvertexが異常な振る舞いをするのを確認してください（変形結果は別ファイルに保存してください） 。 
その後、`es`コマンドを用いながら変形させた場合、先ほどと比べて形状の変化が自然になることを確認してください（変形結果は別ファイルに保存してください）。
