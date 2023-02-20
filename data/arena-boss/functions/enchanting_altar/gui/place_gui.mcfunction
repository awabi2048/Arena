# GUIアイテムの再設置・設置
clear @a orange_dye{CustomModelData:1000010}

data modify storage arena-boss:temp Altar.ReturnItem set from entity @s Items[{Slot:0b}]
execute if data entity @e[tag=ArenaBoss.Altar.Menu,limit=1] Items[{Slot:0b}] run function arena-boss:enchanting_altar/gui/return_item_single

item replace entity @e[tag=ArenaBoss.Altar.Menu,limit=1] container.0 with orange_dye{display:{Name:'{"text":" "}'},CustomModelData:1000010}
item replace entity @e[tag=ArenaBoss.Altar.Menu,limit=1] container.23 with sculk_shrieker{display:{Name:'{"text":"合成","color": "light_purple","bold": true,"italic": false}'},KotaItems:{ID:"EnchantmentAltar.ButtonCraft"}}

# フラグ設定
execute if data storage arena-boss: {Altar:{GUIPlaced:false}} run data modify storage arena-boss: Altar.GUIPlaced set value true
