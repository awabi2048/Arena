# 通常時アニメーション

# パーツぐるぐる
function arena-boss:animation/fire/body_spin/normal

# パーティクル
# 煙
particle smoke ~ ~0.5 ~ 0.25 0.5 0.25 0.01 10

# 棒から赤パーティクル
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^0.875 ^0.35 ^ 0 0.2 0 0 1
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^-0.875 ^0.35 ^ 0 0.2 0 0 1
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^ ^0.4 ^0.875 0 0.2 0 0 1
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^ ^0.4 ^-0.875 0 0.2 0 0 1

# ネザーっぽい
particle crimson_spore ~ ~2 ~ 0.5 2 0.5 0 3

# ふわふわ
execute as @e[tag=ArenaBoss.Extra01] at @s run function arena-boss:animation/library/float


