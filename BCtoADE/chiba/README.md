# 課題の手引き
## ADEモデルの相図作成
　v072_ene_profile.txtはBCモデルにおける、v=0.72のエネルギープロファイルのデータである。これを用いてmathematicaでADEモデルのエネルギープロファイルのプロット、及びv=0.72での相図を作成した。  
 ***
 
 　mathematica上では、まずBCモデルのデータ点を連続的な関数にフィッティングする。
   ```
   IDATA = Interpolation[DATA, InterpolationOrder -> 1]
   ```      
   
   次にADEモデルのエネルギー、
   ![w_total](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/w_total_math.png)
   を定義する。
   ```
   Bene[q_, da0_, da_] := IDATA[da] + q(da - da0)^2
   ```
   この関数が、それぞれの最適膜面積差da_0で取りうる最小値をプロットすることについて考える。  
   daがBCモデルのデータ点を任意に取れるとすれば、第二項目はそれぞれ、daを頂点とするda_0の放物線を表す。  
   これをいくつかプロットして、BCモデルのエネルギープロファイルと重ねてみる。
   ![ADE_energy_profile](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/ADE_para.png)
  　
   da_0 = 0.90のとき、図の(ⅰ)、(ⅱ)について比較してみると、  
   (ⅰ)da = da_oblateのとき  
   
   ```
   ADE[q_, da0_] := MinValue[{Bene[q, da0, da], 0.512479 < da < 1.36808}, da]
   ```
  　と最小値をとる変数の位置、
   ```
   Dela[q_, da0_] := ArgMin[{Bene[q, da0, da], 0.512479 < da < 1.36808}, da]
   ```
   を計算すれば良い。  
   
　下図に`Dela[q_, daθ_]`の結果をプロットした。
![v072_phase](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/v072_argmin.png)
　
  この相図から転移点を読み取り、ADEモデルの相図にプロットした。
![plot_to_ADE_phase.png](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/plot_to_ADE_phase.png)
