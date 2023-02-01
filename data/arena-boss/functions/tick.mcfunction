# tick

execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/tick

# function

function arena-boss:fire/tick


execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} run function arena-boss:behavior/movement/_

