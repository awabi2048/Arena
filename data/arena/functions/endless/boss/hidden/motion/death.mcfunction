# 死亡時モーション
execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11141
execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11041
execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Lower,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11212

execute if score $MotionTimer Arena matches 1..120 run particle dust_color_transition 0 0 0 1 0.5 0.5 0.5 ~ ~ ~ 0.25 1.25 0.25 0.5 100

execute if score $MotionTimer Arena matches 30..33 at @e[tag=Arena.LastBoss.Core] run playsound entity.wither.break_block master @a ~ ~ ~ 5 0.75

execute if score $MotionTimer Arena matches 60 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11051
execute if score $MotionTimer Arena matches 75 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11052
execute if score $MotionTimer Arena matches 90 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11053

execute if score $MotionTimer Arena matches 60 at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.hurt master @a ~ ~ ~ 3 0.666
execute if score $MotionTimer Arena matches 75 at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.hurt master @a ~ ~ ~ 3 0.53
execute if score $MotionTimer Arena matches 90 at @e[tag=Arena.LastBoss.Core] run playsound entity.wither.hurt master @a ~ ~ ~ 3 0.666

execute if score $MotionTimer Arena matches 120 at @e[tag=Arena.LastBoss.Core] run playsound entity.item.break master @a ~ ~ ~ 3 0.666
execute if score $MotionTimer Arena matches 120 at @e[tag=Arena.LastBoss.Core] run playsound block.fire.extinguish master @a ~ ~ ~ 3 0.5
execute if score $MotionTimer Arena matches 120 at @e[tag=Arena.LastBoss.Core] run playsound block.fire.extinguish master @a ~ ~ ~ 3 0.75

execute if score $MotionTimer Arena matches 120..125 at @e[tag=Arena.LastBoss.Core] run particle ash ~ ~ ~ 0.25 1.25 0.25 1 100
execute if score $MotionTimer Arena matches 120..125 at @e[tag=Arena.LastBoss.Core] run particle smoke ~ ~ ~ 0.1 0.1 0.1 0.05 100

execute if score $MotionTimer Arena matches 125 run function arena:endless/boss/hidden/kill
execute if score $MotionTimer Arena matches 125 at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.death master @a ~ ~ ~ 3 0.5

execute if score $MotionTimer Arena matches 125.. run function arena:endless/boss/hidden/motion/reset_pose

execute if score $MotionTimer Arena matches 125.. run data modify storage arena:boss Motion.Name set value "none"
