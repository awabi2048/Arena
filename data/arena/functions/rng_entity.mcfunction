# 乱数生成 (entity別)
scoreboard players set @s Arena.Temp 0

execute if predicate arena:half run scoreboard players add @s Arena.Temp 1
execute if predicate arena:half run scoreboard players add @s Arena.Temp 2
execute if predicate arena:half run scoreboard players add @s Arena.Temp 4
execute if predicate arena:half run scoreboard players add @s Arena.Temp 8
execute if predicate arena:half run scoreboard players add @s Arena.Temp 16
execute if predicate arena:half run scoreboard players add @s Arena.Temp 32
execute if predicate arena:half run scoreboard players add @s Arena.Temp 64

scoreboard players operation @s Arena.Temp %= #100 Constant
