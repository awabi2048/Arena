# 視線検知、通っているかな
execute as @a[tag=Arena.Player,distance=..50] positioned ~-50 ~-50 ~-50 if predicate hitbox:hitbox at @s run data modify storage arena-boss:temp RaycastSucceeded set value true
execute positioned ^ ^ ^0.5 if block ~ ~ ~ air if entity @e[tag=ArenaBoss.Core,distance=..16] run function arena-boss:skill/water/shot/raycast

