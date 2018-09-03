# 課題の手引き
## ADEモデルの相図作成
　v072_ene_profile.txtはBCモデルにおける、v=0.72のエネルギープロファイルのデータである。これを用いてmathematicaでADEモデルのエネルギープロファイルのプロット、及びv=0.72での相図を作成した。  
 
 
 　mathematica上では、まずBCモデルのデータに対して、データ点どうしの補間、
   ```
   IDATA = Interpolation[DATA, InterpolationOrder -> 1]
   ```
  　およびADEモデルのエネルギーを定義、
   ```
   Bene[q_, da0_, da_] := IDATA[da] + q (da - da0)^2
   ```
  　これについてエネルギーの最小化、
   ```
   ADE[q_, da0_] := MinValue[{Bene[q, da0, da], 0.512479 < da < 1.36808}, da]
   ```
  　と最小値をとる変数の位置、
   ```
   Dela[q_, da0_] := ArgMin[{Bene[q, da0, da], 0.512479 < da < 1.36808}, da]
   ```
   を計算すれば良い。  
   
　下図に`Dela[q_, daθ_]`の結果をプロットした。すなわちADEモデルにおけるv=0.72の相図である。
![v072_phase](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/v072_phase.png)
　下図(plot_to_ADE_phase.png)には、ADEモデルの相図に、今回計算したv=0.72での転移点をプロットがプロットしてある。
![plot_to_ADE_phase.png](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/plot_to_ADE_phase.png)
