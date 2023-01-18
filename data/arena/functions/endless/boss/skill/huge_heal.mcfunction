# 一定時間ごとにアサヒハイツ
execute store result score $BossHealth Arena.Temp run bossbar get arena:last_boss value

scoreboard players add $BossHealth Arena.Temp 5

execute if score $BossHealth Arena.Temp matches 600.. run scoreboard players set $Temp.BossHealth Arena 600
execute store result entity @e[tag=Arena.Boss,limit=1] Health float 1 run scoreboard players get $BossHealth Arena.Temp

execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run scoreboard players set $Boss.HealCooldown Arena 60
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run scoreboard players set $Boss.HealCooldown Arena 40

playsound entity.player.levelup master @a ~ ~ ~ 5 1.7
playsound entity.tnt.primed master @a ~ ~ ~ 5 2

execute at @e[tag=Arena.Boss] run particle composter ~ ~ ~ 0.5 1 0.5 1 30
execute at @e[tag=Arena.Boss] run particle dust_color_transition 0.25 1 0.25 1 1 1 1 ~ ~ ~ 0.5 1 0.5 1 30

execute store result storage arena:boss LastHealth double 1 run data get entity @e[tag=Arena.LastBoss,limit=1] Health
