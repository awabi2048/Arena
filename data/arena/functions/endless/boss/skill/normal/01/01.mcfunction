data modify storage score_damage: Argument set value {Damage:10.00d}
execute as @a[tag=Arena.Player,distance=..32] run function score_damage:api/attack

data modify storage arena:boss Skill.01.Killed append value 1
