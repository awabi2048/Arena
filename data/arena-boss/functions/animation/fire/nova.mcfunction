# 大爆発
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#
# 空中tp
execute if score $AnimationTimer ArenaBoss matches 1..10 as @e[tag=ArenaBoss.Motion] run tp @s ~ ~0.75 ~ 


# いい感じの球体パーティクル
execute if score $AnimationTimer ArenaBoss matches 10 run summon marker ~ ~ ~ {Tags:["ArenaBoss.SkillMarker"],Rotation:[0.0f,-90.0f]}

execute if score $AnimationTimer ArenaBoss matches 11..70 as @e[tag=ArenaBoss.SkillMarker] at @s run tp @s ~ ~ ~ ~3 ~3
execute if score $AnimationTimer ArenaBoss matches 11..70 at @e[tag=ArenaBoss.SkillMarker] run function arena-boss:animation/fire/particle/circle

# 回転速度変更
execute if score $AnimationTimer ArenaBoss matches 1..20 run function arena-boss:animation/fire/body_spin/fast
execute if score $AnimationTimer ArenaBoss matches 21..70 run function arena-boss:animation/fire/body_spin/fastest
execute if score $AnimationTimer ArenaBoss matches 71..80 run function arena-boss:animation/fire/body_spin/slow

# 爆破
execute if score $AnimationTimer ArenaBoss matches 71 run function arena-boss:skill/fire/nova-explode

# 演出
execute if score $AnimationTimer ArenaBoss matches 11..15 run playsound entity.blaze.hurt master @a ~ ~ ~ 5 0.5
execute if score $AnimationTimer ArenaBoss matches 20 run playsound entity.enderman.scream master @a ~ ~ ~ 2 0.5

execute if score $AnimationTimer ArenaBoss matches 31..40 run playsound block.fire.extinguish master @a ~ ~ ~ 2 0.75
execute if score $AnimationTimer ArenaBoss matches 41..50 run playsound block.fire.extinguish master @a ~ ~ ~ 2 0.66
execute if score $AnimationTimer ArenaBoss matches 51..60 run playsound block.fire.extinguish master @a ~ ~ ~ 2 0.5

execute if score $AnimationTimer ArenaBoss matches 68..71 run playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
execute if score $AnimationTimer ArenaBoss matches 68..71 run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 5 0.5

# 各種フラグ設定
execute if score $AnimationTimer ArenaBoss matches 1 run data modify storage arena-boss: Animation.Flag.NoMove set value true

execute if score $AnimationTimer ArenaBoss matches 1 run data modify entity @e[tag=ArenaBoss.Motion,limit=1] NoGravity set value true
execute if score $AnimationTimer ArenaBoss matches 71 run data modify entity @e[tag=ArenaBoss.Motion,limit=1] NoGravity set value false

# リセット
execute if score $AnimationTimer ArenaBoss matches 80 run function arena-boss:animation/reset

# その他
execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float01
execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/fire/particle/regular
