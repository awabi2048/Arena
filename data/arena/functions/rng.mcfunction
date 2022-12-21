# 乱数生成
scoreboard players set $Random Arena 0

execute if predicate arena:half run scoreboard players add $Random Arena 1
execute if predicate arena:half run scoreboard players add $Random Arena 2
execute if predicate arena:half run scoreboard players add $Random Arena 4
execute if predicate arena:half run scoreboard players add $Random Arena 8
execute if predicate arena:half run scoreboard players add $Random Arena 16
execute if predicate arena:half run scoreboard players add $Random Arena 32
execute if predicate arena:half run scoreboard players add $Random Arena 64

scoreboard players operation $Random Arena *= #99 Arena
scoreboard players operation $Random Arena /= #127 Arena
