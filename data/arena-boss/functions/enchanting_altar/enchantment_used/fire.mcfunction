# ボスエンチャント・炎 使用時
# トリガー解除
advancement revoke @s only arena-boss:enchantment_used/fire

# 炎上 
execute as @e[type=#arena:enemy,distance=..3] store result entity @s Fire int 10 run data get entity @p SelectedItem.tag.KotaItems.BossEnchantment.lvl

execute as @e[type=#arena:enemy,distance=..3] at @s run particle small_flame ~ ~ ~ 0.25 1 0.25 0.03 50
