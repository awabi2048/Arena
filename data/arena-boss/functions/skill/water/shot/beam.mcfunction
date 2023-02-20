# 攻撃時のビーム
particle enchanted_hit ~ ~ ~ 0 0 0 0.01 2
particle dust 0 0 1 0.5 ~ ~ ~ 0 0 0 0 1

execute positioned ^ ^ ^0.25 if block ~ ~ ~ air if entity @e[tag=ArenaBoss.Core,distance=..20] run function arena-boss:skill/water/shot/beam
