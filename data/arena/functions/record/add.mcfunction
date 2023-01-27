## 記録リストに追加, ランキング作成
# ソート用にweightを取得
data modify storage arena:temp MergingRecord.PlayerData.weight set from entity @s data.Arena.TickTime

# 表示データ取得
data modify storage arena:temp MergingRecord.PlayerData.DisplayData set from storage arena:temp TimeDisplay.Combined

# モブ種類識別
data modify storage arena:temp MergingRecord.PlayerData.Type set from storage arena:temp NoticeInfo.Name

# Name取得
setblock 0 -64 0 chest
execute as @p run loot replace block 0 -64 0 container.0 loot arena:misc/player_head

execute in minecraft:overworld run data modify storage arena:temp MergingRecord.PlayerData.Name set from block 0 -64 0 Items[0].tag.SkullOwner.Name
setblock 0 -64 0 bedrock

# 重複プレイヤーのデータが無いか確認
data modify storage arena:temp PlayerData set from storage arena: PlayerData

data modify storage arena:temp MergingRecord.ComparedPlayerData set value []

execute unless data storage arena:temp PlayerData[0] run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp MergingRecord.PlayerData
execute if data storage arena:temp PlayerData[0] run function arena:record/check_dupes

data modify storage arena: PlayerData set from storage arena:temp MergingRecord.ComparedPlayerData

# リストに追加、ソート
# ソートは赤石氏作のAiMathライブラリを使用
data modify storage math: in set from storage arena: PlayerData

function #math:sort/ascend

# ストレージに保存
data modify storage arena: PlayerData set from storage math: out

# ランキングデータを更新, 適応
function arena:record/update_ranking
