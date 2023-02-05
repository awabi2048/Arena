## アイテムをまとめて返却
data modify storage arena-boss:temp Altar.Items set from entity @e[tag=ArenaBoss.Altar.Menu,distance=..3,limit=1] Items

data remove storage arena-boss:temp Altar.Items[{Slot:0b}]
data remove storage arena-boss:temp Altar.Items[{Slot:23b}]

# シュルカーボックスにloot tableで
execute in minecraft:overworld run setblock 0 -64 0 shulker_box

execute in minecraft:overworld run data modify block 0 -64 0 Items set from storage arena-boss:temp Altar.Items

execute as @p[tag=Arena.AltarOpener] in minecraft:overworld run loot spawn 0 -63 0 mine 0 -64 0 debug_stick
execute in minecraft:overworld positioned 0 -63 0 as @e[type=item,distance=..0.1] run tag @s add Arena.ReturnedItem
execute in minecraft:overworld positioned 0 -63 0 as @e[type=item,distance=..0.1] run data modify entity @s PickupDelay set value 0
execute in minecraft:overworld positioned 0 -63 0 run tp @e[tag=Arena.ReturnedItem] @a[tag=Arena.AltarOpener,limit=1]

tag @e[tag=Arena.ReturnedItem] remove Arena.ReturnedItem

execute in minecraft:overworld run setblock 0 -64 0 bedrock

# 指定スロット以外のアイテムを除去
data modify storage arena-boss:temp Altar.ItemsAll set from entity @e[tag=ArenaBoss.Altar.Menu,distance=..3,limit=1] Items
data modify storage arena-boss:temp Altar.Items set value []

data modify storage arena-boss:temp Altar.Items append from storage arena-boss:temp Altar.ItemsAll[{Slot:0b}]

data modify storage arena-boss:temp Altar.Items append from storage arena-boss:temp Altar.ItemsAll[{Slot:10b}]
data modify storage arena-boss:temp Altar.Items append from storage arena-boss:temp Altar.ItemsAll[{Slot:11b}]
data modify storage arena-boss:temp Altar.Items append from storage arena-boss:temp Altar.ItemsAll[{Slot:12b}]

execute if data storage arena-boss: {Altar:{HasOutput:true}} run data remove storage arena-boss:temp Altar.Items[{Slot:16b}]

data modify storage arena-boss:temp Altar.Items append from storage arena-boss:temp Altar.ItemsAll[{Slot:23b}]

data modify entity @e[tag=ArenaBoss.Altar.Menu,distance=..3,limit=1] Items set from storage arena-boss:temp Altar.Items

# 成果物が自動回収されないよう
data modify storage arena-boss: Altar.HasOutput set value false
