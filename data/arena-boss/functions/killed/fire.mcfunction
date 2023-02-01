# 撃破時
# 演出
playsound entity.blaze.death master @a ~ ~ ~ 2 0.75
playsound entity.blaze.death master @a ~ ~ ~ 2 1.5

playsound entity.generic.explode master @a ~ ~ ~ 2 0.75

particle explosion_emitter ~ ~ ~ 0 0 0 0 2

particle sculk_soul ~ ~ ~ 0.125 0.125 0.125 0.1 50

particle flame ~ ~ ~ 0.125 0.125 0.125 0.1 50
particle small_flame ~ ~ ~ 0.125 0.125 0.125 0.05 50

# 色々kill
tp @e[tag=ArenaBoss.Element] ~ ~-300 ~
kill @e[tag=ArenaBoss.Element]

tp @e[tag=ArenaBoss.SkillMarker] ~ ~-300 ~
kill @e[tag=ArenaBoss.SkillMarker]

# loot
