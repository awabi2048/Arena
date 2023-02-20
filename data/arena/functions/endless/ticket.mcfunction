# チケット配布
# 下に計算式を記入
#Memo: 現在は T=0.2W + 5 (T:チケット枚数, W:ウェーブ)
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -20

scoreboard players operation $TicketCount Arena.Temp = $Wave Arena.Temp
scoreboard players operation $TicketCount Arena.Temp /= #100 Constant

scoreboard players add $TicketCount Arena.Temp 5

loot give @a[tag=Arena.Player,distance=..32] loot arena:ticket/hard
