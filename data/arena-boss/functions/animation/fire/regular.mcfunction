# 通常時アニメーション

# パーツぐるぐる
execute in minecraft:arena run function arena-boss:animation/fire/body_spin/normal

# パーティクル
function arena-boss:animation/fire/particle/regular

# ふわふわ
execute in minecraft:arena run execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float01

# 下のブロックが空気ならゆっくり降下
execute as @e[tag=ArenaBoss.Motion] at @s if block ~ ~-0.25 ~ air run effect give @s slow_falling 1 0
