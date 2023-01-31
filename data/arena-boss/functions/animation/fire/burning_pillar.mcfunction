# 柱ドカ
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#

# 回転速度変更
execute if score $AnimationTimer ArenaBoss matches 1..40 run function arena-boss:animation/fire/body_spin/fast
execute if score $AnimationTimer ArenaBoss matches 41..50 run function arena-boss:animation/fire/body_spin/fastest
execute if score $AnimationTimer ArenaBoss matches 51.. run function arena-boss:animation/fire/body_spin/slow

# 召喚 & 地面から生やす
execute if score $AnimationTimer ArenaBoss matches 1 at @e[tag=ArenaBoss.Core] run summon armor_stand ~4 ~-5 ~4 {Tags:["ArenaBoss.Skill03"],ArmorItems:[{},{},{},{id:"minecraft:stick",Count:1b,tag:{CustomModelData:910190101}}],Invisible:true,Marker:true}
execute if score $AnimationTimer ArenaBoss matches 1 at @e[tag=ArenaBoss.Core] run summon armor_stand ~-4 ~-5 ~-4 {Tags:["ArenaBoss.Skill03"],ArmorItems:[{},{},{},{id:"minecraft:stick",Count:1b,tag:{CustomModelData:910190101}}],Invisible:true,Marker:true}
execute if score $AnimationTimer ArenaBoss matches 1 at @e[tag=ArenaBoss.Core] run summon armor_stand ~4 ~-5 ~-4 {Tags:["ArenaBoss.Skill03"],ArmorItems:[{},{},{},{id:"minecraft:stick",Count:1b,tag:{CustomModelData:910190101}}],Invisible:true,Marker:true}
execute if score $AnimationTimer ArenaBoss matches 1 at @e[tag=ArenaBoss.Core] run summon armor_stand ~-4 ~-5 ~4 {Tags:["ArenaBoss.Skill03"],ArmorItems:[{},{},{},{id:"minecraft:stick",Count:1b,tag:{CustomModelData:910190101}}],Invisible:true,Marker:true}

execute if score $AnimationTimer ArenaBoss matches 1..40 as @e[tag=ArenaBoss.Skill03] at @s run tp @s ~ ~0.125 ~ ~6 ~

# 演出
execute if score $AnimationTimer ArenaBoss matches 1..40 run playsound block.stone.break master @a ~ ~ ~ 5 0.66

execute if score $AnimationTimer ArenaBoss matches 50 run playsound entity.ender_dragon.growl master @a ~ ~ ~ 5 0.8
execute if score $AnimationTimer ArenaBoss matches 50 run playsound block.conduit.deactivate master @a ~ ~ ~ 5 0.75

# リセット
execute if score $AnimationTimer ArenaBoss matches 300 run kill @e[tag=ArenaBoss.Skill03]

execute if score $AnimationTimer ArenaBoss matches 300 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/fire/particle/regular

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true
