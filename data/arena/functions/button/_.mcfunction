# ボタン押したときの処理
# 開始時の処理
execute if score $Wave Arena.Temp matches 0 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~1 ~2 air 

execute if score $Wave Arena.Temp matches 0 at @e[tag=Arena.Core,sort=nearest,limit=1] store result score $PlayerCount Arena.Temp if entity @a[tag=Arena.Player,distance=..32]
execute if score $Wave Arena.Temp matches 0 if score $PlayerCount Arena.Temp matches 1 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Solo set value true

# 開始時のgametimeを取得
execute if score $Wave Arena.Temp matches 0 store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StartTime int 1 run time query gametime

# ステージ種類データの設定
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 1.. run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "Normal"
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType set value "Endless"

execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 if score $Wave Arena.Temp matches 0 run data modify storage arena: Endless.LastSummonedMob set value [-1, -1, -1]

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
    execute if score $Wave Arena.Temp matches ..-1 run function arena:endless/wave
