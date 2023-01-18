function arena_beta:extra/boss/reset
advancement revoke @a only arena_beta:extra_boss/killed_last_boss

execute as @a[tag=Arena.Player] if score @s Arena matches -1 run loot give @s loot arena_beta:extra_boss/last_boss

playsound entity.generic.explode master @a ~ ~ ~ 5 0.5
playsound entity.wither.death master @a ~ ~ ~ 5 1

particle lava ~ ~ ~ 0.5 0 0.5 1 100
particle explosion ~ ~ ~ 0.5 0.5 0.5 1 100

kill @e[tag=Arena.MiniBoss]
kill @e[tag=Arena.Boss.Phantom]
