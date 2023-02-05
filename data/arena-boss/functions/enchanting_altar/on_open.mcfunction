# メニュー開封時実行
# トリガー解除
advancement revoke @s only arena-boss:enchanting_altar/on_open

# 他に開いているプレイヤーがいればエラー, 無理やりGUI閉ざす
execute if entity @a[tag=Arena.AltarOpener] run playsound entity.enderman.teleport master @s ~ ~ ~ 1 0.5
execute if entity @a[tag=Arena.AltarOpener] run tellraw @s [{"text": " ["},{"text": "Arena","color": "red"},{"text": "] "},{"text": "エラー: 既に他のプレイヤーがメニューを開いています。","color": "red"}]

execute if entity @a[tag=Arena.AltarOpener] run tp @s ~ ~100.5 ~

execute if entity @a[tag=Arena.AltarOpener] run tag @s add Arena.CloseGUI
execute if entity @a[tag=Arena.AltarOpener] run schedule function arena-boss:enchanting_altar/gui/force_close 2t

execute if entity @a[tag=Arena.AltarOpener] run function arena:stop_process

# タグ付与
tag @s add Arena.AltarOpener

# 閉じたときを検知するための前準備
schedule function arena-boss:enchanting_altar/close_detector 15t
data modify entity @e[tag=ArenaBoss.Altar.Menu,limit=1] PortalCooldown set value 15

# 演出
playsound entity.elder_guardian.curse master @a ~ ~ ~ 1 1.5

execute at @e[tag=ArenaBoss.Altar.Core] positioned ~ ~2 ~ run particle witch ~ ~ ~ 0.5 0.5 0.5 0.25 100
execute at @e[tag=ArenaBoss.Altar.Core] positioned ~ ~2 ~ run particle enchant ~ ~ ~ 1.5 1.5 1.5 0.5 100

# メニューリセット
data modify entity @e[tag=ArenaBoss.Altar.Menu,limit=1] Items set value []

schedule function arena-boss:enchanting_altar/gui/place_gui 1t

# フラグ設定
data modify storage arena-boss: Altar.GUIPlaced set value false
