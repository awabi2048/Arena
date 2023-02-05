# ボスエンチャント・地 使用時
# トリガー解除
advancement revoke @s only arena-boss:enchantment_used/earth

# 乱数生成
execute as @e[type=#arena:enemy,distance=..4] run function arena:rng_entity

# 確率計算
execute store result score $ActivationChance ArenaBoss.Temp run data get entity @p SelectedItem.tag.KotaItems.BossEnchantment.lvl 3.571

# 上にふっとばし
execute as @e[type=#arena:enemy,distance=..4] if score @s Arena.Temp <= $ActivationChance ArenaBoss.Temp at @s run particle block dirt ~ ~ ~ 0 0 0 1 100 
execute as @e[type=#arena:enemy,distance=..4] if score @s Arena.Temp <= $ActivationChance ArenaBoss.Temp store result entity @s Motion[1] double 1 run data get entity @p SelectedItem.tag.KotaItems.BossEnchantment.lvl 0.2

data modify storage score_damage: Argument set value {Damage:4.0f,DamageType:Fall}
execute as @e[type=#arena:enemy,distance=..4] if score @s Arena.Temp <= $ActivationChance ArenaBoss.Temp run function score_damage:api/attack

