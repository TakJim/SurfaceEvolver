# SurfaceEvolver
##新しいmethod_instance: spotの定義
'''
METHOD_INSTANCE spot METHOD star_perp_sq_mean_curvature
QUANTITY benergy1 ENERGY  modulus 0.0795774715459477  method spot
'''
※このmethod_instanceはvertexのみで値を持つ．

対象とするfacet, それに属するedges, それに属するverticesにattributeを追記

##spotとなるfacetだけをrefineする
'''
refine facet ff where min(ff.vertices, spot) > 0 //全てのverticesにspotを持つfacetをrefine
'''

###attributeを持つedgesを表示
'''
list vertex where spot
'''