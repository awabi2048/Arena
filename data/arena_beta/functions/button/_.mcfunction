# ボタン押したときの処理
# Arena.Core に保存されたウェーブ数を変更
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute as @e[tag=Arena.Core,sort=nearest,limit=1] store result entity @s data.Arena.Wave int 1 run scoreboard players remove $Temp.Wave Arena 1

# 次のウェーブに 進む/終了
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
scoreboard players operation $Temp.CurrentWave Arena = $Temp.Wave Arena

execute if score $Temp.CurrentWave Arena matches -10..-1 run function arena_beta:extra/wave
execute if score $Temp.CurrentWave Arena matches -11 run function arena_beta:extra/end

scoreboard players reset $Temp.CurrentWave Arena
