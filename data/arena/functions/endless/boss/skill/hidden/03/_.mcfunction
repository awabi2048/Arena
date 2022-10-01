# ボス透明化
effect give @e[tag=Arena.LastBoss] invisibility 10 0 true
spreadplayers ~ ~ 10 10 false @e[tag=Arena.LastBoss]

# 演出
particle warped_spore ~ ~ ~ 1 0 1 1 300
particle flash ~ ~ ~ 1 0 1 1 10

playsound block.enchantment_table.use master @a ~ ~ ~ 5 2
playsound block.enchantment_table.use master @a ~ ~ ~ 5 1.5

data modify storage arena: Boss.Skills set value []
