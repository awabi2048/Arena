# ビーム発射1
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#
# 目標選定
execute if score $AnimationTimer ArenaBoss matches 1 run tag @r[tag=Arena.Player,distance=..32] add ArenaBoss.SkillTarget

execute as @e[tag=ArenaBoss.Core] at @s run tp @s ~ ~ ~ facing entity @p[tag=ArenaBoss.SkillTarget]

data modify entity @e[tag=ArenaBoss.Part08,limit=1] Rotation set from entity @e[tag=ArenaBoss.Core,limit=1] Rotation

# リセット
execute if score $AnimationTimer ArenaBoss matches 1 run scoreboard players set $BeamExposured ArenaBoss 0

# 発射 -> 50t受け続けたらダメージ
# 溜めモーション
tag @a remove ArenaBoss.Player.Hit
data modify storage arena-boss:temp RaycastSucceeded set value false

execute as @e[tag=ArenaBoss.Part01-3] at @s positioned ~ ~2 ~ facing entity @a[tag=ArenaBoss.Target] eyes run function arena-boss:skill/water/shot/raycast
execute if data storage arena-boss:temp {RaycastSucceeded:true} as @e[tag=ArenaBoss.Part01-3] at @s positioned ~ ~1.8 ~ facing entity @a[tag=ArenaBoss.Target] eyes rotated ~ ~2 run function arena-boss:skill/water/shot/_

execute if data storage arena-boss:temp {RaycastSucceeded:false} run scoreboard players set $BeamExposured ArenaBoss 0

# 照射時間による演出変化
execute if score $BeamExposured ArenaBoss matches 31 run playsound entity.guardian.ambient master @a ~ ~ ~ 3 1
execute if score $BeamExposured ArenaBoss matches 41 run playsound entity.guardian.ambient master @a ~ ~ ~ 3 1.3
execute if score $BeamExposured ArenaBoss matches 51 run playsound entity.guardian.ambient master @a ~ ~ ~ 3 1.7

execute if score $BeamExposured ArenaBoss matches 31 run playsound minecraft:entity.illusioner.cast_spell master @a ~ ~ ~ 0.5 0.7
execute if score $BeamExposured ArenaBoss matches 41 run playsound minecraft:entity.illusioner.cast_spell master @a ~ ~ ~ 0.5 0.8
execute if score $BeamExposured ArenaBoss matches 51 run playsound minecraft:entity.illusioner.cast_spell master @a ~ ~ ~ 0.5 0.85

execute if score $BeamExposured ArenaBoss matches 31..35 run function arena-boss:animation/water/particle/regular
execute if score $BeamExposured ArenaBoss matches 36..45 run function arena-boss:animation/water/particle/charge_1
execute if score $BeamExposured ArenaBoss matches 46..60 run function arena-boss:animation/water/particle/charge_2

execute if data storage arena-boss:temp {RaycastSucceeded:true} if score $BeamExposured ArenaBoss matches 61.. as @a[tag=ArenaBoss.Player.Hit] at @s run function arena-boss:skill/water/shot/hit


# リセット
execute if score $AnimationTimer ArenaBoss matches 200 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float01
