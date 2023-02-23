# 移動時処理

# 距離に応じた速度で移動
execute if entity @a[tag=ArenaBoss.Target,distance=4..8] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.0625 ~ ~ 
execute if entity @a[tag=ArenaBoss.Target,distance=8..24] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.125 ~ ~

execute unless block ~ ~ ~ air run tp @s ~ ~1 ~
execute if block ~ ~-0.25 ~ air run tp @s ~ ~-0.125 ~

execute as @e[tag=ArenaBoss.Part08,distance=..2] positioned as @s in minecraft:arena run tp @s ~ ~ ~ ~ ~


# 位置同期
data modify entity @e[tag=ArenaBoss.Part08,limit=1] Rotation[0] set from entity @e[tag=ArenaBoss.Core,limit=1] Rotation[0]

execute positioned as @s as @s in minecraft:arena run tp @s ~ ~ ~
execute positioned as @s as @e[tag=ArenaBoss.Hitbox] in minecraft:arena run tp @s ~ ~ ~

execute as @e[tag=ArenaBoss.Element-Parts] positioned as @e[tag=ArenaBoss.Extra01] in minecraft:arena run tp @s ~ ~ ~

data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[0] set from entity @e[tag=ArenaBoss.Core,limit=1] Pos[0]
data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[2] set from entity @e[tag=ArenaBoss.Core,limit=1] Pos[2]

# ハメられてたら離脱
execute if entity @a[tag=Arena.Player,distance=..5] run scoreboard players add $PlayerCloseTime ArenaBoss 1
execute unless entity @a[tag=Arena.Player,distance=..5] run scoreboard players set $PlayerCloseTime ArenaBoss 0

execute if score $PlayerCloseTime ArenaBoss matches 200.. if data storage arena-boss: {Animation:{Name:"Regular"}} run data modify storage arena-boss: Animation.Name set value "Escape"

# 意図せず構成エンティティの距離が離れてしまった場合
execute unless entity @e[tag=ArenaBoss.Extra01,distance=..0.5] run tp @e[tag=ArenaBoss.Element] ~ ~ ~
