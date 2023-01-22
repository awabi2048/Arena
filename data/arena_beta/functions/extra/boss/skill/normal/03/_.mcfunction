# ボス透明化
effect give @s invisibility 7 0 true
particle warped_spore ~ ~2 ~ 1 0 1 1 300
playsound block.enchantment_table.use master @a ~ ~ ~ 5 2
playsound block.enchantment_table.use master @a ~ ~ ~ 5 0.5

data modify storage arena:boss Skills set value []
