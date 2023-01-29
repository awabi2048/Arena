# アリーナ内の敵を一掃する (Shift + RC)
execute as @e[tag=Arena.Core] if score @s Arena = @p[tag=Arena.Debug] Arena at @s run tp @e[tag=Arena.Mob,distance=..32] 0 -300 0

particle soul_fire_flame ~ ~1.3 ~ 0 0 0 0.1 20 force
particle minecraft:small_flame ~ ~1.5 ~ 0 0 0 0.1 10 force

playsound block.note_block.harp master @s ~ ~ ~ 1 0.65
playsound entity.ender_dragon.flap master @s ~ ~ ~ 1 1.2
playsound ui.button.click master @s ~ ~ ~ 1 1.5

execute as @e[type=potion,distance=..2.5] if data entity @s {Item:{tag:{Arena:{Item:DebugTool}}}} run kill @s

