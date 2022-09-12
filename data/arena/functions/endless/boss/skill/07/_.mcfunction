# 一番近いプレイヤーに向けてエヴォーカーの牙を出す
execute as @e[tag=Arena.Boss] at @s run tp @s ~ ~ ~ facing entity @p[tag=Arena.Player]

execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] rotated ~ 0 run summon marker ^ ^ ^1 {Tags:["Arena.Boss.Fang","Arena.Boss.Marker"]}
execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] rotated ~15 0 run summon marker ^ ^ ^1 {Tags:["Arena.Boss.Fang","Arena.Boss.Marker"]}
execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] rotated ~-15 0 run summon marker ^ ^ ^1 {Tags:["Arena.Boss.Fang","Arena.Boss.Marker"]}

execute if score $Boss.SkillTimer Arena matches 0 as @e[tag=Arena.Boss.Fang] at @s run tp @s ~ ~ ~ facing entity @e[tag=Arena.Boss,limit=1]


execute at @e[tag=Arena.Boss.Fang] run summon evoker_fangs ~ ~ ~

execute at @e[tag=Arena.Boss.Fang] run particle dust_color_transition 0.5 0 1 1 0 0 0 ~ ~1 ~ 0 1 0 1 40

execute at @e[tag=Arena.Boss.Fang] run effect give @a[distance=..1.5] weakness 2 1 true
execute at @e[tag=Arena.Boss.Fang] run effect give @a[distance=..1.5] poison 3 1 true
execute at @e[tag=Arena.Boss.Fang] run effect give @a[distance=..1.5] instant_damage 1 1 true

execute as @e[tag=Arena.Boss.Fang] at @s unless block ~ ~ ~ air run kill @s
execute as @e[tag=Arena.Boss.Fang] at @s run tp @s ^ ^ ^-0.5

