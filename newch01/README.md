# ベシクルモデルの作成と𝑣、daのパラメータ変化による変形
## ベシクルモデルの作成（曲げ弾性エネルギーを定義）
ベシクルの平衡形状は曲げ弾性エネルギーを最小化する形状として計算できる。
プログラム上では後述の{V;u;g}というコマンドでこの計算が実行される。
BCモデルの曲げ弾性エネルギーは以下のように表される。

![スクリーンショット 2021-06-25 17 38 11](https://user-images.githubusercontent.com/85602161/123396365-3003aa00-d5dc-11eb-9ced-992ca70ba32d.png)

ここで𝐻は曲面の平均曲率、 𝜅は膜弾性率。
半径 𝑅 の球状ベシクルについて，曲げ弾性エネルギー 𝑊<sub>BC</sub> を計算すると、

![スクリーンショット 2021-06-25 18 35 15](https://user-images.githubusercontent.com/85602161/123404762-22522280-d5e4-11eb-9d59-cb76e7b31226.png)

半径 𝑅 の球状ベシクルにおける曲げ弾性エネルギー 𝑊<sub>BC</sub> で規格化された曲げ弾性エネルギーw<sub>BC</sub>を
![スクリーンショット 2021-06-25 17 43 14](https://user-images.githubusercontent.com/85602161/123396941-d8b20980-d5dc-11eb-960a-9c38150005bc.png)
と表し、これをプログラムで定義すると以下のようなQUANTITY変数で表される。

![スクリーンショット 2021-06-25 15 38 39](https://user-images.githubusercontent.com/85602161/123381335-916f4d00-d5cb-11eb-9a99-6db2729d047d.png)


## 拘束条件(換算体積v)について
換算体積(reduced volume)はベシクルの持つ 膜面積 A から見た球状ベシクル(半径R<sub>0</sub>)の体積と実際の体積 V の比を表す無次元数であり、次のように定義される。
![スクリーンショット 2021-06-25 17 46 42](https://user-images.githubusercontent.com/85602161/123397467-68f04e80-d5dd-11eb-884a-342695219045.png)
![スクリーンショット 2021-06-25 17 49 05](https://user-images.githubusercontent.com/85602161/123397748-bb316f80-d5dd-11eb-8072-194e23bea714.png)

V=1の時、Aについて解くと、
![スクリーンショット 2021-06-25 17 52 17](https://user-images.githubusercontent.com/85602161/123398039-0f3c5400-d5de-11eb-8b6d-25184df319bb.png)

つまり、表面積Aを変化させることで換算体積vを変化させることができる。

換算体積を変化させるプログラムは以下の通り(ここで“rev”は任意の換算体積を意味する)。

farea.target := (body[1].target*6*(pi)**(1/2)/rev)**(2/3);

## 実際の動き（換算体積vを変化させる時）
SEを起動し、
```
　j 0.01
```
と入力し、
```
　farea.target := farea.value +○○（0.1などの実数）
```
と入力し、換算体積をずらしてから
 ```
　{V;g;u} 1000
```
と入力することで、パラメーターを変化させてのシミュレーションが行われる。Vは頂点を平均的に分布させる操作を実行し、uはスパイク防止の操作を実行、gは安定化計算を実行するがここでは3つのコマンドを1セットにして安定化計算を行なっている。
（上の例では1000回計算が行われる。）

## 拘束条件（膜面積差da）について
膜面積差(area difference)は二分子膜の外膜と内膜の面積差である。球状ベシクル(半径R<sub>0</sub>)の膜面積差ΔA<sub>sphere</sub>は以下のようになる。
![スクリーンショット 2021-06-25 17 59 06](https://user-images.githubusercontent.com/85602161/123398965-0dbf5b80-d5df-11eb-9974-e4e530895d53.png)


表面積 A をもつベシクルの面積差は球状ベシクルの膜面積差ΔA<sub>sphere</sub>を用いて，次のように規格化される。
![スクリーンショット 2021-06-25 18 00 36](https://user-images.githubusercontent.com/85602161/123399190-48c18f00-d5df-11eb-98cc-358172b9dbc7.png)



膜面積差∆𝑎を表すプログラムは以下の通り。
![スクリーンショット 2021-06-25 18 04 43](https://user-images.githubusercontent.com/85602161/123399657-d9986a80-d5df-11eb-8174-4d5ea859a588.png)
ここで、mciを拘束条件に設定した上でdaの値を変化させることで膜面積差∆𝑎を変化させることができる。

mciはQUANTITY変数で定義されている。

![スクリーンショット 2021-06-25 15 41 09](https://user-images.githubusercontent.com/85602161/123381492-c7accc80-d5cb-11eb-8abc-7684c043d02f.png)


## 実際の動き（膜面積差daを変化させる時）
SEを起動し、
```
　fix mci
```
と入力し、mciを動かせるようにしてから
```
　mci.target := 〇〇(99などの実数)
```
と入力し、mciを拘束条件に設定する。その後、
```
　{V;g;u} 1000
```
と入力することで、パラメーターを変化させてのシミュレーションが行われる。

## 課題
![スクリーンショット 2021-06-11 16 54 33](https://user-images.githubusercontent.com/85602161/121651639-ccef1f00-cad5-11eb-8aaa-6220d6b07d3a.png)

<img src="https://user-images.githubusercontent.com/85602161/121653817-0d4f9c80-cad8-11eb-8d27-6ef1c0c5b184.png" width=50%>

![スクリーンショット 2021-06-11 17 27 37](https://user-images.githubusercontent.com/85602161/121656376-60c2ea00-cada-11eb-9890-dcc8e639f1e3.png)


![スクリーンショット 2021-06-11 17 21 44](https://user-images.githubusercontent.com/85602161/121655371-856a9200-cad9-11eb-8cc8-c9741dd0c141.png)
![スクリーンショット 2021-06-11 17 22 59](https://user-images.githubusercontent.com/85602161/121655610-b3e86d00-cad9-11eb-9696-855e5230bd49.png)


