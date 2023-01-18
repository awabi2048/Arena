# 雑魚敵召喚 (次のスキル発動まで倒されなかった場合ボス回復)
execute if score $Boss.Timer Arena matches 1 at @e[tag=Arena.SummonPoint,sort=nearest,limit=4] run summon skeleton ~ ~ ~ {HandItems:[{id:"minecraft:diamond_axe",Count:1b},{}],HandDropChances:[0.0f,0.0f],Tags:["Arena.Mob","Arena.Boss.Healer"],DeathLootTable:"empty",AbsorptionAmount:30}

execute if score $Boss.Timer Arena matches 250 store result score $HealerCount Arena.Temp if entity @e[tag=Arena.Boss.Healer]
execute if score $Boss.Timer Arena matches 250 run scoreboard players operation $HealerCount Arena.Temp *= #50 Arena

execute if score $Boss.Timer Arena matches 250 store result score $Boss.Health Arena.Temp run data get entity @e[tag=Arena.Boss,limit=1] Health
execute if score $Boss.Timer Arena matches 250 run scoreboard players operation $Boss.Health Arena.Temp += $HealerCount Arena.Temp
execute if score $Boss.Timer Arena matches 250 store result entity @e[tag=Arena.Boss,limit=1] Health float 1 run scoreboard players get $Boss.Health Arena.Temp

execute if score $Boss.Timer Arena matches 250 if score $HealerCount Arena.Temp matches 1.. run playsound entity.player.levelup master @a ~ ~ ~ 5 2

execute if score $Boss.Timer Arena matches 250 at @e[tag=Arena.Boss.Healer] run particle ash ~ ~2 ~ 0.25 0 0.25 1 100
execute if score $Boss.Timer Arena matches 250 at @e[tag=Arena.Boss.Healer] run particle effect ~ ~ ~ 0 0 0 1 100

execute if score $Boss.Timer Arena matches 250 run kill @e[tag=Arena.Boss.Healer]

