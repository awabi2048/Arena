# 見た目
execute as @e[tag=ArenaBoss.Altar.Part03,distance=..3] store result entity @s Rotation[1] float 1 run scoreboard players add $XRot[1] ArenaBoss 1
execute as @e[tag=ArenaBoss.Altar.Part04,distance=..3] store result entity @s Rotation[1] float 1 run scoreboard players add $YRot[1] ArenaBoss 2
execute as @e[tag=ArenaBoss.Altar.Part05,distance=..3] store result entity @s Rotation[1] float -1 run scoreboard players add $ZRot[1] ArenaBoss 3

execute if score $XRot[1] ArenaBoss matches 3600.. run scoreboard players set $XRot[1] ArenaBoss 0
execute if score $YRot[1] ArenaBoss matches 3600.. run scoreboard players set $YRot[1] ArenaBoss 0
execute if score $ZRot[1] ArenaBoss matches 3600.. run scoreboard players set $ZRot[1] ArenaBoss 0

execute as @e[tag=ArenaBoss.Altar.Part03,distance=..3] at @s run tp @s ~ ~ ~ ~3 ~
execute as @e[tag=ArenaBoss.Altar.Part04,distance=..3] at @s run tp @s ~ ~ ~ ~-4.6 ~
execute as @e[tag=ArenaBoss.Altar.Part05,distance=..3] at @s run tp @s ~ ~ ~ ~3 ~

execute at @e[tag=ArenaBoss.Altar.Element-Ring,distance=..3] positioned ~ ~2.6 ~ run function arena-boss:enchanting_altar/visual/ring_particle01
execute at @e[tag=ArenaBoss.Altar.Element-Ring,distance=..3] positioned ~ ~2.6 ~ rotated ~180 ~180 run function arena-boss:enchanting_altar/visual/ring_particle02

execute as @e[tag=ArenaBoss.Altar.Part02] at @s run tp @s ~ ~ ~ ~0.5 ~
