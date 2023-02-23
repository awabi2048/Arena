# 球体で爆発

# 演出
particle dripping_lava ~ ~ ~ 5 5 5 0 500
particle flame ~ ~ ~ 0 0 0 0.33 300

playsound block.fire.extinguish master @a ~ ~ ~ 5 0.5

# プレイヤーにダメージ
data modify storage score_damage: Argument set value {Damage:100.0d,DamageType:Blast,BypassResistance:true}
execute as @a[tag=Arena.Player,distance=..8] run function score_damage:api/attack

execute as @a[tag=Arena.Player,distance=..8] run function #arena-boss:damage/remove_durability

# kill
kill @e[tag=ArenaBoss.SkillMarker]
