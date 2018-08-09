# 3. spikeの原因となる接続数が4以下のvertexへの対処
spikeは、$v$や$\Delta a$を変化させながら再安定形状を計算して行く際に、ある1つのvertexにパラメータの変化量の"しわ寄せ"が生じ、周囲の形状からvertexが飛び出してしまうことで生じる。  
あるvertexが持つedgeの数、すなわち接続数はvertexごとに異なるが、接続数が4以下のvertexはspikeとなってしまうことが経験上多い。よって、このような接続数の少ないvertexを自動的に判別し、edge swapによって接続数を増やすコマンドファイルを定義した。

## es
    es:={foreach facet ff where ((ff.vertex[1].valence<5) or (ff.vertex[2].valence<5) or (ff.vertex[3].valence<5)) do {
    foreach ff.edge ee where ((ee.vertex[1].valence>5) and (ee.vertex[2].valence>5)) do
    {edgeswap ee}
    }
    }