# 被攻撃時アニメーション

scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#
# 演出
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.8
execute if score $AnimationTimer ArenaBoss matches 1 run playsound entity.blaze.hurt master @a ~ ~ ~ 2 0.75

execute if score $AnimationTimer ArenaBoss matches 1 run particle item raw_gold ~ ~ ~ 0 0 0 0.1 15

