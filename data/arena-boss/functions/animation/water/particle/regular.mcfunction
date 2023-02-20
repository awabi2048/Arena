# パーティクル
# もやもや
particle underwater ~ ~0.5 ~ 3 3 3 0 50

# 回転
execute at @e[tag=ArenaBoss.Extra01] run particle fishing ^ ^0.3 ^1.5 0 0 0 0 3
execute at @e[tag=ArenaBoss.Extra01] run particle fishing ^ ^0.3 ^-1.5 0 0 0 0 3

execute at @e[tag=ArenaBoss.Extra01] rotated ~90 ~ run particle dust_color_transition 0 0 1 0.5 0.25 0.75 0.75 ^ ^0.3 ^1.5 0 0 0 0 3
execute at @e[tag=ArenaBoss.Extra01] rotated ~90 ~ run particle dust_color_transition 0 0 1 0.5 0.25 0.75 0.75 ^ ^0.3 ^-1.5 0 0 0 0 3
