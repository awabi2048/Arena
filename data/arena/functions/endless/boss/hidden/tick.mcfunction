function arena:endless/boss/hidden/motion/tick
function arena:endless/boss/hidden/skill/tick

execute unless data entity @e[tag=Arena.LastBoss.Hitbox,limit=1] {Health:1024.0f} run function arena:endless/boss/hidden/attacked


# ボス本体の操作
execute as @e[tag=Arena.LastBoss.Body] run data modify entity @s Pos set from entity @e[tag=Arena.LastBoss.Core,limit=1] Pos
data modify entity @e[tag=Arena.LastBoss.Core,limit=1] Rotation[1] set value 0.0f

execute if data storage arena: {Boss:{Motion:{Name:"none"}}} as @e[tag=Arena.LastBoss.Core] at @s if block ~ ~-0.05 ~ air run tp @s ~ ~-0.05 ~
execute if data storage arena: {Boss:{Motion:{Name:"none"}}} as @e[tag=Arena.LastBoss.Core] at @s if block ~ ~-0.05 ~ air run tp @s ~ ~-0.05 ~

execute if data storage arena: {Boss:{Motion:{Name:"none"}}} as @e[tag=Arena.LastBoss.Core] at @s unless block ~ ~-0.05 ~ air run tp @s ~ ~0.05 ~

