# tick: 弾
# 演出
particle flame ~ ~ ~ 0 0 0 0.05 3

# 本体操作
execute facing entity @e[tag=ArenaBoss.Core,limit=1] eyes rotated ~ 0 run tp @s ^0.5 ^ ^-0.75 
execute unless entity @e[tag=ArenaBoss.Core,distance=..16] run kill @s

# 当たり判定
execute unless block ~ ~ ~ air run function arena-boss:skill/fire/shot/hit-block
execute as @a[tag=Arena.Player,distance=..1.25] at @s run function arena-boss:skill/fire/shot/hit-player
