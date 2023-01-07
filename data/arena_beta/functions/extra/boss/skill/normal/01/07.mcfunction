effect give @a[tag=Arena.Player,distance=..20] hunger 10 4 true
effect give @a[tag=Arena.Player,distance=..20] poison 5 1 true

data modify storage score_damage: Argument set value {Damage:15.00d}
execute as @a[tag=Arena.Boss] run function score_damage:api/attack

data modify storage arena: Boss.Skill.01.Killed append value 7
