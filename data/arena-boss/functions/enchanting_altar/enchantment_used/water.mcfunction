# ボスエンチャント・雷 使用時
# トリガー解除
advancement revoke @s only arena-boss:enchantment_used/water

# 乱数生成
execute as @e[type=#arena:enemy,distance=..3] run function arena:rng_entity

# 鈍化
execute store result score $ActivationChance ArenaBoss.Temp run data get entity @p SelectedItem.tag.KotaItems.BossEnchantment.lvl 7.143

execute as @e[type=#arena:enemy,distance=..3] if score @s Arena.Temp <= $ActivationChance ArenaBoss.Temp run effect give @s slowness 2 1

# パーティクル
execute as @e[type=#arena:enemy,distance=..3] if score @s Arena.Temp <= $ActivationChance ArenaBoss.Temp run particle splash ~ ~0.5 ~ 1.5 0.25 1.5 2 200
