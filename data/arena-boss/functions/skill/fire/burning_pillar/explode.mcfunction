# 柱爆破
# kill
kill @s
kill @e[tag=ArenaBoss.Skill03]

# 演出
particle dripping_lava ~ ~ ~ 0.25 3 0.25 1 200
particle lava ~ ~ ~ 0 0.25 0 1 64

playsound entity.generic.explode master @a ~ ~ ~ 5 1
playsound entity.generic.explode master @a ~ ~ ~ 5 1.2

playsound block.fire.extinguish master @a ~ ~ ~ 5 1.5
playsound block.fire.extinguish master @a ~ ~ ~ 5 0.7

# 付近のプレイヤーにダメージ
data modify storage score_damage: Arugment set value {Damage:200.0d,DamageType:Blast}
execute as @a[tag=Arena.Player,distance=..4] run function score_damage:api/attack

execute as @a[tag=Arena.Player,distance=..4] run function #arena-boss:damage/remove_durability
