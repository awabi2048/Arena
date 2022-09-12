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

function arena:endless/boss/reset
