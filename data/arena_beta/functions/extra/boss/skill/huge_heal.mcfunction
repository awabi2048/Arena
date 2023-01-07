# 一定時間ごとにアサヒハイツ
execute store result score $Temp.BossHealth Arena run bossbar get arena:boss value

scoreboard players add $Temp.BossHealth Arena 10

execute if score $Temp.BossHealth Arena matches 1000.. run scoreboard players set $Temp.BossHealth Arena 1000
execute store result entity @e[tag=Arena.LastBoss,limit=1] Health float 1 run scoreboard players get $Temp.BossHealth Arena

execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} run scoreboard players set $Boss.HealCooldown Arena 60
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} run scoreboard players set $Boss.HealCooldown Arena 40

playsound entity.player.levelup master @a ~ ~ ~ 5 2
playsound entity.tnt.primed master @a ~ ~ ~ 5 2

execute at @e[tag=Arena.Boss] run particle composter ~ ~ ~ 0.5 1 0.5 1 30

execute store result score $Boss.Temp.LastHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health
