# 強化処理
# レベル数を取得、加算
execute store result score $EnchantmentLevel ArenaBoss.Temp run data get storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.lvl
scoreboard players add $EnchantmentLevel ArenaBoss.Temp 1

execute store result storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.lvl short 1 run scoreboard players get $EnchantmentLevel ArenaBoss.Temp

# 演出
playsound block.smithing_table.use master @a ~ ~ ~ 1 0.98
playsound block.anvil.use master @a ~ ~ ~ 1 1.82

