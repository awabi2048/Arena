# ボタン押したときの処理
# Betaステージか検証
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 99 run function arena_beta:button/_
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 99 run function arena:stop_process

# 開始時の処理: 看板削除, プレイヤー数の保存
execute if score $Wave Arena.Temp matches 0 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~1 ~2 air 

execute if score $Wave Arena.Temp matches 0 at @e[tag=Arena.Core,sort=nearest,limit=1] store result score $PlayerCount Arena.Temp if entity @a[tag=Arena.Player,distance=..32]
execute if score $Wave Arena.Temp matches 0 if score $PlayerCount Arena.Temp matches 1 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Solo set value true

# ステージ種類データの設定
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 1.. run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "Normal"
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches ..-1 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "Endless"

execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 99 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "BetaExtra"

execute as @a[tag=Arena.Player,distance=..32] if score @s Arena.PlayHiddenStage matches 1 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "HiddenEndless"

# エンドレス隠しステージ入場の処理
execute as @a[tag=Arena.Player,distance=..32] if score @s Arena.PlayHiddenStage matches 1 run playsound block.beacon.power_select master @s ~ ~ ~ 5 0.84
execute as @a[tag=Arena.Player,distance=..32] if score @s Arena.PlayHiddenStage matches 1 run playsound block.beacon.power_select master @s ~ ~ ~ 5 1.18

scoreboard objectives remove Arena.PlayHiddenStage

# 次のウェーブに 進む/終了
function arena:button/test

# 以下は成功時のみ実行
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute if data storage arena:temp {StageType:Normal} run scoreboard players add $Wave Arena.Temp 1
execute unless data storage arena:temp {StageType:Normal} run scoreboard players remove $Wave Arena.Temp 1

execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int 1 run scoreboard players get $Wave Arena.Temp

    # 通常
    execute if score $Wave Arena.Temp matches 1..5 run function arena:button/wave
    execute if score $Wave Arena.Temp matches 6..7 run function arena:button/end

    # エンドレス
    execute if score $Wave Arena.Temp matches -100..-1 run function arena:endless/wave
    execute if score $Wave Arena.Temp matches -101 run function arena:endless/end
