effect give @a[tag=Arena.Player,distance=..20] slowness 5 20 true
effect give @a[tag=Arena.Player,distance=..20] jump_boost 5 238 true

data modify storage score_damage: Argument set value {Damage:15.00d}
execute as @a[tag=Arena.Boss] run function score_damage:api/attack

data modify storage arena:boss Skill.01.Killed append value 3
