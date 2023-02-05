## 場外スロットにアイテムがある
# アイテムの種類を分別

data modify storage arena-boss:temp Altar.PlaceItem set value []
data modify storage arena-boss:temp Altar.ReturnItem set value []
data modify storage arena-boss:temp Altar.RecipeItem set value {}

    # レシピアイテム
        # シャード・小片
        data modify storage arena-boss:temp Altar.RecipeItem.EnchantmentShard append from storage arena-boss:temp Altar.Item[{tag:{KotaItems:{ID:"EnchantmentShard"}}}]
        data modify storage arena-boss:temp Altar.RecipeItem.GlitterShard append from storage arena-boss:temp Altar.Item[{tag:{KotaItems:{ID:"GlitterShard"}}}]

        # 剣
        data modify storage arena-boss:temp Altar.RecipeItem.Sword append from storage arena-boss:temp Altar.Item[{id:"minecraft:wooden_sword"}]
        data modify storage arena-boss:temp Altar.RecipeItem.Sword append from storage arena-boss:temp Altar.Item[{id:"minecraft:stone_sword"}]
        data modify storage arena-boss:temp Altar.RecipeItem.Sword append from storage arena-boss:temp Altar.Item[{id:"minecraft:iron_sword"}]
        data modify storage arena-boss:temp Altar.RecipeItem.Sword append from storage arena-boss:temp Altar.Item[{id:"minecraft:gold_sword"}]
        data modify storage arena-boss:temp Altar.RecipeItem.Sword append from storage arena-boss:temp Altar.Item[{id:"minecraft:diamond_sword"}]
        data modify storage arena-boss:temp Altar.RecipeItem.Sword append from storage arena-boss:temp Altar.Item[{id:"minecraft:netherite_sword"}]

        # 被りがあったら最初の1つ以外は返却へ
            # エンチャントシャード
            execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:11b}] run data modify storage arena-boss:temp Altar.PlaceItem append from storage arena-boss:temp Altar.RecipeItem.EnchantmentShard[0]
            execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:11b}] run data remove storage arena-boss:temp Altar.RecipeItem.EnchantmentShard[0]

            execute if data storage arena-boss:temp Altar.RecipeItem.EnchantmentShard[0] run data modify storage arena-boss:temp Altar.ReturnItem append from storage arena-boss:temp Altar.RecipeItem.EnchantmentShard[]

            # 煌めく小片
            execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:12b}] run data modify storage arena-boss:temp Altar.PlaceItem append from storage arena-boss:temp Altar.RecipeItem.GlitterShard[0]
            execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:12b}] run data remove storage arena-boss:temp Altar.RecipeItem.GlitterShard[0]

            execute if data storage arena-boss:temp Altar.RecipeItem.GlitterShard[0] run data modify storage arena-boss:temp Altar.ReturnItem append from storage arena-boss:temp Altar.RecipeItem.GlitterShard[]

            # 剣
            execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:10b}] run data modify storage arena-boss:temp Altar.PlaceItem append from storage arena-boss:temp Altar.RecipeItem.Sword[0]
            execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:10b}] run data modify storage arena-boss:temp Altar.PlaceItem[-1].ID set value "#minecraft:sword"
            
            data remove storage arena-boss:temp Altar.RecipeItem.Sword[0]

            execute if data storage arena-boss:temp Altar.RecipeItem.Sword[0] run data modify storage arena-boss:temp Altar.ReturnItem append from storage arena-boss:temp Altar.RecipeItem.Sword[]

    ## 関係ないアイテム
    data modify storage arena-boss:temp Altar.ExtraItem set from storage arena-boss:temp Altar.Item

    # 上で挙げたアイテムを除去
        # シャード・小片
        data remove storage arena-boss:temp Altar.ExtraItem[{tag:{KotaItems:{ID:"EnchantmentShard"}}}]
        data remove storage arena-boss:temp Altar.ExtraItem[{tag:{KotaItems:{ID:"GlitterShard"}}}]

        # 剣
        data remove storage arena-boss:temp Altar.ExtraItem[{id:"minecraft:wooden_sword"}]
        data remove storage arena-boss:temp Altar.ExtraItem[{id:"minecraft:stone_sword"}]
        data remove storage arena-boss:temp Altar.ExtraItem[{id:"minecraft:iron_sword"}]
        data remove storage arena-boss:temp Altar.ExtraItem[{id:"minecraft:gold_sword"}]
        data remove storage arena-boss:temp Altar.ExtraItem[{id:"minecraft:diamond_sword"}]
        data remove storage arena-boss:temp Altar.ExtraItem[{id:"minecraft:netherite_sword"}]

    # マージ
    data modify storage arena-boss:temp Altar.ReturnItem append from storage arena-boss:temp Altar.ExtraItem[]

## いらないアイテムを返却
setblock 0 -64 0 shulker_box
data modify block 0 -64 0 Items set from storage arena-boss:temp Altar.ReturnItem

loot give @p[tag=Arena.AltarOpener] mine 0 -64 0 debug_stick

setblock 0 -64 0 bedrock


## レシピアイテムなら枠に自動で移動 (便利！！！！)
# 再配置アイテム
data modify storage arena-boss:temp Altar.PlaceItem[{ID:"#minecraft:sword"}].Slot set value 10b
data modify storage arena-boss:temp Altar.PlaceItem[{tag:{KotaItems:{ID:"EnchantmentShard"}}}].Slot set value 11b
data modify storage arena-boss:temp Altar.PlaceItem[{tag:{KotaItems:{ID:"GlitterShard"}}}].Slot set value 12b

# メニューアイテム
data modify storage arena-boss:temp Altar.PlaceItem append value {id:"minecraft:orange_dye",Count:1b,tag:{display:{Name:'{"text":" "}'},CustomModelData:201990001},Slot:0b}
data modify storage arena-boss:temp Altar.PlaceItem append value {id:"minecraft:sculk_shrieker",Count:1b,tag:{display:{Name:'{"text":"合成","color": "light_purple","bold": true,"italic": false}'},KotaItems:{ID:"EnchantmentAltar.ButtonCraft"}},Slot:23b}

# Itemsに書き換え
data modify entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items set from storage arena-boss:temp Altar.PlaceItem

execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:10b}] run data modify entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items append from storage arena-boss:temp Altar.PlaceItem[{Slot:10b}]
execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:11b}] run data modify entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items append from storage arena-boss:temp Altar.PlaceItem[{Slot:11b}]
execute unless data entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items[{Slot:12b}] run data modify entity @e[tag=ArenaBoss.Altar.Menu,sort=nearest,limit=1] Items append from storage arena-boss:temp Altar.PlaceItem[{Slot:12b}]
