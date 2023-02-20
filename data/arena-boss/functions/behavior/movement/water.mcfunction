# 移動時処理

# 一定速度で移動
execute as @e[tag=ArenaBoss.Core] at @s facing entity @a[tag=ArenaBoss.Target,limit=1] eyes rotated ~ 0 if block ^ ^ ^0.04 air run tp @s ^ ^ ^0.04
execute as @e[tag=ArenaBoss.Core] at @s run tp @s ~ ~ ~ facing entity @a[tag=ArenaBoss.Target,limit=1] eyes

# 位置同期
execute as @e[tag=ArenaBoss.Hitbox] positioned as @e[tag=ArenaBoss.Core] in minecraft:arena run tp @s ~ ~ ~

execute as @e[tag=ArenaBoss.Element-Parts,tag=!ArenaBoss.Part01] positioned as @e[tag=ArenaBoss.Extra01] in minecraft:arena run tp @s ~ ~-0.25 ~


data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[0] set from entity @e[tag=ArenaBoss.Core,limit=1] Pos[0]
data modify entity @e[tag=ArenaBoss.Extra01,limit=1] Pos[2] set from entity @e[tag=ArenaBoss.Core,limit=1] Pos[2]

# 向き合わせ
execute as @e[tag=ArenaBoss.Element-Parts] at @s rotated as @e[tag=ArenaBoss.Core] run tp @s ~ ~ ~ ~ ~




# 意図せず構成エンティティの距離が離れてしまった場合
execute at @e[tag=ArenaBoss.Core] unless entity @e[tag=ArenaBoss.Extra01,distance=..0.125] run tp @s @e[tag=ArenaBoss.Extra01,limit=1]


