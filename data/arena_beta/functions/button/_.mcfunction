# ボタン押したときの処理
# Arena.Core に保存されたウェーブ数を変更
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

# 次のウェーブに 進む/終了
function arena:button/test

execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int 1 run scoreboard players remove $Wave Arena.Temp 1

execute if score $Wave Arena.Temp matches -10..-1 run function arena_beta:extra/wave
execute if score $Wave Arena.Temp matches -11 run function arena_beta:extra/end

scoreboard players reset $Wave Arena.Temp

