# 手下召喚(次のスキル発動まで倒されなかった場合ボス回復)
execute if score $Boss.Timer Arena matches 1 at @e[tag=Arena.SummonPoint,sort=nearest,limit=4] run summon skeleton ~ ~ ~ {HandItems:[{id:"minecraft:diamond_axe",Count:1b},{}],HandDropChances:[0.0f,0.0f],Tags:["Arena.Mob","Arena.Boss.Healer"],DeathLootTable:"empty",AbsorptionAmount:30}

execute if score $Boss.Timer Arena matches 250 store result score $Temp.Boss.HealerCount Arena if entity @e[tag=Arena.Boss.Healer]
execute if score $Boss.Timer Arena matches 250 run scoreboard players operation $Temp.Boss.HealerCount Arena *= #50 Arena

execute if score $Boss.Timer Arena matches 250 store result score $Temp.Boss.Health Arena run data get entity @e[tag=Arena.Boss,limit=1] Health
execute if score $Boss.Timer Arena matches 250 run scoreboard players operation $Temp.Boss.Health Arena += $Temp.Boss.HealerCount Arena
execute if score $Boss.Timer Arena matches 250 store result entity @e[tag=Arena.Boss,limit=1] Health float 1 run scoreboard players get $Temp.Boss.Health Arena

execute if score $Boss.Timer Arena matches 250 if score $Temp.Boss.HealerCount Arena matches 1.. run playsound entity.player.levelup master @a ~ ~ ~ 5 2

execute if score $Boss.Timer Arena matches 250 at @e[tag=Arena.Boss.Healer] run particle ash ~ ~2 ~ 0.25 0 0.25 1 100
execute if score $Boss.Timer Arena matches 250 at @e[tag=Arena.Boss.Healer] run particle effect ~ ~ ~ 0 0 0 1 100

execute if score $Boss.Timer Arena matches 250 run kill @e[tag=Arena.Boss.Healer]

