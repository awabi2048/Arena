summon marker ~ ~ ~ {Tags:["Arena.Boss.SkillRanged","Arena.Boss.Marker"]}

# Rotation用の乱数
summon marker ~ ~ ~ {Tags:["Arena.Random"]}
execute store result score $Temp.Random Arena run data get entity @e[tag=Arena.Random,limit=1] UUID[0]
kill @e[tag=Arena.Random]
scoreboard players operation $Temp.Random Arena %= #360 Arena

execute store result entity @e[tag=Arena.Boss.SkillRanged,sort=nearest,limit=1] Rotation[0] float 1 run scoreboard players get $Temp.Random Arena
execute as @e[tag=Arena.Boss.SkillRanged,sort=nearest,limit=1] at @s run tp @s ^ ^ ^3

playsound entity.enderman.teleport master @a ~ ~ ~ 5 1.2
playsound entity.enderman.hurt master @a ~ ~ ~ 5 1.9
playsound block.enchantment_table.use master @a ~ ~ ~ 5 1.8
