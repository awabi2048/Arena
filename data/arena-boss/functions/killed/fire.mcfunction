# 撃破時
# 演出
playsound entity.blaze.death master @a ~ ~ ~ 2 0.75
playsound entity.blaze.death master @a ~ ~ ~ 2 1.5

playsound entity.generic.explode master @a ~ ~ ~ 2 0.75

particle explosion_emitter ~ ~ ~ 0 0 0 0 1

# 色々kill
tp @e[tag=ArenaBoss.Element] ~ ~-300 ~
kill @e[tag=ArenaBoss.Element]

# loot
