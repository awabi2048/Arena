# 既定値までウェーブをスキップする (RC)
function arena:debug/skip_wave

playsound block.beacon.power_select master @s ~ ~ ~ 1 0.85
playsound ui.button.click master @s ~ ~ ~ 1 1.5

execute as @e[type=potion,distance=..2.5] if data entity @s {Item:{tag:{Arena:{Item:DebugTool}}}} run kill @s
