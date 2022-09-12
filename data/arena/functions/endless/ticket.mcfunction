# チケット配布
# 下に計算式を記入
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1

scoreboard players operation $TicketCount Arena = $Temp.Wave Arena
scoreboard players operation $TicketCount Arena /= #10 Arena

scoreboard players add $TicketCount Arena 1

loot give @a[tag=Arena.Player,distance=..32] loot arena:endless/ticket
