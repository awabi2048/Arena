# 終了処理
# Wave 1-5: 通常 , 6: 報酬配布 , 7: 終了
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute if score $Temp.Wave Arena matches 6 run function arena:button/reward
execute if score $Temp.Wave Arena matches 7 run function arena:end
