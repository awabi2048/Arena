# クラフトボタンクリック時
# クリック音
playsound ui.button.click master @p[tag=Arena.AltarOpener] ~ ~ ~ 1 1

# GUIをリセット
clear @a sculk_shrieker{display:{Name:'{"text":"合成","color": "light_purple","bold": true,"italic": false}'}}
item replace entity @s container.23 with sculk_shrieker{display:{Name:'{"text":"合成","color": "light_purple","bold": true,"italic": false}'}}

# リソースアイテムを保存
data modify storage arena-boss:temp Altar.Items set from entity @s Items

data modify storage arena-boss:temp Altar.Craftable set value [false, false, false]
data modify storage arena-boss:temp Altar.ResourceItem set value []

data modify storage arena-boss:temp Altar.ResourceItem append from storage arena-boss:temp Altar.Items[{Slot:10b}]
data modify storage arena-boss:temp Altar.ResourceItem append from storage arena-boss:temp Altar.Items[{Slot:11b}]
data modify storage arena-boss:temp Altar.ResourceItem append from storage arena-boss:temp Altar.Items[{Slot:12b}]

# そもそもクラフトできるか確認
    # ResourceItem <1>
    data modify storage arena-boss:temp Altar.ResourceItem1 set from storage arena-boss:temp Altar.ResourceItem[0].id

    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:wooden_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:stone_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:iron_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:gold_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:diamond_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:netherite_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true

    # ResourceItem <2>
    data modify storage arena-boss:temp Altar.ResourceItem2 set from storage arena-boss:temp Altar.ResourceItem[1].tag.KotaItems.ID

    execute if data storage arena-boss:temp {Altar:{ResourceItem2:"EnchantmentShard-Fire"}} run data modify storage arena-boss:temp Altar.Craftable[1] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem2:"EnchantmentShard-Water"}} run data modify storage arena-boss:temp Altar.Craftable[1] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem2:"EnchantmentShard-Thunder"}} run data modify storage arena-boss:temp Altar.Craftable[1] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem2:"EnchantmentShard-Earth"}} run data modify storage arena-boss:temp Altar.Craftable[1] set value true

    # ResourceItem <3>
    data modify storage arena-boss:temp Altar.ResourceItem3 set from storage arena-boss:temp Altar.ResourceItem[1].tag.KotaServer.Itemid

    execute if data storage arena-boss:temp {Altar:{ResourceItem3:"glitter_shard"}} run data modify storage arena-boss:temp Altar.Craftable[2] set value true

    # 全部あってるか確認
    execute unless data storage arena-boss:temp {Altar:{Craftable:[true, true, true]}} run tellraw @a[tag=Arena.AltarOpener] [{"text": " ["},{"text": "Arena","color": "red"},{"text": "] "},{"text": "エラー: クラフトレシピが不正です。","color": "red"}]
    execute unless data storage arena-boss:temp {Altar:{Craftable:[true, true, true]}} run playsound entity.enderman.teleport master @a[tag=Arena.AltarOpener] ~ ~ ~ 1 0.5

    execute unless data storage arena-boss:temp {Altar:{Craftable:[true, true, true]}} run function arena:stop_process

# レシピ判別
