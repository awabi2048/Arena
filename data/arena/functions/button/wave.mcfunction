# モブ召喚 (Wave 1-5)
function arena:summon/_

title @a[tag=Arena.Player,distance=..20] times 10 40 10
title @a[tag=Arena.Player,distance=..20] title " "

execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute if score $Wave Arena.Temp matches 1..4 run title @a[tag=Arena.Player,distance=..20] subtitle [{"text":"Wave ","color": "gold"},{"score":{"name": "$Wave","objective": "Arena.Temp"},"color": "gold"}]
execute if score $Wave Arena.Temp matches 5 run title @a[tag=Arena.Player,distance=..20] subtitle [{"text":"Last Wave","color": "gold"}]

playsound entity.experience_orb.pickup master @a[tag=Arena.Player,distance=..20] ~ ~ ~ 1 1.2
