# ボスバー
bossbar remove arena:boss
bossbar remove arena:boss_shield
bossbar remove arena:mid_boss

# 各種エンティティのキル
tp @e[tag=Arena.Mob,distance=..40] ~ ~-100 ~
execute positioned ~ ~-100 ~ run kill @e[tag=Arena.Mob,distance=..3] 
kill @e[tag=Arena.Boss.Marker]

function arena:endless/boss/hidden/kill

# スコア, ストレージリセット
scoreboard players set $Boss.SkillTimer Arena 0

data modify storage arena: Boss.Skills set value []
scoreboard players set $Boss.SkillInterval Arena 300

# ストラクチャー再読み込み
execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Endless}}} at @s run setblock ~ ~-4 ~ air
execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Endless}}} at @s run setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,name:"arena:stage-normal"}
execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Endless}}} at @s run setblock ~ ~-5 ~ redstone_block
execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:Endless}}} at @s run setblock ~ ~-5 ~ air

