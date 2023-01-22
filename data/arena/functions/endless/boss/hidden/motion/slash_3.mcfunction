# スキル: 溜め -> 斬撃3

execute if score $MotionTimer Arena matches 0 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11131
execute if score $MotionTimer Arena matches 0 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11071

execute if score $MotionTimer Arena matches 10 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11132
execute if score $MotionTimer Arena matches 10 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11072

execute if score $MotionTimer Arena matches 10 as @e[tag=Arena.LastBoss.Upper] run data merge entity @e[tag=Arena.LastBoss.Upper,limit=1] {Pose:{Head:[-10.0f,0.0f,0.0f]}}
execute if score $MotionTimer Arena matches 10 as @e[tag=Arena.LastBoss.Sword] run data merge entity @e[tag=Arena.LastBoss.Upper,limit=1] {Pose:{Head:[-10.0f,0.0f,0.0f]}}

execute if score $MotionTimer Arena matches 10..110 at @e[tag=Arena.LastBoss.Core] run particle flash ~ ~3 ~ 0.125 0.125 0.125 1 5
execute if score $MotionTimer Arena matches 10..110 at @e[tag=Arena.LastBoss.Core] run particle electric_spark ~ ~3 ~ 0.125 0.125 0.125 1 30

execute if score $MotionTimer Arena matches 10 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute if score $MotionTimer Arena matches 32 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute if score $MotionTimer Arena matches 50 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute if score $MotionTimer Arena matches 65 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute if score $MotionTimer Arena matches 75 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute if score $MotionTimer Arena matches 83 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute if score $MotionTimer Arena matches 89 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2
execute if score $MotionTimer Arena matches 94 at @e[tag=Arena.LastBoss.Core] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 3 2

execute if score $MotionTimer Arena matches 110 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11073
execute if score $MotionTimer Arena matches 110 run data merge entity @e[tag=Arena.LastBoss.Upper,limit=1] {Pose:{Head:[10.0f,0.0f,0.0f]}}
execute if score $MotionTimer Arena matches 110 run data merge entity @e[tag=Arena.LastBoss.Sword,limit=1] {Pose:{Head:[10.0f,0.0f,0.0f]}}

execute if score $MotionTimer Arena matches 111..120 as @e[tag=Arena.LastBoss.Core] at @s run tp @s ~ ~ ~ ~-36 ~
execute if score $MotionTimer Arena matches 111..120 as @e[tag=Arena.LastBoss.Body] at @s run tp @s ~ ~ ~ ~-36 ~

execute if score $MotionTimer Arena matches 111..120 at @e[tag=Arena.LastBoss.Core] run function arena:endless/boss/hidden/skill/slash/03
execute if score $MotionTimer Arena matches 111..120 at @e[tag=Arena.LastBoss.Core] rotated ~18 ~ run function arena:endless/boss/hidden/skill/slash/03

execute if score $MotionTimer Arena matches 110 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11121
execute if score $MotionTimer Arena matches 110 run data modify entity @e[tag=Arena.LastBoss.Lower,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11212
execute if score $MotionTimer Arena matches 110 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11021

execute if score $MotionTimer Arena matches 113 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11122
execute if score $MotionTimer Arena matches 113 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11022

execute if score $MotionTimer Arena matches 116 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11123
execute if score $MotionTimer Arena matches 116 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11023

execute if score $MotionTimer Arena matches 120 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11124
execute if score $MotionTimer Arena matches 120 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11024


# 後始末
execute if score $MotionTimer Arena matches 150.. run function arena:endless/boss/hidden/motion/reset_pose

execute if score $MotionTimer Arena matches 150.. run data modify storage arena:boss Motion.Name set value "none"



