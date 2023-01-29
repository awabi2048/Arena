# 弾が当たった
# 演出
particle explosion ~ ~ ~ 0 0 0 0 1

playsound block.fire.extinguish master @a ~ ~ ~ 2 1.5
playsound block.metal.break master @a ~ ~ ~ 2 1.25

# 周囲のプレイヤーにダメージ
data modify storage score_damage: Argument set value {Damage:5.0d,DamageType:Blast,DisableParticle:true}
execute as @e[tag=Arena.Player,distance=..4] run function score_damage:api/attack

# kill
kill @e[tag=ArenaBoss.Skill01,sort=nearest,limit=1]
