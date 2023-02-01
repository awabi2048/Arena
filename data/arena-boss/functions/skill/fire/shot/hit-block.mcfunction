# 弾が当たった
# 演出
particle explosion ~ ~ ~ 0 0 0 0 1

playsound block.fire.extinguish master @a ~ ~ ~ 2 1.5
playsound block.metal.break master @a ~ ~ ~ 2 1.25

# 周囲のプレイヤーにダメージ
data modify storage score_damage: Argument set value {Damage:15.0d,DamageType:Blast,DisableParticle:true}
execute as @e[tag=Arena.Player,distance=..4] run function score_damage:api/attack

execute as @a[tag=Arena.Player,distance=..4] run function #arena-boss:damage/remove_durability

# kill
kill @s
