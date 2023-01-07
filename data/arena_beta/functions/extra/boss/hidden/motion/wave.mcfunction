# Motion: 波動
execute if score $MotionTimer Arena matches 0 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11131
execute if score $MotionTimer Arena matches 0 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11231

execute if score $MotionTimer Arena matches 10 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11132

execute if score $MotionTimer Arena matches 10..12 run playsound entity.ender_dragon.ambient master @a ~ ~ ~ 3 0.5

