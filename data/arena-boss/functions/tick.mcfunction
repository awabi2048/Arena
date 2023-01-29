# tick

execute as @e[tag=ArenaBoss.Core] at @s run function arena-boss:animation/tick

# 位置同期
execute as @e[tag=ArenaBoss.Hitbox] positioned as @e[tag=ArenaBoss.Core] run tp @s ~ ~ ~


# function

function arena-boss:fire/tick
