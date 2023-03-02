## 開始直前のカウントダウン
# 5秒前
execute if score $StartTimer ArenaBoss matches 100 run data modify storage arena-boss:temp StartCountdown set value 5

# 通知
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s [{"translate":"arena.game.message.prefix"},{"translate":"arena.boss.game.message.start_countdown","with":[{"nbt":"StartCountdown","storage":"arena-boss:temp","color": "yellow","bold": true}]}]
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. at @s run playsound block.note_block.pling master @s ~ ~ ~ 1 0.75

# カウントを進行・再帰
execute store result storage arena-boss:temp StartCountdown int 0.99999 run data get storage arena-boss:temp StartCountdown

execute unless data storage arena-boss:temp {StartCountdown:0} run schedule function arena-boss:core/enter/countdown 1s
