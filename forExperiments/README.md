ターミナルから
evolver 〇〇.dmp　で形状ファイルを読み込みます。
その後コマンド `v`で以下のように基本的な物理量が表示されます。

    Enter command: v
    
    
    
    Body          target volume           actual volume          pressure
    
      1      0.0648857777974809      0.0648857777974699 -26.3990034261863
    
    
    
                Quantity       target value           actual value                 pressure
    
                 benergy         ---------            1.69393520756471
    
                   farea                       1       0.999999999999934   3.35559714777911
    
                     mci        3.72215416090528        3.72215416090518  0.101199451029443
    
                  offset         ---------          -0.999999999999934


actual volumeが現在の体積
farea の actual valueが現在の面積になっています（今回のファイルでは規格化されているので、ほぼ1）。

次に、コマンド`s`を打つと、別ウィンドウで3次元形状が表示されますが、
この画面のvertexを右クリックすることで、vertexのインデックスがターミナル上に次のように表示されます。

    Picked vertex 396
    Picked edge 1661


この頂点のインデックスから`list vertex[〇〇]`で、次のように3次元座標を表示します

    Enter command: list vertex[396]        
    
    // Id               X                Y               Z
    
    396  0.174811886589951 -0.187917215517139 -0.45000737703622


これによって、SE上の2点間の距離l_SEが測れます。

実際の顕微鏡データでも対応する距離l_realを測ることで、実際とSEとの距離の比 r = l_real / l_SEが計算できます。
この比を用いて、体積であれば r^3 、面積であれば r^2 を先ほど調べたactual volumeとactual fareaに掛けることで、フィットさせた3次元SE画像から、体積と面積を計算しています。