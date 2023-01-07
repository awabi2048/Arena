# 一定時間ごとにアサヒハイツ
execute store result score $Temp.BossHealth Arena run bossbar get arena:boss value

scoreboard players add $Temp.BossHealth Arena 1

execute if score $Temp.BossHealth Arena matches 1000.. run scoreboard players set $Temp.BossHealth Arena 1000
execute store result entity @e[tag=Arena.LastBoss,limit=1] Health float 1 run scoreboard players get $Temp.BossHealth Arena

execute store result score $Boss.Temp.LastHealth Arena run data get entity @e[tag=Arena.LastBoss,limit=1] Health
