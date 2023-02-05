# tick
# 場外スロットに入れられたアイテムの返却
data modify storage arena-boss:temp Altar.Item set from entity @e[tag=ArenaBoss.Altar.Menu,distance=..3,limit=1] Items

data remove storage arena-boss:temp Altar.Item[{Slot:0b}]
data remove storage arena-boss:temp Altar.Item[{Slot:10b}]
data remove storage arena-boss:temp Altar.Item[{Slot:11b}]
data remove storage arena-boss:temp Altar.Item[{Slot:12b}]

execute if data storage arena-boss: {Altar:{HasOutput:true}} run data remove storage arena-boss:temp Altar.Item[{Slot:16b}]

data remove storage arena-boss:temp Altar.Item[{Slot:23b}]

execute if data storage arena-boss:temp Altar.Item[0] run data modify storage arena-boss:temp Altar.ReturnMode set value "OutSide"
execute if data storage arena-boss:temp Altar.Item[0] run function arena-boss:enchanting_altar/gui/has_extra_item

# GUI表示取られたときの検知
execute as @e[tag=ArenaBoss.Altar.Menu,distance=..3] unless data entity @s Items[{tag:{CustomModelData:201990001}}] run function arena-boss:enchanting_altar/gui/place_gui

# 閉じたこと検知
execute as @a[tag=Arena.AltarOpener] at @s anchored eyes positioned ^ ^ ^10 if data entity @e[tag=ArenaBoss.Altar.Menu,limit=1] {PortalCooldown:0} unless entity @e[tag=ArenaBoss.Altar.CloseDetector,distance=..0.001] run function arena-boss:enchanting_altar/on_close

# クラフト時
execute as @e[tag=ArenaBoss.Altar.Menu,distance=..3] unless data entity @s Items[{Slot:23b,tag:{KotaItems:{ID:"EnchantmentAltar.ButtonCraft"}}}] run function arena-boss:enchanting_altar/crafting/_

# 見た目
execute if entity @p[distance=..4] run function arena-boss:enchanting_altar/visual/_

# 起動時の演出 (範囲内入ったとき実行)
execute if entity @a[distance=..4] if data storage arena:temp {Altar:{HasClosePlayer:false}} run function arena-boss:enchanting_altar/on_activated

execute unless entity @p[distance=..4] run data modify storage arena:temp Altar.HasClosePlayer set value false
execute if entity @p[distance=..4] run data modify storage arena:temp Altar.HasClosePlayer set value true

