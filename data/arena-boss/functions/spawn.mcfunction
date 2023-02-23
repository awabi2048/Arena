## ボス召喚時
# ボス戦闘中フラグ設定
data modify storage arena-boss: Name set from storage arena-boss: SummoningBoss

# アニメーション設定
data modify storage arena-boss: Animation.Name set value "Spawning"

# タイマーリセット
scoreboard players set $StartTimer ArenaBoss -1
