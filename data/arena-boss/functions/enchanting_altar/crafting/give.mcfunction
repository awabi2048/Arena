# エンチャント新規付与処理
# データ付与 シャードのデータからコピー
data modify storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.id set from storage arena-boss:temp Altar.ResourceItem[1].tag.KotaItems.data.AvailableEnchantment
data modify storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.lvl set value 1s

# エンチャント柄なかったらつける
execute store success storage arena-boss:temp Altar.HasEnchantment byte 1 run data get storage arena-boss:temp Altar.ResourceItem[0].tag.Enchantments
execute if data storage arena-boss:temp {Altar:{HasEnchantment:false}} run data modify storage arena-boss:temp Altar.ResourceItem[0].tag.Enchantments set value [{}]


# 演出
playsound block.enchantment_table.use master @a ~ ~ ~ 2 0.75
playsound block.fire.extinguish master @a ~ ~ ~ 1 0.5
playsound entity.ender_dragon.growl master @a ~ ~ ~ 0.5 1

particle enchant ~ ~ ~ 3 3 3 0 300


