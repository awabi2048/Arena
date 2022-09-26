summon marker ^ ^ ^0.25 {Tags:["Arena.Boss.Motion"]}

execute store result score $Boss.Temp.X1 Arena run data get entity @e[tag=Arena.Boss,limit=1] Pos[0] 100
execute store result score $Boss.Temp.Y1 Arena run data get entity @e[tag=Arena.Boss,limit=1] Pos[1] 100
execute store result score $Boss.Temp.Z1 Arena run data get entity @e[tag=Arena.Boss,limit=1] Pos[2] 100

execute store result score $Boss.Temp.X2 Arena run data get entity @e[tag=Arena.Boss.Motion,limit=1] Pos[0] 100
execute store result score $Boss.Temp.Y2 Arena run data get entity @e[tag=Arena.Boss.Motion,limit=1] Pos[1] 100
execute store result score $Boss.Temp.Z2 Arena run data get entity @e[tag=Arena.Boss.Motion,limit=1] Pos[2] 100

scoreboard players operation $Boss.Temp.X2 Arena -= $Boss.Temp.X1 Arena
scoreboard players operation $Boss.Temp.Y2 Arena -= $Boss.Temp.Y1 Arena
scoreboard players operation $Boss.Temp.Z2 Arena -= $Boss.Temp.Z1 Arena

execute store result entity @e[tag=Arena.Boss.Fireball,limit=1] power[0] double 0.01 run scoreboard players get $Boss.Temp.X2 Arena 
execute store result entity @e[tag=Arena.Boss.Fireball,limit=1] power[1] double 0.01 run scoreboard players get $Boss.Temp.Y2 Arena
execute store result entity @e[tag=Arena.Boss.Fireball,limit=1] power[2] double 0.01 run scoreboard players get $Boss.Temp.Z2 Arena

kill @e[tag=Arena.Boss.Motion]
