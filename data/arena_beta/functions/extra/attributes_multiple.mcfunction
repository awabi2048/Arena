# ステータス倍率設定 (現: 1.50 + Wave数*0.05)
execute store result score $Temp.AttributesMultiple Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -5
scoreboard players add $Temp.AttributesMultiple Arena 150

# 通常エンドレスのデータ取得
data modify storage arena:temp StageType set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType

execute store result score $Temp.AttackDamage Arena run data get storage arena:temp MobInfo.AttackDamage 100
execute store result score $Temp.Health Arena run data get storage arena:temp MobInfo.Health 100

execute store result score $Temp.SummonCount Arena run data get storage arena:temp MobInfo.SummonCount 100
execute store result score $Temp.Speed Arena run data get storage arena:temp MobInfo.Speed 100

# AttributesMultipleの値で掛け算 
scoreboard players operation $Temp.AttackDamage Arena *= $Temp.AttributesMultiple Arena
scoreboard players operation $Temp.Health Arena *= $Temp.AttributesMultiple Arena

scoreboard players operation $Temp.AttackDamage Arena /= #100 Arena
scoreboard players operation $Temp.Health Arena /= #100 Arena

# 速度値は低めの倍率で掛け算, 大きくなりすぎたら上限値に設定
execute store result score $Temp.AttributesMultiple Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -2
scoreboard players add $Temp.AttributesMultiple Arena 100

scoreboard players operation $Temp.Speed Arena *= $Temp.AttributesMultiple Arena
scoreboard players operation $Temp.Speed Arena /= #100 Arena

execute if score $Temp.Speed Arena matches 30.. run scoreboard players set $Temp.Speed Arena 30

# storageに適応
execute store result storage arena:temp MobInfo.AttackDamage double 0.01 run scoreboard players get $Temp.AttackDamage Arena
execute store result storage arena:temp MobInfo.Speed double 0.01 run scoreboard players get $Temp.Speed Arena
execute store result storage arena:temp MobInfo.Health double 0.01 run scoreboard players get $Temp.Health Arena

