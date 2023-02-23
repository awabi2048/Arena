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
#Memo: 破壊したらボスにまあまあなダメージ
execute if score $AnimationTimer ArenaBoss matches 1 run summon armor_stand ~4 ~-5 ~4 {Tags:["ArenaBoss.Skill03","ArenaBoss.SkillMarker"],ArmorItems:[{},{},{},{id:"minecraft:orange_dye",Count:1b,tag:{CustomModelData:490101}}],Invisible:true,Marker:true,Fire:20000}
execute if score $AnimationTimer ArenaBoss matches 1 run summon armor_stand ~-4 ~-5 ~-4 {Tags:["ArenaBoss.Skill03","ArenaBoss.SkillMarker"],ArmorItems:[{},{},{},{id:"minecraft:orange_dye",Count:1b,tag:{CustomModelData:490101}}],Invisible:true,Marker:true,Fire:20000}
execute if score $AnimationTimer ArenaBoss matches 1 run summon armor_stand ~4 ~-5 ~-4 {Tags:["ArenaBoss.Skill03","ArenaBoss.SkillMarker"],ArmorItems:[{},{},{},{id:"minecraft:orange_dye",Count:1b,tag:{CustomModelData:490101}}],Invisible:true,Marker:true,Fire:20000}
execute if score $AnimationTimer ArenaBoss matches 1 run summon armor_stand ~-4 ~-5 ~4 {Tags:["ArenaBoss.Skill03","ArenaBoss.SkillMarker"],ArmorItems:[{},{},{},{id:"minecraft:orange_dye",Count:1b,tag:{CustomModelData:490101}}],Invisible:true,Marker:true,Fire:20000}

execute if score $AnimationTimer ArenaBoss matches 1..40 as @e[tag=ArenaBoss.Skill03,distance=..16] at @s unless block ~ ~ ~ air run tp @s ~ ~0.125 ~ ~6 ~

execute if score $AnimationTimer ArenaBoss matches 40 at @e[tag=ArenaBoss.Skill03,distance=..16] run summon armor_stand ~ ~-0.5 ~ {Tags:["ArenaBoss.SkillMarker"],Small:true,Marker:true,Invisible:true,Passengers:[{id:"minecraft:enderman",Tags:["ArenaBoss.Skill03-Hitbox","ArenaBoss.SkillMarker"],DeathLootTable:"empty",ActiveEffects:[{Id:14,Duration:2147483647,ShowParticles:false}],Silent:true,NoAI:true,NoGravity:true,Health:300.0f,Attributes:[{Name:"minecraft:generic.max_health",Base:300.0d}]}]}

# 爆破
execute if score $AnimationTimer ArenaBoss matches 200 as @e[tag=ArenaBoss.Skill03,distance=..16] at @s run function arena-boss:skill/fire/burning_pillar/explode

# 演出
execute if score $AnimationTimer ArenaBoss matches 1..40 run playsound block.stone.break master @a ~ ~ ~ 5 0.66

execute if score $AnimationTimer ArenaBoss matches 50 run playsound entity.ender_dragon.growl master @a ~ ~ ~ 5 0.8
execute if score $AnimationTimer ArenaBoss matches 50 run playsound block.conduit.deactivate master @a ~ ~ ~ 5 0.75

# リセット
#Memo: Hitboxは直接killするとプレイヤーの進捗達成判定にあたってしまうため、Health変更で対応
execute if score $AnimationTimer ArenaBoss matches 200 run kill @e[tag=ArenaBoss.Skill03,distance=..16]
execute if score $AnimationTimer ArenaBoss matches 200 as @e[tag=ArenaBoss.Skill03-Hitbox] run data modify entity @s Health set value 0.0f

execute if score $AnimationTimer ArenaBoss matches 200 run function arena-boss:animation/reset

# その他
function arena-boss:animation/fire/particle/regular
function arena-boss:animation/fire/particle/shield

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true
