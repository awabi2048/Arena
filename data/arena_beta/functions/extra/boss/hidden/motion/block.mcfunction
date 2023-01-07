# 攻撃受けたときブロック
execute if score $MotionTimer Arena matches 1 as @e[tag=Arena.LastBoss.Core] at @s if block ^ ^ ^-0.5 air run tp @s ^ ^ ^-0.5 facing entity @p[tag=Arena.Player]

execute if score $MotionTimer Arena matches 1 as @e[tag=Arena.LastBoss.Upper] at @s run tp @s ~ ~ ~ ~15 ~
execute if score $MotionTimer Arena matches 1 as @e[tag=Arena.LastBoss.Sword] at @s run tp @s ~ ~ ~ ~15 ~

execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11141
execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11041
execute if score $MotionTimer Arena matches 1 run data modify entity @e[tag=Arena.LastBoss.Lower,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11212

# カウンター
execute if score $MotionTimer Arena matches 10 run function arena:rng

execute if score $MotionTimer Arena matches 10 store result score $Temp.Health Arena run data get storage arena: Boss.Health
execute if score $MotionTimer Arena matches 10 unless score $Temp.Health Arena matches ..500 if score $Random Arena matches ..33 run function arena:endless/boss/hidden/skill/slash/_
execute if score $MotionTimer Arena matches 10 if score $Temp.Health Arena matches ..500 if score $Random Arena matches ..66 run function arena:endless/boss/hidden/skill/slash/_

# 後始末
    execute if score $MotionTimer Arena matches 15.. run function arena:endless/boss/hidden/motion/reset_pose

    execute if score $MotionTimer Arena matches 15.. run data modify storage arena: Boss.Motion.Name set value "none"
