# チケット配布
# 下に計算式を記入
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1

scoreboard players operation $TicketCount Arena = $Wave Arena.Temp
scoreboard players operation $TicketCount Arena /= #10 Arena

scoreboard players add $TicketCount Arena 1

loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/hard
