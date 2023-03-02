# 移動時処理
# 距離に応じた速度で移動
execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} if entity @a[tag=ArenaBoss.Target,distance=4..8] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.0625 ~ ~ 
execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} if entity @a[tag=ArenaBoss.Target,distance=8.01..24] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.125 ~ ~
execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} if entity @a[tag=ArenaBoss.Target,distance=24.01..] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.5 ~ ~

execute as @e[tag=ArenaBoss.Part08,distance=..2] positioned as @s in minecraft:arena run tp @s ~ ~ ~ ~ ~

# 位置同期
execute rotated as @e[tag=ArenaBoss.Core,limit=1] positioned as @e[tag=ArenaBoss.Part08,limit=1] in minecraft:arena run tp @e[tag=ArenaBoss.Part08,limit=1] ~ ~ ~ ~ ~

execute positioned as @s in minecraft:arena run tp @e[tag=ArenaBoss.Hitbox,limit=1] ~ ~ ~

execute positioned as @e[tag=ArenaBoss.Extra01] in minecraft:arena run tp @e[tag=ArenaBoss.Element-Parts] ~ ~ ~

data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[0] set from entity @e[tag=ArenaBoss.Core,limit=1] Pos[0]
data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[2] set from entity @e[tag=ArenaBoss.Core,limit=1] Pos[2]

# ハメられてたら離脱
execute if entity @a[tag=Arena.Player,distance=..3.5] run scoreboard players add $PlayerCloseTime ArenaBoss 1
execute unless entity @a[tag=Arena.Player,distance=..3.5] run scoreboard players set $PlayerCloseTime ArenaBoss 0

execute if score $PlayerCloseTime ArenaBoss matches 200.. if data storage arena-boss: {Animation:{Name:"Regular"}} run data modify storage arena-boss: Animation.Name set value "Escape"
