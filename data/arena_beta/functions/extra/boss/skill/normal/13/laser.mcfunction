particle dripping_lava ~ ~ ~ 0 0 0 0 2
particle dust 1 0 0 1 ~ ~ ~ 0 0 0 0 2

execute as @p[distance=..1.5,tag=Arena.Player] run effect give @s instant_damage 1 2

execute positioned ^ ^ ^0.5 if block ~ ~ ~ air run function arena_beta:extra/boss/skill/normal/13/laser 
