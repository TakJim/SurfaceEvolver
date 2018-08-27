# Surface Evolver Techniques

## はじめに
私がこれまで研究においてSurface Evolver（以下SE）を使う上で学んだテクニックを分かりやすくまとめます。SEの技術は利用する個々人が職人芸的に習得している部分が多いため、この暗黙知をなるべく減らすことを心がけます。  
この記事を読む上で必要となる知識は、SE上で曲げ弾性エネルギーを定義したベシクルモデルを作成し、換算体積、膜面積差等のパラメータををある程度自由に変化させながら再安定形状を計算できる技術です。  
内容としては、まずベシクルモデルからどのようにしてBilayer Couple Model（以下BCモデル）のエネルギープロファイルを計算するのかを、安定形状を計算する上で障害となりがちな、spikeの発生と、準安定形状への落ちこみを如何にして回避するかを交えながら説明します。  
次になめらかなBCモデルのエネルギープロファイルを用いて、Mathematicaによる計算によってArea Difference Elasticity Model（以下ADEモデル）の相図を作成する手法を説明します。  
最後に、実際の研究でよく使ってきた、2次元顕微鏡画像と3次元SE形状を照らし合わせて、ベシクルの3次元形状を推定する方法についても、私なりのやり方を説明します。
付録として、自作のcmdをなるべく網羅して記載します。記事内で説明できなかったものについてはなるべくコメントを付けます。  

## 目次

1. ベシクルモデルの作成とv、daのパラメータ変化による変形
2. [spikeを検出し、その原因となる接続数が4以下のvertexを修正する](/swapspike)
3. [spikeを自動的に押し戻す方法](https://github.com/TakJim/SurfaceEvolver/tree/master/fixspike)
4. [曲げ弾性エネルギーの計算](https://github.com/TakJim/SurfaceEvolver/tree/master/bendingEnergy)
5. [BCモデルのエネルギープロファイルの計算](https://github.com/TakJim/SurfaceEvolver/tree/master/BCenergy)
6. [ADEモデルについて](https://github.com/TakJim/SurfaceEvolver/tree/master/ADEmodel)
7. [BCモデルからADEモデルへの拡張（Mathematica）](https://github.com/TakJim/SurfaceEvolver/tree/master/BCtoADE)
8. BCモデルエネルギープロファイルからのADE相図作成（Mathematica）
9. 2次元顕微鏡画像に対し、3次元SE形状を照らし合わせる方法について
10. その他
