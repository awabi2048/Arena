# エンドレス時のステータス倍率設定 (現: 1.00 + Wave数*0.08)
execute store result score $AttributesMultiple Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -8
scoreboard players add $AttributesMultiple Arena.Temp 100

# 通常エンドレスのデータ取得
data modify storage arena:temp StageType set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType

execute store result score $AttackDamage Arena.Temp run data get storage arena:temp MobInfo.AttackDamage 100
execute store result score $Health Arena.Temp run data get storage arena:temp MobInfo.Health 100

execute store result score $SummonCount Arena.Temp run data get storage arena:temp MobInfo.SummonCount 100
execute store result score $Speed Arena.Temp run data get storage arena:temp MobInfo.Speed 100

# AttributesMultipleの値で掛け算 
scoreboard players operation $AttackDamage Arena.Temp *= $AttributesMultiple Arena.Temp
scoreboard players operation $Health Arena.Temp *= $AttributesMultiple Arena.Temp

scoreboard players operation $AttackDamage Arena.Temp /= #100 Constant
scoreboard players operation $Health Arena.Temp /= #100 Constant

# 速度値は低めの倍率で掛け算, 大きくなりすぎたら上限値に設定
execute store result score $AttributesMultiple Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -3
scoreboard players add $AttributesMultiple Arena.Temp 100

scoreboard players operation $Speed Arena.Temp *= $AttributesMultiple Arena.Temp
scoreboard players operation $Speed Arena.Temp /= #100 Constant

execute if score $Speed Arena.Temp matches 30.. run scoreboard players set $Speed Arena.Temp 30

# storageに適応
execute store result storage arena:temp MobInfo.AttackDamage double 0.01 run scoreboard players get $AttackDamage Arena.Temp
execute store result storage arena:temp MobInfo.Speed double 0.01 run scoreboard players get $Speed Arena.Temp
execute store result storage arena:temp MobInfo.Health double 0.01 run scoreboard players get $Health Arena.Temp

