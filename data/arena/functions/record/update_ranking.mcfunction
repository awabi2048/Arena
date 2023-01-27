## ランキング表示データのアップデート

# アリーナ種類特定
data modify storage arena:temp PlayerData set from storage arena: PlayerData

execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"ゾンビ"}}} run data remove storage arena:temp PlayerData[{Type:"ゾンビ"}]
execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"スケルトン"}}} run data remove storage arena:temp PlayerData[{Type:"スケルトン"}]
execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"ブレイズ"}}} run data remove storage arena:temp PlayerData[{Type:"ブレイズ"}]
execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"スパイダー"}}} run data remove storage arena:temp PlayerData[{Type:"スパイダー"}]
execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"スライム"}}} run data remove storage arena:temp PlayerData[{Type:"スライム"}]
execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"クリーパー"}}} run data remove storage arena:temp PlayerData[{Type:"クリーパー"}]
execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"ガーディアン"}}} run data remove storage arena:temp PlayerData[{Type:"ガーディアン"}]

execute unless data storage arena:temp {MergingRecord:{PlayerData:{Type:"エンドレス"}}} run data remove storage arena:temp PlayerData[{Type:"エンドレス"}]

# 一時データリセット
data modify storage arena:temp Ranking set value []

setblock 0 -64 0 oak_sign{Text1:''}

# 1st
data modify block 0 -64 0 Text1 set value '[{"text": "1st. ","color": "white","bold": true},{"nbt":"PlayerData[0].Name","storage": "arena:temp","color": "yellow","bold": true},{"text": "","bold": true,"color": "aqua","extra":[{"text": "("},{"nbt":"PlayerData[0].DisplayData","storage": "arena:temp","interpret": true},{"text": ")"}]}]'
execute in minecraft:overworld if data storage arena:temp PlayerData[0] run data modify storage arena:temp Ranking append from block 0 -64 0 Text1

# 2nd
data modify block 0 -64 0 Text1 set value '[{"text": "2nd. ","color": "white","bold": true},{"nbt":"PlayerData[1].Name","storage": "arena:temp","color": "yellow","bold": true},{"text": "","bold": true,"color": "aqua","extra":[{"text": "("},{"nbt":"PlayerData[1].DisplayData","storage": "arena:temp","interpret": true},{"text": ")"}]}]'
execute in minecraft:overworld if data storage arena:temp PlayerData[1] run data modify storage arena:temp Ranking append from block 0 -64 0 Text1

# 3rd
data modify block 0 -64 0 Text1 set value '[{"text": "3rd. ","color": "white","bold": true},{"nbt":"PlayerData[2].Name","storage": "arena:temp","color": "yellow","bold": true},{"text": "","bold": true,"color": "aqua","extra":[{"text": "("},{"nbt":"PlayerData[2].DisplayData","storage": "arena:temp","interpret": true},{"text": ")"}]}]'
execute in minecraft:overworld if data storage arena:temp PlayerData[2] run data modify storage arena:temp Ranking append from block 0 -64 0 Text1

# 4th
data modify block 0 -64 0 Text1 set value '[{"text": "4th. ","color": "white","bold": true},{"nbt":"PlayerData[3].Name","storage": "arena:temp","color": "yellow","bold": true},{"text": "","bold": true,"color": "aqua","extra":[{"text": "("},{"nbt":"PlayerData[3].DisplayData","storage": "arena:temp","interpret": true},{"text": ")"}]}]'
execute in minecraft:overworld if data storage arena:temp PlayerData[3] run data modify storage arena:temp Ranking append from block 0 -64 0 Text1

# 5th
data modify block 0 -64 0 Text1 set value '[{"text": "5th. ","color": "white","bold": true},{"nbt":"PlayerData[4].Name","storage": "arena:temp","color": "yellow","bold": true},{"text": "","bold": true,"color": "aqua","extra":[{"text": "("},{"nbt":"PlayerData[4].DisplayData","storage": "arena:temp","interpret": true},{"text": ")"}]}]'
execute in minecraft:overworld if data storage arena:temp PlayerData[4] run data modify storage arena:temp Ranking append from block 0 -64 0 Text1

setblock 0 -64 0 bedrock

# forceload


# 取得データを適切なパスに格納
execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"ゾンビ"}}} run data modify storage arena: Ranking.Zombie set from storage arena:temp Ranking
execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"スケルトン"}}} run data modify storage arena: Ranking.Skeleton set from storage arena:temp Ranking
execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"ブレイズ"}}} run data modify storage arena: Ranking.Blaze set from storage arena:temp Ranking
execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"スパイダー"}}} run data modify storage arena: Ranking.Spider set from storage arena:temp Ranking
execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"スライム"}}} run data modify storage arena: Ranking.Slime set from storage arena:temp Ranking
execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"クリーパー"}}} run data modify storage arena: Ranking.Creeper set from storage arena:temp Ranking
execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"ガーディアン"}}} run data modify storage arena: Ranking.Guardian set from storage arena:temp Ranking

execute if data storage arena:temp {MergingRecord:{PlayerData:{Type:"エンドレス"}}} run data modify storage arena: Ranking.Endless set from storage arena:temp Ranking


