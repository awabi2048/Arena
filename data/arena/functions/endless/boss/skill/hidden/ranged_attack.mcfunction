# 遠距離攻撃
scoreboard players operation $Temp.TimerMod Arena = $Boss.SkillTimer Arena
scoreboard players operation $Temp.TimerMod Arena %= #20 Arena
execute if score $Temp.TimerMod Arena matches 0 as @e[tag=Arena.Boss] at @s anchored eyes run summon marker ^ ^-0.25 ^ {Tags:["Arena.Boss.SkillRanged"]}
execute if score $Temp.TimerMod Arena matches 0 as @e[tag=Arena.Boss] at @s run data modify entity @e[tag=Arena.Boss.SkillRanged,sort=nearest,limit=1] Rotation set from entity @s Rotation

execute as @e[tag=Arena.Boss.SkillRanged] at @s run tp @s ^ ^ ^0.5
execute at @e[tag=Arena.Boss.SkillRanged] run particle crit ~ ~ ~ 0 0 0 0 1

execute as @e[tag=Arena.Boss.SkillRanged] at @s unless block ~ ~ ~ air run kill @s
