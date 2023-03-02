# tick
execute as @e[tag=ArenaBoss.Core,distance=..64] at @s run function arena-boss:animation/tick
execute if data storage arena-boss: {Animation:{Name:"Spawning"}} as @e[tag=ArenaBoss.StageCore,distance=..64] at @s run function arena-boss:animation/spawning

# function呼び出し
execute as @e[tag=ArenaBoss.Core,distance=..64] at @s run function arena-boss:behavior/movement/_


execute if data storage arena-boss: {Name:"Fire"} run function arena-boss:fire/tick
execute if data storage arena-boss: {Name:"Water"} run function arena-boss:water/tick

# スタートまでのカウントダウン
execute if score $StartTimer ArenaBoss matches 1.. run scoreboard players remove $StartTimer ArenaBoss 1
execute if score $StartTimer ArenaBoss matches 100 run function arena-boss:core/enter/countdown

execute if score $StartTimer ArenaBoss matches 0 run function arena-boss:spawn
