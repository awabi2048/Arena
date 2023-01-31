# tick

execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/tick

# 位置同期
execute as @e[tag=ArenaBoss.Core] positioned as @e[tag=ArenaBoss.Motion,limit=1] run tp @s ~ ~ ~
execute as @e[tag=ArenaBoss.Hitbox] positioned as @e[tag=ArenaBoss.Core] run tp @s ~ ~ ~

execute as @e[tag=ArenaBoss.Element-Parts] positioned as @e[tag=ArenaBoss.Extra01] run tp @s ~ ~-0.25 ~

data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[0] set from entity @e[tag=ArenaBoss.Motion,limit=1] Pos[0]
data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[2] set from entity @e[tag=ArenaBoss.Motion,limit=1] Pos[2]

# function

function arena-boss:fire/tick


execute if data storage arena-boss: {Animation:{Flag:{NoMove:false}}} run function arena-boss:behavior/movement/_
