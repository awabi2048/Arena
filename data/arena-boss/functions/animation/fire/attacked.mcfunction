# 被弾時アニメーション

scoreboard players add $AnimationTimer ArenaBoss 1

function arena-boss:animation/fire/regular

# リセット
execute if score $AnimationTimer ArenaBoss matches 10 run function arena-boss:animation/reset

