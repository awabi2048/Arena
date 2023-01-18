# 攻撃受けたときブロック
execute if score $MotionTimer Arena matches 1..20 at @e[tag=Arena.LastBoss.Core] run particle reverse_portal ~ ~ ~ 0.25 1.5 0.25 0.1 120

execute if score $MotionTimer Arena matches 10..20 at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.teleport master @a ~ ~ ~ 1 2

execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11161
execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11061

execute if score $MotionTimer Arena matches 20 at @e[tag=Arena.LastBoss.Core] run playsound entity.enderman.scream master @a ~ ~ ~ 1 0.86
execute if score $MotionTimer Arena matches 20 at @e[tag=Arena.LastBoss.Core] at @e[tag=Arena.SummonPoint,scores={Arena=-1},sort=random,limit=1,distance=8..16] run tp @e[tag=Arena.LastBoss.Core] ~ ~-0.5 ~

# 後始末
    execute if score $MotionTimer Arena matches 30.. run function arena_beta:extra/boss/hidden/motion/reset_pose

    execute if score $MotionTimer Arena matches 30.. run data modify storage arena: Boss.Motion.Name set value "none"
