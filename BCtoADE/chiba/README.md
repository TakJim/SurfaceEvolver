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
  
　下図はADEモデルにおけるv=0.72の相図である。
![v072_phase](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/v072_phase.png)
　下図(plot_to_ADE_phase.png)には、ADEモデルの相図に、今回計算したv=0.72での転移点をプロットがプロットしてある。
![plot_to_ADE_phase.png](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/plot_to_ADE_phase.png)
