## 記録リストに追加, ランキング作成
# ソート用にweightを取得
execute store result storage arena:temp cache.PlayerData.weight int 1 run scoreboard players get $Time:tick Arena.Temp

# 表示データ取得
data modify storage arena:temp cache.PlayerData.DisplayData set from storage arena:temp TimeDisplay.Combined

# モブ種類識別
data modify storage arena:temp cache.PlayerData.Type set from storage arena:temp NoticeInfo.Name

# Name取得
setblock 0 -64 0 chest
execute as @p run loot replace block 0 -64 0 container.0 loot arena:misc/player_head

execute in minecraft:overworld run data modify storage arena:temp cache.PlayerData.Name set from block 0 -64 0 Items[0].tag.SkullOwner.Name
setblock 0 -64 0 bedrock

# 重複プレイヤーのデータが無いか確認
data modify storage arena:temp PlayerData set value []
data modify storage arena:temp PlayerData set from storage arena: PlayerData

data modify storage arena:temp PlayerData append from storage arena:temp cache.PlayerData

execute if data storage arena:temp PlayerData[0] run function arena:record/check_dupes

# リストに追加、ソート
# ソートは赤石氏作のAiMathライブラリを使用
data modify storage arena: PlayerData append from storage arena:temp cache.PlayerData

data modify storage arena:temp PlayerData set value []
data modify storage arena:temp PlayerData set from storage arena: PlayerData

data modify storage math: in set from storage arena:temp PlayerData

function #math:sort/ascend

# ストレージに保存
data modify storage arena: PlayerData set from storage math: out

# ランキングデータを更新
#function arena:record/update_ranking
