# ハメられてたら退避
# タイマー増加

# ここからアニメーション
# 
# 回転
function arena-boss:animation/fire/body_spin/fast

# 目標選定

# 移動
execute as @e[tag=ArenaBoss.Motion] at @s unless block ^ ^ ^0.5 air run tp @s ~ ~0.125 ~ ~1 ~

# リセット
execute as @e[tag=ArenaBoss.Motion] at @s if block ^ ^ ^0.5 air run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/fire/particle/regular
