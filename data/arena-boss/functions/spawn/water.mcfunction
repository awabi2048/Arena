## 召喚を開始
# アニメーション開始のためのフラグ設定
data modify storage arena-boss: Name set value "Water"
data modify storage arena-boss: Animation.Name set value "Spawning"

# タイマーリセット
scoreboard players set $StartTimer ArenaBoss -1
