# ハメられてたら退避
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
# 
# 回転
execute if score $AnimationTimer ArenaBoss matches 1..10 run function arena-boss:animation/fire/body_spin/fast
execute if score $AnimationTimer ArenaBoss matches 11..30 run function arena-boss:animation/fire/body_spin/fastest
execute if score $AnimationTimer ArenaBoss matches 31..40 run function arena-boss:animation/fire/body_spin/fast

# 目標選定
execute if score $AnimationTimer ArenaBoss matches 1 run tag @r[tag=Arena.Player,distance=..32] add ArenaBoss.SkillTarget

# 演出
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.ambient master @a ~ ~ ~ 1 0.66
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.hurt master @a ~ ~ ~ 1 0.5

execute if score $AnimationTimer ArenaBoss matches 11..40 run playsound entity.generic.explode master @a ~ ~ ~ 2 0.7

execute if score $AnimationTimer ArenaBoss matches 11..40 run particle explosion ~ ~ ~ 0 1 0 1 5

# 移動
execute if score $AnimationTimer ArenaBoss matches 11..40 as @e[tag=ArenaBoss.Core,distance=..2] at @s if entity @p[tag=ArenaBoss.SkillTarget,distance=16.01..] run tp @s ^ ^ ^1 facing entity @p[tag=ArenaBoss.SkillTarget]
execute if score $AnimationTimer ArenaBoss matches 11..40 as @e[tag=ArenaBoss.Core,distance=..2] at @s if entity @p[tag=ArenaBoss.SkillTarget,distance=8.01..16] run tp @s ^ ^ ^0.5 facing entity @p[tag=ArenaBoss.SkillTarget]
execute if score $AnimationTimer ArenaBoss matches 11..40 as @e[tag=ArenaBoss.Core,distance=..2] at @s if entity @p[tag=ArenaBoss.SkillTarget,distance=3..8] run tp @s ^ ^ ^0.25 facing entity @p[tag=ArenaBoss.SkillTarget]

# 攻撃
execute if score $AnimationTimer ArenaBoss matches 10 run data modify storage score_damage: Argument set value {Damage:10.0d,DamageType:Blast}
execute if score $AnimationTimer ArenaBoss matches 11..40 as @a[tag=Arena.Player,distance=..4] run function score_damage:api/attack

# リセット
execute if score $AnimationTimer ArenaBoss matches 40 run function arena-boss:animation/reset

# その他
function arena-boss:animation/fire/particle/regular
