# tick

execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/tick
execute if data storage arena-boss: {Animation:{Name:"Spawning"}} as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:"Boss"}}} at @s run function arena-boss:animation/spawning


# function

function arena-boss:fire/tick


execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} run function arena-boss:behavior/movement/_

