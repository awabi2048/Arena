# パーティクル
# もやもや
particle warped_spore ~ ~0.5 ~ 3 3 3 0 50

# 回転
execute at @e[tag=ArenaBoss.Extra01] run particle fishing ^ ^0.3 ^1.5 0 0 0 0 3
execute at @e[tag=ArenaBoss.Extra01] run particle fishing ^ ^0.3 ^-1.5 0 0 0 0 3

execute at @e[tag=ArenaBoss.Extra01] rotated ~90 ~ run particle dust_color_transition 0 0 0 1 0.2 0.1 0.3 ^ ^0.3 ^1.5 0 0 0 0 3
execute at @e[tag=ArenaBoss.Extra01] rotated ~90 ~ run particle dust_color_transition 0 0 0 1 0.2 0.1 0.3 ^ ^0.3 ^-1.5 0 0 0 0 3
