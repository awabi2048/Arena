# 炎発射2
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#
# 頭回転
execute if score $AnimationTimer ArenaBoss matches 1..20 as @e[tag=ArenaBoss.Part08] at @s run tp @s ~ ~ ~ ~18 ~
execute if score $AnimationTimer ArenaBoss matches 21..30 as @e[tag=ArenaBoss.Part08] at @s run tp @s ~ ~ ~ ~36 ~
execute if score $AnimationTimer ArenaBoss matches 31..40 as @e[tag=ArenaBoss.Part08] at @s run tp @s ~ ~ ~ ~18 ~

execute if score $AnimationTimer ArenaBoss matches 21..40 as @e[tag=ArenaBoss.Core] at @s run tp @s ~ ~ ~ ~18 ~

# 回転速度変更
execute if score $AnimationTimer ArenaBoss matches 1..20 run function arena-boss:animation/fire/body_spin/fast
execute if score $AnimationTimer ArenaBoss matches 21..40 run function arena-boss:animation/fire/body_spin/fastest

# 発射
execute if score $AnimationTimer ArenaBoss matches 21..40 at @e[tag=ArenaBoss.Core] rotated ~9 ~ positioned ^ ^ ^1 run summon marker ~ ~0.6 ~ {Tags:["ArenaBoss.Skill02"]}
execute if score $AnimationTimer ArenaBoss matches 21..40 at @e[tag=ArenaBoss.Core] rotated ~-9 ~ positioned ^ ^ ^1 run summon marker ~ ~0.6 ~ {Tags:["ArenaBoss.Skill02"]}

# 演出
execute if score $AnimationTimer ArenaBoss matches 1..3 run playsound block.fire.extinguish master @a ~ ~ ~ 2 0.66
execute if score $AnimationTimer ArenaBoss matches 4 run playsound minecraft:block.beacon.ambient master @a ~ ~ ~ 2 1.33

execute if score $AnimationTimer ArenaBoss matches 21..30 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 1.2
execute if score $AnimationTimer ArenaBoss matches 21..30 run playsound entity.blaze.shoot master @a ~ ~ ~ 2 0.5

# リセット
execute if score $AnimationTimer ArenaBoss matches 40 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float
execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/fire/particle/regular

# 動き停止
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true
