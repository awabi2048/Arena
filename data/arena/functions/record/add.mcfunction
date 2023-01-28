## 記録リストに追加, ランキング作成
# 一時データリセット
data modify storage arena:temp MergingRecord set value {}

# ソート用にweightを取得
data modify storage arena:temp MergingRecord.PlayerData.weight set from entity @s data.Arena.TickTime

# 表示データ取得
data modify storage arena:temp MergingRecord.PlayerData.DisplayData set from entity @s data.Arena.DisplayTime

# モブ種類識別
data modify storage arena:temp MergingRecord.PlayerData.Type set from storage arena:temp NoticeInfo.Name

# Name取得
execute in minecraft:overworld run setblock 0 -64 0 chest
execute in minecraft:overworld as @p run loot replace block 0 -64 0 container.0 loot arena:misc/player_head

execute in minecraft:overworld run data modify storage arena:temp MergingRecord.PlayerData.Name set from block 0 -64 0 Items[0].tag.SkullOwner.Name
execute in minecraft:overworld run setblock 0 -64 0 bedrock

# 重複プレイヤーのデータが無いか確認
data modify storage arena:temp PlayerData set from storage arena: PlayerData

data modify storage arena:temp MergingRecord.ComparedPlayerData set value []

execute unless data storage arena:temp PlayerData[0] run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp MergingRecord.PlayerData
execute if data storage arena:temp PlayerData[0] run function arena:record/check_dupes

# データベースに統合
data modify storage arena: PlayerData set from storage arena:temp MergingRecord.ComparedPlayerData

# ランキングデータを更新, 適応
function arena:record/update_ranking
