## 終了処理
# ランキング作成・表示・報酬付与
data modify storage arena-boss:temp Ranking set value []

execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s {"translate":"arena.game.message.bar"}

execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s [{"nbt":"Status.ActiveStageInfo.Name","storage":"arena-boss:","interpret": true}]
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s {"translate":"arena.boss.game.message.end_ranking-note"}
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s " "

execute as @r[tag=Arena.Player,scores={ArenaBoss.DamageDealt=1..}] run function arena-boss:core/ranking

execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s {"translate":"arena.game.message.bar"}

## 通知
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @a[tag=Arena.Notice] [{"translate":"arena.boss.game.message.end_cleared","with":[{"selector":"@s","color": "yellow"},{"nbt":"Status.ActiveStageInfo.Name","storage":"arena-boss:","interpret": true}]}]
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s [{"translate":"arena.game.message.prefix"},{"translate":"arena.boss.game.message.end_teleport_announce","with":[{"text":"15","color": "yellow","bold": true}]}]

## 後処理1
bossbar remove arena-boss:

## tp
schedule function arena-boss:core/end-tp_back 15s
