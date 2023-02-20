# 通常時アニメーション

# パーティクル
function arena-boss:animation/water/particle/regular

# ふわふわ
execute in minecraft:arena run execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float01

# 下のブロックが空気ならゆっくり降下
execute as @e[tag=ArenaBoss.Core] at @s if block ~ ~-0.25 ~ air run tp @s ~ ~-0.125 ~
