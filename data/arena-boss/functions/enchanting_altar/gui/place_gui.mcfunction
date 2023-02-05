# GUIアイテム取られたとき
# スロットにアイテムがあれば返却
data modify storage arena-boss:temp Altar.ReturnItem set from entity @s Items[{Slot:0b}]
execute if data storage arena-boss:temp Altar.ReturnItem at @a[tag=Arena.AltarOpener] run function arena-boss:enchanting_altar/gui/return_item_single

# 再設置
clear @a orange_dye{CustomModelData:201990001}
item replace entity @s container.0 with orange_dye{display:{Name:'{"text":" "}'},CustomModelData:201990001}

