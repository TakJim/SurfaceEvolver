# SurfaceEvolver
## 新しいmethod_instance: spotの定義
```
METHOD_INSTANCE spot METHOD star_perp_sq_mean_curvature
QUANTITY benergy1 ENERGY  modulus 0.0795774715459477  method spot
```
※このmethod_instanceはvertexのみで値を持つ．

対象とするfacet, それに属するedges, それに属するverticesにattributeを追記

## spotとなるfacetだけをrefineする
```
refine facet ff where min(ff.vertices, spot) > 0 //全てのverticesにspotを持つfacetをrefine
```

### attributeを持つedgesを表示
```
Enter command: list vertex where spot
// Id               X                Y               Z
  1  0.177939867121137 -0.275076374051854  53.1484259677507 spot  
163   7.12544347128534 -0.273533992055263  52.4664340518696 spot  
164    2.3340885130052 -6.85236886721756  52.7366109301652 spot  

```