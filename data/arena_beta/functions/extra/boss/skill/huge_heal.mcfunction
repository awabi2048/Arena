# 一定時間ごとにアサヒハイツ
execute store result score $Boss.Health Arena.Temp run bossbar get arena_beta:extra_boss value

scoreboard players add $Boss.Health Arena.Temp 10

execute if score $Boss.Health Arena.Temp matches 1000.. run scoreboard players set $Boss.Health Arena.Temp 1000
execute store result entity @e[tag=Arena.LastBoss,limit=1] Health float 1 run scoreboard players get $Boss.Health Arena.Temp

scoreboard players set $Boss.HealCooldown Arena 100

playsound entity.player.levelup master @a ~ ~ ~ 5 2
playsound entity.tnt.primed master @a ~ ~ ~ 5 2

execute at @e[tag=Arena.Boss] run particle composter ~ ~ ~ 0.5 1 0.5 1 30

execute store result score $Boss.Temp.LastHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health
