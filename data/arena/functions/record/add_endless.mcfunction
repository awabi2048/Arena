# データマージ処理 (エンドレス用)

## 記録リストに追加, ランキング作成
# 一時データリセット
data modify storage arena:temp MergingRecord set value {}

# マーカーのデータから参照
data modify storage arena:temp MergingRecord.PlayerData set from entity @s data.Arena.DeadPlayerData[0]

# 重複プレイヤーのデータが無いか確認
data modify storage arena:temp PlayerData set from storage arena: PlayerData

data modify storage arena:temp MergingRecord.ComparedPlayerData set value []

execute unless data storage arena:temp PlayerData[0] run data modify storage arena:temp MergingRecord.ComparedPlayerData append from storage arena:temp MergingRecord.PlayerData
execute if data storage arena:temp PlayerData[0] run function arena:record/check_dupes

# データベースを更新
data modify storage arena: PlayerData set from storage arena:temp MergingRecord.ComparedPlayerData

# ランキングデータを更新, 適応
schedule function arena:record/update_ranking 1t

# まだ取り出せるデータがあれば再帰
data remove entity @s data.Arena.DeadPlayerData[0]
execute if data entity @s data.Arena.DeadPlayerData[0] run function arena:record/add_endless
