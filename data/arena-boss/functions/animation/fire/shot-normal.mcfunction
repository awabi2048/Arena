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
execute if score $AnimationTimer ArenaBoss matches 1..15 run function arena-boss:animation/fire/body_spin/fast
execute if score $AnimationTimer ArenaBoss matches 16..25 run function arena-boss:animation/fire/body_spin/fastest

# 発射
execute if score $AnimationTimer ArenaBoss matches 22 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~15 ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}
execute if score $AnimationTimer ArenaBoss matches 22 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~ ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}
execute if score $AnimationTimer ArenaBoss matches 22 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~-15 ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}

execute if score $AnimationTimer ArenaBoss matches 22 as @e[tag=ArenaBoss.Temp] at @s facing entity @e[tag=ArenaBoss.Core] eyes rotated ~ 0 run tp @s ~ ~ ~ ~180 ~
execute if score $AnimationTimer ArenaBoss matches 22 run tag @e[tag=ArenaBoss.Temp] remove ArenaBoss.Temp

execute if score $AnimationTimer ArenaBoss matches 22 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.6


execute if score $AnimationTimer ArenaBoss matches 25 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~7.5 ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}
execute if score $AnimationTimer ArenaBoss matches 25 at @e[tag=ArenaBoss.Core] positioned ~ ~1 ~ rotated ~-7.5 ~ positioned ^ ^ ^1 run summon marker ~ ~ ~ {Tags:["ArenaBoss.Skill01","ArenaBoss.SkillMarker","ArenaBoss.Temp"]}

execute if score $AnimationTimer ArenaBoss matches 25 as @e[tag=ArenaBoss.Temp] at @s facing entity @e[tag=ArenaBoss.Core] eyes rotated ~ 0 run tp @s ~ ~ ~ ~180 ~
execute if score $AnimationTimer ArenaBoss matches 25 run tag @e[tag=ArenaBoss.Temp] remove ArenaBoss.Temp

execute if score $AnimationTimer ArenaBoss matches 25 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.6


# 回転速度戻す
execute if score $AnimationTimer ArenaBoss matches 26..30 run function arena-boss:animation/fire/body_spin/fast

# リセット
execute if score $AnimationTimer ArenaBoss matches 30 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float01
execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/fire/particle/regular
