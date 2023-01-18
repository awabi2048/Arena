# 中にいるモブを消す
tp @e[tag=Arena.Mob,distance=..40] ~ ~-100 ~
tp @e[type=arrow,distance=..40] ~ ~-100 ~
tp @e[type=area_effect_cloud,distance=..40] ~ ~-100 ~
tp @e[type=item,distance=..40] ~ ~-100 ~
tp @e[type=experience_orb,distance=..40] ~ ~-100 ~

execute positioned ~ ~-100 ~ run kill @e[tag=Arena.Mob,distance=..3]

# スコアのリセット
scoreboard players set $Temp.Wave Arena 0

scoreboard players set $MobCount Arena 0
scoreboard players set $MobSummonCount Arena 0
scoreboard players set $MobCountMax Arena 0

# Arena.Coreのデータのリセット
data modify entity @s data.Arena.Wave set value 0
data modify entity @s data.Arena.MobType set value -1
data modify entity @s data.Arena.PlayerCount set value -1
data modify entity @s data.Arena.Difficulty set value 0
data modify entity @s data.Arena.LastMobType set value [-1,-1,-1]

# ボスバー
bossbar remove arena_beta:extra_boss
bossbar remove arena:mid_boss

# 各種エンティティのキル
tp @e[tag=Arena.Mob,distance=..40] ~ ~-100 ~
execute positioned ~ ~-100 ~ run kill @e[tag=Arena.Mob,distance=..3] 
kill @e[tag=Arena.Boss.Marker]

# スコア, ストレージリセット
scoreboard players set $Boss.SkillTimer Arena 0

data modify storage arena: Boss.Skills set value []
scoreboard players set $Boss.SkillInterval Arena 300

# ストラクチャー再読み込み
setblock ~ ~-4 ~ air
setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,name:"arena:stage-normal",mode:"LOAD"}
setblock ~ ~-5 ~ redstone_block
setblock ~ ~-5 ~ stone

