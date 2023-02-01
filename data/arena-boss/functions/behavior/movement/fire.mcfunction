# 移動時処理

# 距離に応じた速度で移動
execute as @e[tag=ArenaBoss.Motion] at @s if entity @a[tag=ArenaBoss.Target,distance=4..8] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.0625 ~ ~ 
execute as @e[tag=ArenaBoss.Motion] at @s if entity @a[tag=ArenaBoss.Target,distance=8..24] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.125 ~ ~

execute as @e[tag=ArenaBoss.Part08] at @s rotated as @e[tag=ArenaBoss.Core] run tp @s ~ ~ ~ ~ ~


# 位置同期
data modify entity @e[tag=ArenaBoss.Part08,limit=1] Rotation[0] set from entity @e[tag=ArenaBoss.Motion,limit=1] Rotation[0]

execute as @e[tag=ArenaBoss.Core] positioned as @e[tag=ArenaBoss.Motion,limit=1] run tp @s ~ ~ ~
execute as @e[tag=ArenaBoss.Hitbox] positioned as @e[tag=ArenaBoss.Core] run tp @s ~ ~ ~

execute as @e[tag=ArenaBoss.Element-Parts] positioned as @e[tag=ArenaBoss.Extra01] run tp @s ~ ~-0.25 ~

data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[0] set from entity @e[tag=ArenaBoss.Motion,limit=1] Pos[0]
data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[2] set from entity @e[tag=ArenaBoss.Motion,limit=1] Pos[2]

# ハメられてたら離脱
execute at @e[tag=ArenaBoss.Core] if entity @a[tag=Arena.Player,distance=..5] run scoreboard players add $PlayerCloseTime ArenaBoss 1
execute at @e[tag=ArenaBoss.Core] unless entity @a[tag=Arena.Player,distance=..5] run scoreboard players set $PlayerCloseTime ArenaBoss 0

execute if score $PlayerCloseTime ArenaBoss matches 200.. if data storage arena-boss: {Animation:{Name:"Regular"}} run data modify storage arena-boss: Animation.Name set value "Escape"

# 緊急時
execute at @e[tag=ArenaBoss.Core] unless entity @e[tag=ArenaBoss.Extra01,distance=..2.5] run tp @e[tag=ArenaBoss.Element] ~ ~ ~
