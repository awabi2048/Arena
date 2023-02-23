# tick
execute as @e[tag=ArenaBoss.Core,distance=..64] at @s run function arena-boss:animation/tick
execute if data storage arena-boss: {Animation:{Name:"Spawning"}} run function arena-boss:animation/spawning

# function呼び出し
execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} as @e[tag=ArenaBoss.Core,distance=..64] at @s run function arena-boss:behavior/movement/_


function arena-boss:fire/tick
function arena-boss:water/tick

# エンチャントの祭壇
execute as @e[tag=ArenaBoss.Altar.Core,limit=1] at @s run function arena-boss:enchanting_altar/tick

# スタートまでのカウントダウン
execute if score $StartTimer ArenaBoss matches 1.. run scoreboard players remove $StartTimer ArenaBoss 1
execute if score $StartTimer ArenaBoss matches 100 run function arena-boss:core/enter/countdown

execute if score $StartTimer ArenaBoss matches 0 run function arena-boss:spawn
