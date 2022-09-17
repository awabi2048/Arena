# 一定時間ごとにアサヒハイツ
execute store result score $Temp.BossHealth Arena run bossbar get arena:boss value

scoreboard players add $Temp.BossHealth Arena 10

execute if score $Temp.BossHealth Arena matches 1000.. run scoreboard players set $Temp.BossHealth Arena 1000
execute store result entity @e[tag=Arena.LastBoss,limit=1] Health float 1 run scoreboard players get $Temp.BossHealth Arena

scoreboard players set $Boss.HealCooldown Arena 50

playsound entity.player.levelup master @a ~ ~ ~ 5 2
playsound entity.tnt.primed master @a ~ ~ ~ 5 2

execute at @e[tag=Arena.Boss] run particle block lime_stained_glass ~ ~ ~ 0 0 0 1 100

execute store result score $Boss.Temp.LastHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health