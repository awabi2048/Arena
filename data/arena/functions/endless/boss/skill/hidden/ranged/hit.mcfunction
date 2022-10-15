data modify storage score_damage: Argument set value {Damage:10.0d,DamageType:Projectile}
execute as @e[tag=Arena.Mob,distance=..2] run function score_damage:api/attack
function score_damage:api/attack

particle explosion ~ ~ ~ 0 0 0 1 1
playsound entity.iron_golem.damage master @a ~ ~ ~ 5 1.1
playsound block.grindstone.use master @a ~ ~ ~ 5 0.5

kill @e[tag=Arena.Boss.SkillRanged,sort=nearest,limit=1]
