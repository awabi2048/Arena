# クラフトボタンクリック時
# 演出
playsound ui.button.click master @p[tag=Arena.AltarOpener] ~ ~ ~ 1 1

# スロットにアイテムが入っていたら返却
data modify storage arena-boss:temp Altar.ReturnItem set from entity @s Items[{Slot:23b}]
execute if data storage arena-boss:temp Altar.ReturnItem at @a[tag=Arena.AltarOpener] run function arena-boss:enchanting_altar/gui/return_item_single

# GUIをリセット
clear @a sculk_shrieker{KotaItems:{ID:"EnchantmentAltar.ButtonCraft"}}
item replace entity @s container.23 with sculk_shrieker{display:{Name:'{"text":"合成","color": "light_purple","bold": true,"italic": false}'},KotaItems:{ID:"EnchantmentAltar.ButtonCraft"}}


## リソースアイテムを保存
data modify storage arena-boss:temp Altar.Items set from entity @s Items

data modify storage arena-boss:temp Altar.Craftable set value [false, false, false]
data modify storage arena-boss:temp Altar.ResourceItem set value []

data modify storage arena-boss:temp Altar.ResourceItem append from storage arena-boss:temp Altar.Items[{Slot:10b}]
data modify storage arena-boss:temp Altar.ResourceItem append from storage arena-boss:temp Altar.Items[{Slot:11b}]
data modify storage arena-boss:temp Altar.ResourceItem append from storage arena-boss:temp Altar.Items[{Slot:12b}]

## そもそもクラフトできるか確認
    # ResourceItem <1>
    data modify storage arena-boss:temp Altar.ResourceItem1 set value "none"
    data modify storage arena-boss:temp Altar.ResourceItem1 set from storage arena-boss:temp Altar.ResourceItem[0].id

    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:wooden_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:stone_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:iron_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:gold_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:diamond_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true
    execute if data storage arena-boss:temp {Altar:{ResourceItem1:"minecraft:netherite_sword"}} run data modify storage arena-boss:temp Altar.Craftable[0] set value true

    # ResourceItem <2>
    data modify storage arena-boss:temp Altar.ResourceItem2 set value "none"
    data modify storage arena-boss:temp Altar.ResourceItem2 set from storage arena-boss:temp Altar.ResourceItem[1].tag.KotaItems.ID

    execute if data storage arena-boss:temp {Altar:{ResourceItem2:"EnchantmentShard"}} run data modify storage arena-boss:temp Altar.Craftable[1] set value true

    # ResourceItem <3>
    data modify storage arena-boss:temp Altar.ResourceItem3 set value "none"
    data modify storage arena-boss:temp Altar.ResourceItem3 set from storage arena-boss:temp Altar.ResourceItem[2].tag.KotaItems.ID

    execute if data storage arena-boss:temp {Altar:{ResourceItem3:"GlitterShard"}} run data modify storage arena-boss:temp Altar.Craftable[2] set value true


    # 全部あってるか確認
    data modify storage arena-boss:temp Altar.HasError set value false
    execute store success storage arena-boss:temp Altar.HasError byte 1 run data modify storage arena-boss:temp Altar.Craftable[] set value true

    # エラー出力
    execute if data storage arena-boss:temp {Altar:{HasError:true}} run tellraw @a[tag=Arena.AltarOpener] [{"text": " ["},{"text": "Arena","color": "red"},{"text": "] "},{"text": "エラー: クラフトレシピが不正です。","color": "red"}]
    execute if data storage arena-boss:temp {Altar:{HasError:true}} run playsound entity.enderman.teleport master @a[tag=Arena.AltarOpener] ~ ~ ~ 1 0.5

    execute if data storage arena-boss:temp {Altar:{HasError:true}} run function arena:stop_process


## 武器に対し行う操作を判別
data remove storage arena-boss:temp Altar.Operation
data modify storage arena-boss:temp Altar.Operation set from storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.id

execute if data storage arena-boss:temp Altar.Operation run data modify storage arena-boss:temp Altar.Operation set value "Enhance"
execute unless data storage arena-boss:temp Altar.Operation run data modify storage arena-boss:temp Altar.Operation set value "Give"


## 既にエンチャントが付いている場合、違うエンチャントを付けようとしていないか確認

    # 同じエンチャントか確認
    data modify storage arena-boss:temp Altar.ShardEnchantment set from storage arena-boss:temp Altar.ResourceItem[1].tag.KotaItems.data.AvailableEnchantment
    data modify storage arena-boss:temp Altar.WaeponEnchantment set from storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.id

    execute store success storage arena-boss:temp Altar.HasError byte 1 run data modify storage arena-boss:temp Altar.ShardEnchantment set from storage arena-boss:temp Altar.WaeponEnchantment

    # エラー出力
    execute if data storage arena-boss:temp {Altar:{Operation:Enhance}} if data storage arena-boss:temp {Altar:{HasError:true}} run tellraw @a[tag=Arena.AltarOpener] [{"text": " ["},{"text": "Arena","color": "red"},{"text": "] "},{"text": "エラー: 異なる種類のボスエンチャントを付与することはできません。","color": "red"}]
    execute if data storage arena-boss:temp {Altar:{Operation:Enhance}} if data storage arena-boss:temp {Altar:{HasError:true}} run playsound entity.enderman.teleport master @a[tag=Arena.AltarOpener] ~ ~ ~ 1 0.5

    execute if data storage arena-boss:temp {Altar:{Operation:Enhance}} if data storage arena-boss:temp {Altar:{HasError:true}} run function arena:stop_process

## エンチャントシャードの個数が足りているか確認

# 分かりやすいようにスコアで取得
execute store result score $EnchantmentLevelBefore ArenaBoss.Temp run data get storage arena-boss:temp Altar.ResourceItem[0].tag.KotaItems.BossEnchantment.lvl

    # 強化処理時
        # レベル別で必要個数設定 (単純関数化するのが難しいため全探索)
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 1 run scoreboard players set $E.ShardRequired ArenaBoss.Temp 4
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 2 run scoreboard players set $E.ShardRequired ArenaBoss.Temp 7
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 3 run scoreboard players set $E.ShardRequired ArenaBoss.Temp 10
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 4 run scoreboard players set $E.ShardRequired ArenaBoss.Temp 15
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 5 run scoreboard players set $E.ShardRequired ArenaBoss.Temp 30
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 6 run scoreboard players set $E.ShardRequired ArenaBoss.Temp 64

    # 付与処理時
    execute if data storage arena-boss:temp {Altar:{Operation:Give}} run scoreboard players set $E.ShardRequired ArenaBoss.Temp 2


    # クラフト枠に置かれた個数を取得
    execute store result score $E.ShardPlaced ArenaBoss.Temp run data get storage arena-boss:temp Altar.ResourceItem[1].Count

    # 比較、不足ならエラー出力
    scoreboard players operation $E.ShardShortage ArenaBoss.Temp = $E.ShardRequired ArenaBoss.Temp
    scoreboard players operation $E.ShardShortage ArenaBoss.Temp -= $E.ShardPlaced ArenaBoss.Temp
    
    execute if score $E.ShardRequired ArenaBoss.Temp > $E.ShardPlaced ArenaBoss.Temp run tellraw @a[tag=Arena.AltarOpener] [{"text": " ["},{"text": "Arena","color": "red"},{"text": "] "},{"text": "エラー: エンチャントシャードが","color": "red"},{"score":{"name": "$E.ShardShortage","objective": "ArenaBoss.Temp"},"color": "red","bold": true,"underlined": true},{"text": "個","color": "red","bold": true,"underlined": true},{"text": "不足しています。","color": "red","bold": false}]
    execute if score $E.ShardRequired ArenaBoss.Temp > $E.ShardPlaced ArenaBoss.Temp run playsound entity.enderman.teleport master @a[tag=Arena.AltarOpener] ~ ~ ~ 1 0.5

    execute if score $E.ShardRequired ArenaBoss.Temp > $E.ShardPlaced ArenaBoss.Temp run function arena:stop_process


## 煌めく小片の個数が足りているか確認

    # 強化処理時
        # レベル別で必要個数設定 (単純関数化するのが難しいため全探索)
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 1 run scoreboard players set $G.ShardRequired ArenaBoss.Temp 2
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 2 run scoreboard players set $G.ShardRequired ArenaBoss.Temp 3
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 3 run scoreboard players set $G.ShardRequired ArenaBoss.Temp 4
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 4 run scoreboard players set $G.ShardRequired ArenaBoss.Temp 5
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 5 run scoreboard players set $G.ShardRequired ArenaBoss.Temp 7
        execute if score $EnchantmentLevelBefore ArenaBoss.Temp matches 6 run scoreboard players set $G.ShardRequired ArenaBoss.Temp 10

    # 付与処理時
    execute if data storage arena-boss:temp {Altar:{Operation:Give}} run scoreboard players set $G.ShardRequired ArenaBoss.Temp 1


    # クラフト枠に置かれた個数を取得
    execute store result score $G.ShardPlaced ArenaBoss.Temp run data get storage arena-boss:temp Altar.ResourceItem[2].Count

    # 比較、不足ならエラー出力
    scoreboard players operation $G.ShardShortage ArenaBoss.Temp = $G.ShardRequired ArenaBoss.Temp
    scoreboard players operation $G.ShardShortage ArenaBoss.Temp -= $G.ShardPlaced ArenaBoss.Temp
    
    execute if score $G.ShardRequired ArenaBoss.Temp > $G.ShardPlaced ArenaBoss.Temp run tellraw @a[tag=Arena.AltarOpener] [{"text": " ["},{"text": "Arena","color": "red"},{"text": "] "},{"text": "エラー: 煌めく小片が","color": "red"},{"score":{"name": "$G.ShardShortage","objective": "ArenaBoss.Temp"},"color": "red","bold": true,"underlined": true},{"text": "個","color": "red","bold": true,"underlined": true},{"text": "不足しています。","color": "red","bold": false}]
    execute if score $G.ShardRequired ArenaBoss.Temp > $G.ShardPlaced ArenaBoss.Temp run playsound entity.enderman.teleport master @a[tag=Arena.AltarOpener] ~ ~ ~ 1 0.5

    execute if score $G.ShardRequired ArenaBoss.Temp > $G.ShardPlaced ArenaBoss.Temp run function arena:stop_process


## 問題なければ処理を実行
# 付与処理
execute if data storage arena-boss:temp {Altar:{Operation:Give}} run function arena-boss:enchanting_altar/crafting/give

# 強化処理
execute if data storage arena-boss:temp {Altar:{Operation:Enhance}} run function arena-boss:enchanting_altar/crafting/enhance

# 自動回収しないよう
data modify storage arena-boss: Altar.HasOutput set value true

## Lore更新
function arena-boss:enchanting_altar/crafting/change_lore


## 消費アイテム数を減算して個数に適応
# エンチャントシャード
execute store result score $E.ShardCount ArenaBoss.Temp run data get storage arena-boss:temp Altar.ResourceItem[1].Count
scoreboard players operation $E.ShardCount ArenaBoss.Temp -= $E.ShardRequired ArenaBoss.Temp

execute store result entity @s Items[{Slot:11b}].Count byte 1 run scoreboard players get $E.ShardCount ArenaBoss.Temp

# 煌めく小片
execute store result score $G.ShardCount ArenaBoss.Temp run data get storage arena-boss:temp Altar.ResourceItem[2].Count
scoreboard players operation $G.ShardCount ArenaBoss.Temp -= $G.ShardRequired ArenaBoss.Temp

execute store result entity @s Items[{Slot:12b}].Count byte 1 run scoreboard players get $G.ShardCount ArenaBoss.Temp


## 処理済みのデータを実際のアイテムに適応
item replace entity @s container.16 from entity @s container.10
data modify entity @s Items[{Slot:16b}].tag set from storage arena-boss:temp Altar.ResourceItem[0].tag

## Lore 更新
function arena-boss:enchanting_altar/crafting/change_lore

# 材料スロットのアイテム消去
item replace entity @s container.10 with air

# end
