# 終了処理
# Wave 1-5: 通常 , 6: 報酬配布 , 7: 終了
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute if score $Wave Arena.Temp matches 6 run function arena:button/reward
execute if score $Wave Arena.Temp matches 7 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run function arena:end
