execute as @e[tag=Arena.LastBoss.Body] run data remove entity @s Pose

execute as @e[tag=Arena.LastBoss.Body] run data modify entity @s Rotation set from entity @e[tag=Arena.LastBoss.Core,limit=1] Rotation

data modify entity @e[tag=Arena.LastBoss.Upper,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11101
data modify entity @e[tag=Arena.LastBoss.Lower,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11201
data modify entity @e[tag=Arena.LastBoss.Sword,limit=1] ArmorItems[{id:"minecraft:stick"}].tag.CustomModelData set value 11001