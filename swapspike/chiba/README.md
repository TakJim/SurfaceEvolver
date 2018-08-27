# 課題の手引き
## edge swapの確認
球体の分割面を細分化した上で、vを0.95に変化させると接続数が４、５個のvertexにspikeがみられる。ゆえにコマンドedge swapを用いて、接続数の最適化を行い、spikeの発生を抑える必要が生じる。
## edge swapに関するテクニック
edge swapでは分割面の各頂点の配向数で場合分けを行う。その上で、該当する分割面のうち、接続数を余分に持つ、２頂点からなる辺を、接続数が不足している残りの頂点に配向させる。
fascets,vertex,edgeはvalence以外にも場合分け可能な変数を持っている。このような変数や取扱はSurface EvolverのManual"Chapter4 Geometric elements"にまとめられている。
