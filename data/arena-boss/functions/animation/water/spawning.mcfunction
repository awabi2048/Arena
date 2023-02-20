# 召喚中

# ここからアニメーション
#

scoreboard players add $AnimationTimer ArenaBoss 1

# 回転
execute if score $AnimationTimer ArenaBoss matches 61..80 run function arena-boss:animation/fire/body_spin/fastest
execute if score $AnimationTimer ArenaBoss matches 81..100 run function arena-boss:animation/fire/body_spin/fast

# 演出
execute if score $AnimationTimer ArenaBoss matches 1 run playsound block.lava.extinguish master @a ~ ~ ~ 5 1.7
execute if score $AnimationTimer ArenaBoss matches 1 run playsound block.lava.extinguish master @a ~ ~ ~ 5 0.75

execute if score $AnimationTimer ArenaBoss matches 1 run playsound block.lava.ambient master @a ~ ~ ~ 5 0.85

execute if score $AnimationTimer ArenaBoss matches 20 run playsound entity.generic.explode master @a ~ ~ ~ 5 1.65
execute if score $AnimationTimer ArenaBoss matches 20 run playsound entity.blaze.shoot master @a ~ ~ ~ 5 0.66

execute if score $AnimationTimer ArenaBoss matches 20 run particle lava ~ ~ ~ 0 0 0 1 100
execute if score $AnimationTimer ArenaBoss matches 20 run particle crimson_spore ~ ~ ~ 1 1 1 1 100

execute if score $AnimationTimer ArenaBoss matches 21..30 run playsound block.lava.extinguish master @a ~ ~ ~ 5 0.5

execute if score $AnimationTimer ArenaBoss matches 25 run playsound item.trident.thunder master @a ~ ~ ~ 5 0.5

execute if score $AnimationTimer ArenaBoss matches 40 run playsound block.conduit.activate master @a ~ ~ ~ 5 0.5
execute if score $AnimationTimer ArenaBoss matches 40 run playsound entity.wither.spawn master @a ~ ~ ~ 5 0.67

execute if score $AnimationTimer ArenaBoss matches 60 run playsound entity.blaze.death master @a ~ ~ ~ 5 0.66
execute if score $AnimationTimer ArenaBoss matches 60 run playsound entity.blaze.death master @a ~ ~ ~ 5 0.8

execute if score $AnimationTimer ArenaBoss matches 60 run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.5

# くるくるパーティクル
execute if score $AnimationTimer ArenaBoss matches 20 as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Boss}}} at @s run summon marker ~3 ~3 ~3 {Tags:["ArenaBoss.SkillMarker"]}
execute if score $AnimationTimer ArenaBoss matches 20 as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Boss}}} at @s run summon marker ~-3 ~3 ~3 {Tags:["ArenaBoss.SkillMarker"]}
execute if score $AnimationTimer ArenaBoss matches 20 as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Boss}}} at @s run summon marker ~3 ~3 ~-3 {Tags:["ArenaBoss.SkillMarker"]}
execute if score $AnimationTimer ArenaBoss matches 20 as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Boss}}} at @s run summon marker ~-3 ~3 ~-3 {Tags:["ArenaBoss.SkillMarker"]}

execute if score $AnimationTimer ArenaBoss matches 21..60 at @e[tag=ArenaBoss.SkillMarker] run particle flame ~ ~ ~ ^ ^ ^1000000000 0.0000000005 0
execute if score $AnimationTimer ArenaBoss matches 21..60 at @e[tag=ArenaBoss.SkillMarker] run particle soul_fire_flame ~ ~ ~ ^0.5 ^ ^1000000000 0.0000000002 0

execute if score $AnimationTimer ArenaBoss matches 21..60 at @e[tag=ArenaBoss.SkillMarker] run particle dripping_lava ~ ~ ~ 0 0 0 0 2
execute if score $AnimationTimer ArenaBoss matches 21..60 at @e[tag=ArenaBoss.SkillMarker] run particle lava ~ ~ ~ 0 0 0 1 1

execute if score $AnimationTimer ArenaBoss matches 21..60 as @e[tag=ArenaBoss.SkillMarker] at @s run tp @s ^0.25 ^ ^0.125 facing entity @e[tag=Arena.Core,sort=nearest,limit=1] feet

# summon
execute if score $AnimationTimer ArenaBoss matches 60 at @e[tag=Arena.Core,sort=nearest,limit=1] run function arena-boss:summon/fire

# リセット
execute if score $AnimationTimer ArenaBoss matches 80 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/fire/particle/regular

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true
