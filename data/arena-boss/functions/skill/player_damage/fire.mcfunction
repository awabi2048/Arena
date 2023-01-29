# 炎ダメージ付与
setblock ~ ~ ~ lava[level=7]

tag @s add Temp.Lava
schedule function arena-boss:skill/player_damage/fire-clear 2t