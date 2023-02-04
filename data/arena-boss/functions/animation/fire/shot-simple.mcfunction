# 炎発射1
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#
# 目標選定
execute if score $AnimationTimer ArenaBoss matches 1 run tag @r[tag=Arena.Player,distance=..32] add ArenaBoss.SkillTarget

execute as @e[tag=ArenaBoss.Core] at @s run tp @s ~ ~ ~ facing entity @p[tag=ArenaBoss.SkillTarget]

data modify entity @e[tag=ArenaBoss.Part08,limit=1] Rotation set from entity @e[tag=ArenaBoss.Core,limit=1] Rotation

# 回転速度変更
execute if score $AnimationTimer ArenaBoss matches 1..10 run function arena-boss:animation/fire/body_spin/fast
execute if score $AnimationTimer ArenaBoss matches 11..15 run function arena-boss:animation/fire/body_spin/fastest

# 発射
# 01
execute if score $AnimationTimer ArenaBoss matches 16 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~ ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}
execute if score $AnimationTimer ArenaBoss matches 16 as @e[tag=ArenaBoss.Temp] at @s facing entity @e[tag=ArenaBoss.Core] eyes rotated ~ 0 run tp @s ~ ~ ~ ~180 ~

execute if score $AnimationTimer ArenaBoss matches 16 run tag @e[tag=ArenaBoss.Temp] remove ArenaBoss.Temp

# 02
execute if score $AnimationTimer ArenaBoss matches 19 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~ ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}
execute if score $AnimationTimer ArenaBoss matches 19 as @e[tag=ArenaBoss.Temp] at @s facing entity @e[tag=ArenaBoss.Core] eyes rotated ~ 0 run tp @s ~ ~ ~ ~180 ~

execute if score $AnimationTimer ArenaBoss matches 19 run tag @e[tag=ArenaBoss.Temp] remove ArenaBoss.Temp

# 02
execute if score $AnimationTimer ArenaBoss matches 22 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~ ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}
execute if score $AnimationTimer ArenaBoss matches 22 as @e[tag=ArenaBoss.Temp] at @s facing entity @e[tag=ArenaBoss.Core] eyes rotated ~ 0 run tp @s ~ ~ ~ ~180 ~

execute if score $AnimationTimer ArenaBoss matches 22 run tag @e[tag=ArenaBoss.Temp] remove ArenaBoss.Temp


execute if score $AnimationTimer ArenaBoss matches 16 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.8
execute if score $AnimationTimer ArenaBoss matches 19 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.8
execute if score $AnimationTimer ArenaBoss matches 22 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.8

# 回転速度戻す
execute if score $AnimationTimer ArenaBoss matches 15..22 run function arena-boss:animation/fire/body_spin/fast

# リセット
execute if score $AnimationTimer ArenaBoss matches 22 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float01
execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/fire/particle/regular
