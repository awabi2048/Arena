# 1つのみアイテムを返却
summon item ~ ~ ~ {Tags:["Arena.Temp"],PickupDelay:0,Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[tag=Arena.Temp,limit=1] Item set from storage arena-boss:temp Altar.ReturnItem
data remove storage arena-boss:temp Altar.ReturnItem
tag @e[tag=Arena.Temp] remove Arena.Temp
