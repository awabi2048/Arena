# 移動時処理

# 距離に応じた速度で移動
execute as @e[tag=ArenaBoss.Motion] at @s if entity @a[tag=ArenaBoss.Target,distance=4..8] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.0625
execute as @e[tag=ArenaBoss.Motion] at @s if entity @a[tag=ArenaBoss.Target,distance=8..24] facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 run tp @s ^ ^ ^0.125

execute as @e[tag=ArenaBoss.Part08] at @s rotated as @e[tag=ArenaBoss.Core] run tp @s ~ ~ ~ ~ ~
