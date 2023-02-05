# ボスエンチャント・雷 使用時
# トリガー解除
advancement revoke @s only arena-boss:enchantment_used/thunder

# 雷落とす
execute as @e[type=#arena:enemy,distance=..5] run function arena:rng_entity
execute store result score $ActivationChance ArenaBoss.Temp run data get entity @p SelectedItem.tag.KotaItems.BossEnchantment.lvl 2.857

execute as @e[type=#arena:enemy,distance=..5] at @s if score @s Arena.Temp <= $ActivationChance ArenaBoss.Temp run summon lightning_bolt ~ ~ ~

