# ボタン押したときの処理
# Betaステージか検証
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 99 run function arena_beta:button/_
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 99 run function arena:empty

# 開始時の処理: 看板削除, プレイヤー数の保存
execute if score $Temp.Wave Arena matches 0 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~1 ~2 air 

execute if score $Temp.Wave Arena matches 0 at @e[tag=Arena.Core,sort=nearest,limit=1] store result score $Temp.PlayerCount Arena if entity @a[tag=Arena.Player,distance=..32]
execute if score $Temp.Wave Arena matches 0 as @e[tag=Arena.Core,sort=nearest,limit=1] if score $Temp.PlayerCount Arena matches 1 run data modify entity @s data.Arena.Solo set value true

# ステージ種類データの設定
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 1.. run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "Normal"
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches ..-1 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "Endless"

execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 99 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "Extra"

execute as @a[tag=Arena.Player,distance=..32] if score @s Arena.PlayHiddenStage matches 1 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "HiddenEndless"

# エンドレス隠しステージ入場の処理
execute as @a[tag=Arena.Player,distance=..32] if score @s Arena.PlayHiddenStage matches 1 run playsound block.beacon.power_select master @s ~ ~ ~ 5 0.84
execute as @a[tag=Arena.Player,distance=..32] if score @s Arena.PlayHiddenStage matches 1 run playsound block.beacon.power_select master @s ~ ~ ~ 5 1.18

scoreboard objectives remove Arena.PlayHiddenStage

# 次のウェーブに 進む/終了
function arena:button/test

# 以下は成功時のみ実行
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute if data storage arena:temp {StageType:Normal} run scoreboard players add $Temp.Wave Arena 1
execute unless data storage arena:temp {StageType:Normal} run scoreboard players remove $Temp.Wave Arena 1

execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int 1 run scoreboard players get $Temp.Wave Arena

    # 通常
    execute if score $Temp.Wave Arena matches 1..5 run function arena:button/wave
    execute if score $Temp.Wave Arena matches 6..7 run function arena:button/end

    # エンドレス
    execute if score $Temp.Wave Arena matches -100..-1 run function arena:endless/wave
    execute if score $Temp.Wave Arena matches -101 run function arena:endless/end
