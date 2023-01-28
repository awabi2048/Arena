# 通常時アニメーション

# パーツぐるぐる
# 棒
execute as @e[tag=ArenaBoss.Part01,distance=..2] at @s run tp @s ~ ~ ~ ~12 ~
execute as @e[tag=ArenaBoss.Part02,distance=..2] at @s run tp @s ~ ~ ~ ~-9 ~
execute as @e[tag=ArenaBoss.Part03,distance=..2] at @s run tp @s ~ ~ ~ ~4 ~
execute as @e[tag=ArenaBoss.Part04,distance=..2] at @s run tp @s ~ ~ ~ ~-3 ~

# 板
execute as @e[tag=ArenaBoss.Part05,distance=..2] at @s run tp @s ~ ~ ~ ~5 ~
execute as @e[tag=ArenaBoss.Part06,distance=..2] at @s run tp @s ~ ~ ~ ~-3 ~

# 体
execute as @e[tag=ArenaBoss.Part07,distance=..2] at @s run tp @s ~ ~ ~ ~2 ~

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
function arena-boss:animation/library/float
