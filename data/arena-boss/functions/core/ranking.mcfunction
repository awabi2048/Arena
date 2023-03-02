## ランキング計算
# 保存用データ作成
data modify storage arena-boss:temp Ranking append value {}

## 現在の最大値を算出、保存
scoreboard players set $RankedDamage ArenaBoss.Temp -1
scoreboard players operation $RankedDamage ArenaBoss.Temp > @a[tag=Arena.Player] ArenaBoss.DamageDealt

execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tag @s add ArenaBoss.RankedPlayer

# 小数点以下を表示するため細工
data modify storage arena-boss:temp Ranking[-1].DamageDealt set value [-1, -1]

execute store result storage arena-boss:temp Ranking[-1].DamageDealt[0] int 0.01 run scoreboard players get $RankedDamage ArenaBoss.Temp

scoreboard players operation $RankedDamage ArenaBoss.Temp %= #100 Constant
execute store result storage arena-boss:temp Ranking[-1].DamageDealt[1] int 1 run scoreboard players get $RankedDamage ArenaBoss.Temp

## プレイヤーの名前を保存
execute in minecraft:arena run setblock 0 0 0 chest
execute as @a[tag=ArenaBoss.RankedPlayer] in minecraft:arena run loot replace block 0 0 0 container.0 loot arena:misc/player_head

execute in minecraft:arena run data modify storage arena-boss:temp Ranking[-1].Name set from block 0 0 0 Items[0].tag.SkullOwner.Name
execute in minecraft:arena run setblock 0 0 0 bedrock

## Suffix設定
    data modify storage arena-boss:temp Ranking[-1].Suffix set value []

    execute store result score $LoopCount ArenaBoss.Temp run data get storage arena-boss:temp Ranking

    execute store result storage arena-boss:temp Ranking[-1].Rank int 1 run scoreboard players get $LoopCount ArenaBoss.Temp

    # 1の位の値によって語尾を変化
    scoreboard players operation $LoopCount ArenaBoss.Temp %= #10 Constant

    execute if score $LoopCount ArenaBoss.Temp matches 1 run data modify storage arena-boss:temp Ranking[-1].Suffix set value "st"
    execute if score $LoopCount ArenaBoss.Temp matches 2 run data modify storage arena-boss:temp Ranking[-1].Suffix set value "nd"
    execute if score $LoopCount ArenaBoss.Temp matches 3 run data modify storage arena-boss:temp Ranking[-1].Suffix set value "rd"

    execute unless data storage arena-boss:temp Ranking[-1].Suffix run data modify storage arena-boss:temp Ranking[-1].Suffix set value "th"

## 報酬付与
    # チケット (T= 0.0067 * D + 3) T: 枚数, D: 与ダメージ
    scoreboard players operation $TicketCount Arena.Temp = $RankedDamage ArenaBoss.Temp
    scoreboard players operation $TicketCount Arena.Temp /= #100 Constant
    scoreboard players operation $TicketCount Arena.Temp /= #150 Constant

    scoreboard players add $TicketCount Arena.Temp 3

    # ドロップアイテム (Rl = 0.001 * D + 0.66 * (4 - Rn)) Rl: 抽選回数, D: 与ダメージ, Rn: 順位
    scoreboard players operation $RollCount ArenaBoss.Temp = $RankedDamage ArenaBoss.Temp
    scoreboard players operation $RollCount ArenaBoss.Temp /= #100 Constant
    scoreboard players operation $RollCount ArenaBoss.Temp /= #1000 Constant

    execute store result score $Rank ArenaBoss.Temp run data get storage arena-boss:temp Ranking

    scoreboard players operation $RollCount_Bonus ArenaBoss.Temp = $Rank ArenaBoss.Temp 
    scoreboard players remove $RollCount_Bonus ArenaBoss.Temp 4

    scoreboard players operation $RollCount_Bonus ArenaBoss.Temp *= #66 Constant 
    scoreboard players operation $RollCount_Bonus ArenaBoss.Temp /= #100 Constant 

    # 合算、loot give
    scoreboard players operation $RollCount ArenaBoss.Temp -= $RollCount_Bonus ArenaBoss.Temp 

    execute as @a[tag=ArenaBoss.RankedPlayer] at @s run function arena-boss:death_loot
    execute as @a[tag=ArenaBoss.RankedPlayer] at @s run loot spawn ~ ~ ~ loot arena:ticket/hard

## 表示
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tellraw @s [{"translate":"arena.boss.game.message.end_ranking-main","with":[{"nbt":"Ranking[-1].Rank","storage":"arena-boss:temp","color": "white","bold": true},{"nbt":"Ranking[-1].Suffix","storage":"arena-boss:temp","color": "white","bold": true},{"nbt":"Ranking[-1].Name","storage":"arena-boss:temp","color": "yellow","bold": true},{"nbt":"Ranking[-1].DamageDealt[0]","storage":"arena-boss:temp","color": "red"},{"nbt":"Ranking[-1].DamageDealt[1]","storage":"arena-boss:temp","color": "red"}]}]

## 後処理
scoreboard players set @a[tag=ArenaBoss.RankedPlayer] ArenaBoss.DamageDealt -1
tag @a remove ArenaBoss.RankedPlayer

## 再帰
execute if entity @a[tag=Arena.Player,scores={ArenaBoss.DamageDealt=1..}] run schedule function arena-boss:core/ranking 1t
