effect give @a[tag=Arena.Player,distance=..32] slowness 5 20 true
effect give @a[tag=Arena.Player,distance=..32] jump_boost 5 238 true

data modify storage score_damage: Argument set value {Damage:30.00d}
execute as @a[tag=Arena.Boss] run function score_damage:api/attack

data modify storage arena: Boss.Skill.01.Killed append value 3
