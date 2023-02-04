# 閉じたとき実行
# アイテム返却
data modify storage arena-boss:temp Altar.ReturnMode set value All
execute at @e[tag=ArenaBoss.Altar.Core] run function arena-boss:enchanting_altar/gui/return_item

# 検知用エンティティkill
kill @e[tag=ArenaBoss.Altar.CloseDetector]

# 開封プレイヤーのタグ除去
tag @a[tag=Arena.AltarOpener] remove Arena.AltarOpener
