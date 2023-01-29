# パーティクル
# 煙
particle smoke ~ ~0.5 ~ 0.25 0.5 0.25 0.01 10

# 棒から赤パーティクル
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^0.875 ^0.35 ^ 0 0.2 0 0 1
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^-0.875 ^0.35 ^ 0 0.2 0 0 1
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^ ^0.4 ^0.875 0 0.2 0 0 1
execute at @e[tag=ArenaBoss.Part04,distance=..2] rotated ~45 ~ run particle dust_color_transition 0.5 0 0 1 0 0 0 ^ ^0.4 ^-0.875 0 0.2 0 0 1

# マグマ
particle falling_lava ~ ~ ~ 0.25 1 0.25 0 1
execute if predicate arena:trisect run particle lava ~ ~1 ~ 0 0 0 0 1
