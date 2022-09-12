execute at @e[tag=Arena.SummonPoint,sort=nearest,limit=4,distance=..32] run summon stray ~ ~0.5 ~ {Tags:["Arena.Mob","Arena.MiniBoss","Arena.Summoned"],Attributes:[{Name:"generic.max_health",Base:100d},{Name:"generic.attack_damage",Base:15d},{Name:"generic.movement_speed",Base:0.25d}],Health:100f,HandItems:[{id:"minecraft:golden_sword",Count:1b},{}],DeathLootTable:"arena:boss/mini_boss"}

# 通常時
scoreboard players set $Temp.Health Arena 500
scoreboard players set $Temp.AttackDamage Arena 200
scoreboard players set $Temp.Speed Arena 20

execute store result score $Temp.AttributesMultiple Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -10
scoreboard players add $Temp.AttributesMultiple Arena 100

scoreboard players operation $Temp.Health Arena *= $Temp.AttributesMultiple Arena
scoreboard players operation $Temp.AttackDamage Arena *= $Temp.AttributesMultiple Arena
scoreboard players operation $Temp.Speed Arena *= $Temp.AttributesMultiple Arena

execute if score $Temp.Speed Arena matches 300.. run scoreboard players set $Temp.Speed Arena 300

# ボス用
execute if entity @e[tag=Arena.Boss] run scoreboard players set $Temp.Health Arena 400000
execute if entity @e[tag=Arena.Boss] run scoreboard players set $Temp.AttackDamage Arena 7000
execute if entity @e[tag=Arena.Boss] run scoreboard players set $Temp.Speed Arena 330

execute store result storage arena: Temp.MobInfo.Health double 0.001 run scoreboard players get $Temp.Health Arena
execute store result storage arena: Temp.MobInfo.AttackDamage double 0.001 run scoreboard players get $Temp.AttackDamage Arena
execute store result storage arena: Temp.MobInfo.Speed double 0.001 run scoreboard players get $Temp.Speed Arena


function arena:summon/set_attributes
execute as @e[tag=Arena.Summoned,tag=Arena.MiniBoss] run data modify entity @s Health set from storage arena: Temp.MobInfo.Health

playsound entity.zombie_villager.cure master @a ~ ~ ~ 1 1.2
