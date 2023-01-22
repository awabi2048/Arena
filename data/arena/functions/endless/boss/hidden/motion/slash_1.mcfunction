# スキル: 斬撃1

# ポーズ関連
    # 01
    execute if score $MotionTimer Arena matches 0 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11111
    execute if score $MotionTimer Arena matches 0 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11011

    execute if score $MotionTimer Arena matches 0 as @e[tag=Arena.LastBoss.Upper] at @s run tp @s ~ ~ ~ ~-15 ~
    execute if score $MotionTimer Arena matches 0 as @e[tag=Arena.LastBoss.Sword] at @s run tp @s ~ ~ ~ ~-15 ~

    execute if score $MotionTimer Arena matches 1 run tag @p[tag=Arena.Player] add Arena.Player.Target
    execute if score $MotionTimer Arena matches 1 as @e[tag=Arena.LastBoss.Core] at @s run tp @s ~ ~ ~ facing entity @a[tag=Arena.Player.Target,limit=1]

    # 02
    execute if score $MotionTimer Arena matches 2 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11112
    execute if score $MotionTimer Arena matches 2 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11012
    execute if score $MotionTimer Arena matches 2 as @e[tag=Arena.LastBoss.Upper] at @s run tp @s ~ ~ ~ ~15 ~
    execute if score $MotionTimer Arena matches 2 as @e[tag=Arena.LastBoss.Sword] at @s run tp @s ~ ~ ~ ~15 ~

    # 03
    execute if score $MotionTimer Arena matches 5 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11113
    execute if score $MotionTimer Arena matches 5 run data modify entity @e[tag=Arena.LastBoss.Lower,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11211
    execute if score $MotionTimer Arena matches 5 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11013

    execute if score $MotionTimer Arena matches 5 as @e[tag=Arena.LastBoss.Upper] at @s run tp @s ~ ~ ~ ~15 ~
    execute if score $MotionTimer Arena matches 5 as @e[tag=Arena.LastBoss.Sword] at @s run tp @s ~ ~ ~ ~15 ~

    execute if score $MotionTimer Arena matches 5 as @e[tag=Arena.LastBoss.Core] at @s if block ^ ^ ^1 air run tp @s ^ ^ ^1

    execute if score $MotionTimer Arena matches 5 run data merge entity @e[tag=Arena.LastBoss.Upper,limit=1] {Pose:{Head:[10.0f,0.0f,0.0f]}}
    execute if score $MotionTimer Arena matches 5 run data merge entity @e[tag=Arena.LastBoss.Sword,limit=1] {Pose:{Head:[10.0f,0.0f,0.0f]}}
    
    # 04
    execute if score $MotionTimer Arena matches 7 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11114
    execute if score $MotionTimer Arena matches 7 run data modify entity @e[tag=Arena.LastBoss.Lower,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11212
    execute if score $MotionTimer Arena matches 7 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11014
    execute if score $MotionTimer Arena matches 7 as @e[tag=Arena.LastBoss.Upper] at @s run tp @s ~ ~ ~ ~15 ~
    execute if score $MotionTimer Arena matches 7 as @e[tag=Arena.LastBoss.Sword] at @s run tp @s ~ ~ ~ ~15 ~

    execute if score $MotionTimer Arena matches 7 run data merge entity @e[tag=Arena.LastBoss.Upper,limit=1] {Pose:{Head:[20.0f,0.0f,0.0f]}}
    execute if score $MotionTimer Arena matches 7 run data merge entity @e[tag=Arena.LastBoss.Sword,limit=1] {Pose:{Head:[20.0f,0.0f,0.0f]}}

    execute if score $MotionTimer Arena matches 7 as @e[tag=Arena.LastBoss.Core] at @s if block ^ ^ ^0.75 air run tp @s ^ ^ ^0.75

    execute if score $MotionTimer Arena matches 7 as @e[tag=Arena.LastBoss.Core] at @s run function arena:endless/boss/hidden/skill/slash/01

    execute if score $MotionTimer Arena matches 15 as @e[tag=Arena.LastBoss.Core] at @s run tp @s ~ ~ ~ facing entity @a[tag=Arena.Player.Target,limit=1]

    # 後始末
    execute if score $MotionTimer Arena matches 20.. run tag @a[tag=Arena.Player.Target] remove Arena.Player.Target
    
    execute if score $MotionTimer Arena matches 20.. run kill @e[tag=Arena.LastBoss.Skill.Slash]

    execute if score $MotionTimer Arena matches 20.. run function arena:endless/boss/hidden/motion/reset_pose

    execute if score $MotionTimer Arena matches 20.. run data modify storage arena:boss Motion.Name set value "none"



