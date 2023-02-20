# 3つ頭の位置・向き調整
execute at @e[tag=ArenaBoss.Extra01] in minecraft:arena rotated as @e[tag=ArenaBoss.Core] run tp @e[tag=ArenaBoss.Part01-1] ^1.2 ^0.4 ^0.5
execute at @e[tag=ArenaBoss.Extra01] in minecraft:arena rotated as @e[tag=ArenaBoss.Core] run tp @e[tag=ArenaBoss.Part01-2] ^-1.2 ^0.4 ^0.5
execute at @e[tag=ArenaBoss.Extra01] in minecraft:arena rotated as @e[tag=ArenaBoss.Core] run tp @e[tag=ArenaBoss.Part01-3] ^ ^0.4 ^0.5

execute as @e[tag=ArenaBoss.Part01] at @s run tp @s ~ ~ ~ facing entity @a[tag=ArenaBoss.Target,limit=1] feet

execute as @e[tag=ArenaBoss.Part01] run data modify entity @s Pose.Head[0] set from entity @s Rotation[1]
