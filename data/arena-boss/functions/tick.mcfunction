# tick

execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/tick

# 位置同期
execute as @e[tag=ArenaBoss.Core] positioned as @e[tag=ArenaBoss.Motion,limit=1] run tp @s ~ ~ ~
execute as @e[tag=ArenaBoss.Hitbox] positioned as @e[tag=ArenaBoss.Core] run tp @s ~ ~ ~

execute as @e[tag=ArenaBoss.Element-Parts] positioned as @e[tag=ArenaBoss.Extra01] run tp @s ~ ~0.5 ~

execute if data entity @e[tag=ArenaBoss.Motion,limit=1] {OnGround:true} run data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[0] set from entity @e[tag=ArenaBoss.Motion,limit=1] Pos[0]
execute if data entity @e[tag=ArenaBoss.Motion,limit=1] {OnGround:true} run data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[2] set from entity @e[tag=ArenaBoss.Motion,limit=1] Pos[2]

execute if data entity @e[tag=ArenaBoss.Motion,limit=1] {OnGround:false} positioned as @e[tag=ArenaBoss.Motion,limit=1] run tp @e[tag=ArenaBoss.Extra01] ~ ~ ~

# function

function arena-boss:fire/tick
