# tick: 弾
# 演出
particle flame ~ ~ ~ 0 0 0 0.05 5

# 本体操作
tp @s ^ ^ ^0.75
execute unless entity @e[tag=ArenaBoss.Core,distance=..32] run kill @s

# 当たり判定
execute unless block ~ ~ ~ air run function arena-boss:skill/fire/shot/hit-block
execute as @a[tag=Arena.Player,distance=..50] positioned ~-50 ~-50 ~-50 if predicate hitbox:hitbox at @s run function arena-boss:skill/fire/shot/hit-player
