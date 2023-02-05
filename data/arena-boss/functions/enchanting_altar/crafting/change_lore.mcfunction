## lore更新
#Todo: 看板 => interpret代入で一般化できそうなので余裕ができたらやる

# レベルをローマ数字に変換
data modify storage arena-boss:temp Altar.EnchantmentLevel set from entity @s Items[{Slot:16b}].tag.KotaItems.BossEnchantment.lvl

execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:1s}} run data modify storage arena-boss:temp Altar.EnchantmentLevel set value "I"
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:2s}} run data modify storage arena-boss:temp Altar.EnchantmentLevel set value "II"
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:3s}} run data modify storage arena-boss:temp Altar.EnchantmentLevel set value "III"
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:4s}} run data modify storage arena-boss:temp Altar.EnchantmentLevel set value "IV"
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:5s}} run data modify storage arena-boss:temp Altar.EnchantmentLevel set value "V"
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:6s}} run data modify storage arena-boss:temp Altar.EnchantmentLevel set value "VI"
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:7s}} run data modify storage arena-boss:temp Altar.EnchantmentLevel set value "VII"

# 余計なLoreデータを持っているかを記録
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:"I"}} run data modify entity @s Items[{Slot:16b}].tag.KotaItems.data.HasExtraLore set value false
execute if data storage arena-boss:temp {Altar:{EnchantmentLevel:"I"}} if data storage arena-boss:temp Altar.ResourceItem[0].tag.display.Lore[0] run data modify entity @s Items[{Slot:16b}].tag.KotaItems.data.HasExtraLore set value true

# Item Modifierで変換
data modify storage arena-boss:temp Altar.EnchantmentId set from storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.id

execute if data storage arena-boss:temp {Altar:{EnchantmentId:"Fire"}} run item modify entity @s container.16 arena-boss:altar/set_lore/fire
execute if data storage arena-boss:temp {Altar:{EnchantmentId:"Water"}} run item modify entity @s container.16 arena-boss:altar/set_lore/water
execute if data storage arena-boss:temp {Altar:{EnchantmentId:"Thunder"}} run item modify entity @s container.16 arena-boss:altar/set_lore/thunder
execute if data storage arena-boss:temp {Altar:{EnchantmentId:"Earth"}} run item modify entity @s container.16 arena-boss:altar/set_lore/earth


execute unless data storage arena-boss:temp {Altar:{EnchantmentLevel:"I"}} run data remove entity @s Items[{Slot:16b}].tag.display.Lore[0]

# 別のLoreデータがある場合は入れ替え
data modify storage arena-boss:temp Altar.HasExtraLore set from entity @s Items[{Slot:16b}].tag.KotaItems.data.HasExtraLore

execute if data storage arena-boss:temp {Altar:{HasExtraLore:true}} run data modify entity @s Items[{Slot:16b}].tag.display.Lore prepend from entity @s Items[{Slot:16b}].tag.display.Lore[-1]
execute if data storage arena-boss:temp {Altar:{HasExtraLore:true}} run data remove entity @s Items[{Slot:16b}].tag.display.Lore[-1]
