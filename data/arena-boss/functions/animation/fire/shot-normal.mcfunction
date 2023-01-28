# 炎発射1
# タイマー増加
scoreboard players add $AnimationTimer ArenaBoss 1

# ここからアニメーション
#
execute if score $AnimationTimer ArenaBoss matches 1..10 run 
