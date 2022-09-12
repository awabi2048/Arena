# ボタン押したときの処理
# Arena.Core に保存されたウェーブ数を変更 (通常/エンドレス)
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave

execute as @e[tag=Arena.Core,sort=nearest,limit=1] store result entity @s data.Wave int 1 if score @s Arena matches 1.. run scoreboard players add $Temp.Wave Arena 1
execute as @e[tag=Arena.Core,sort=nearest,limit=1] store result entity @s data.Wave int 1 if score @s Arena matches -1 run scoreboard players remove $Temp.Wave Arena 1

# 開始後に設定看板を削除, タイマー管理用アーマースタンド消去
execute if score $Temp.Wave Arena matches 1 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~1 ~2 air 
execute if score $Temp.Wave Arena matches 1 at @e[tag=Arena.Core,sort=nearest,limit=1] run kill @e[tag=Arena.Timer,sort=nearest,limit=1]

# 次のウェーブに 進む/終了
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave
scoreboard players operation $Temp.CurrentWave Arena = $Temp.Wave Arena

    # 通常
    execute if score $Temp.CurrentWave Arena matches 1..5 run function arena:button/wave
    execute if score $Temp.CurrentWave Arena matches 6..7 run function arena:button/end

    # エンドレス
    execute if score $Temp.CurrentWave Arena matches -100..-1 run function arena:endless/wave
    execute if score $Temp.CurrentWave Arena matches -101 run function arena:endless/end

scoreboard players reset $Temp.CurrentWave Arena

