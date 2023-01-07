data modify storage score_damage: Argument set value {Damage:30.00d}
execute as @a[tag=Arena.Player,distance=..32] run function score_damage:api/attack

data modify storage arena: Boss.Skill.01.Killed append value 1
