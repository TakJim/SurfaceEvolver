# 課題の手引き
## ADEモデルの相図作成
　v072_ene_profile.txtはBCモデルにおける、v=0.72のエネルギープロファイルのデータである。これを用いてmathematicaでADEモデルのエネルギープロファイルのプロット、及びv=0.72での相図を作成した。  
 ***
 
 　まずBCモデルのデータ点を連続的な関数にフィッティングする。
   ```
   IDATA = Interpolation[DATA, InterpolationOrder -> 1]
   ```      
   
   次にADEモデルのエネルギーを定義する。
   ```
   Bene[q_, da0_, da_] := IDATA[da] + q(da - da0)^2
   ```
   この関数が、それぞれの最適膜面積差da_0で取りうる最小値をプロットすることについて考える。  
   daがBCモデルのデータ点を任意に取れるとすれば、第二項目はdaを頂点とするda_0の放物線を表す。  
   これをいくつかプロットして、BCモデルのエネルギープロファイルと重ねてみる。
   ![ADE_energy_profile](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/ADE_catenary.png)
  　
   da_0 = 0.90のとき、図の(ⅰ)、(ⅱ)をみてみよう。
   (ⅰ)は放物線q(da_0 - da_oblate)^2の点であるからda=da_oblateである。  
   一方、(ⅱ)は放物線q(da_0 - da_prolate)^2の点であるからda=da_prolateである。  
   　da_0 = 0.90上では、(ⅰ)のほうがエネルギーを小さくできるので、daはda_oblateをとろうとする。また、同じda_0上でより小さいエネルギーを取る状態があれば、daはその値をとるだろう。  
   　このようにして各da_0上での最小エネルギーをプロットすることを考えれば、mathematicaでの計算、
   ```
   ADE[q_, da0_] := MinValue[{Bene[q, da0, da], 0.512479 < da < 1.36808}, da]
   ```
  これは上図のような放物線を、データ点すべてで計算したのち、その包絡線をADEモデルのエネルギープロファイルとしてプロットしている。
  
  　また、各da_0上でエネルギーが最小のとき、すなわち包絡線上でのdaとda_0の関係は
   ```
   Dela[q_, da0_] := ArgMin[{Bene[q, da0, da], 0.512479 < da < 1.36808}, da]
   ```
   を計算してプロットされる。下図にその結果を示す。
![v072_phase](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/v072_argmin.png)
　図より、daはda_0に対して1次相転移している。例えばda_0が[0.77-1.18]の間ではdaは常にda_oblateをとる。一方BCモデルでは、あるreduced volumeに対して、da_oblateは一点しか許されなかった。すなわち最適膜面積差によるエネルギー項によって、da_0が[0.77-1.18]の間では、BCモデルの項は逐次的にエネルギー最小値を取るよりも、安定形状を取るような(今であればoblate)エネルギー値を取りつづける。   
 　daはベシクルの形状を表し、また最適膜面積da_0は脂質膜を構成する分子の個数や断面積、及び温度などの状態変数に依るので、これらのパラメータを変化させればベシクルの形状変化を実験的に確認できると思われる。   
  
  計算結果を吟味するため、da-da_0図から転移点を読み取り、ADEモデルの相図にプロットした。
![plot_to_ADE_phase.png](https://github.com/chibatoshikaze/SurfaceEvolver/blob/patch-4/BCtoADE/chiba/plot_to_ADE_phase.png)

