# ストレージのデータ読み込み
execute store result score $MobType Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

execute if score $Wave Arena.Temp matches ..-1 run scoreboard players set $Wave Arena.Temp 5

# MobTypeで絞り込み
execute if score $MobType Arena.Temp matches 0 run data modify storage arena:temp MobInfo set from storage arena: Core.MobInfo.Zombie
execute if score $MobType Arena.Temp matches 1 run data modify storage arena:temp MobInfo set from storage arena: Core.MobInfo.Skeleton
execute if score $MobType Arena.Temp matches 2 run data modify storage arena:temp MobInfo set from storage arena: Core.MobInfo.Blaze
execute if score $MobType Arena.Temp matches 3 run data modify storage arena:temp MobInfo set from storage arena: Core.MobInfo.Spider
execute if score $MobType Arena.Temp matches 4 run data modify storage arena:temp MobInfo set from storage arena: Core.MobInfo.Slime
execute if score $MobType Arena.Temp matches 5 run data modify storage arena:temp MobInfo set from storage arena: Core.MobInfo.Creeper
execute if score $MobType Arena.Temp matches 6 run data modify storage arena:temp MobInfo set from storage arena: Core.MobInfo.Guardian

# Wave数で絞り込み
execute if score $Wave Arena.Temp matches 1 run data modify storage arena:temp MobInfo.SummonCount set from storage arena:temp MobInfo.SummonCount[0]
execute if score $Wave Arena.Temp matches 1 run data modify storage arena:temp MobInfo.AttackDamage set from storage arena:temp MobInfo.AttackDamage[0]
execute if score $Wave Arena.Temp matches 1 run data modify storage arena:temp MobInfo.Health set from storage arena:temp MobInfo.Health[0]
execute if score $Wave Arena.Temp matches 1 run data modify storage arena:temp MobInfo.Speed set from storage arena:temp MobInfo.Speed[0]

execute if score $Wave Arena.Temp matches 2 run data modify storage arena:temp MobInfo.SummonCount set from storage arena:temp MobInfo.SummonCount[1]
execute if score $Wave Arena.Temp matches 2 run data modify storage arena:temp MobInfo.AttackDamage set from storage arena:temp MobInfo.AttackDamage[1]
execute if score $Wave Arena.Temp matches 2 run data modify storage arena:temp MobInfo.Health set from storage arena:temp MobInfo.Health[1]
execute if score $Wave Arena.Temp matches 2 run data modify storage arena:temp MobInfo.Speed set from storage arena:temp MobInfo.Speed[1]

execute if score $Wave Arena.Temp matches 3 run data modify storage arena:temp MobInfo.SummonCount set from storage arena:temp MobInfo.SummonCount[2]
execute if score $Wave Arena.Temp matches 3 run data modify storage arena:temp MobInfo.AttackDamage set from storage arena:temp MobInfo.AttackDamage[2]
execute if score $Wave Arena.Temp matches 3 run data modify storage arena:temp MobInfo.Health set from storage arena:temp MobInfo.Health[2]
execute if score $Wave Arena.Temp matches 3 run data modify storage arena:temp MobInfo.Speed set from storage arena:temp MobInfo.Speed[2]

execute if score $Wave Arena.Temp matches 4 run data modify storage arena:temp MobInfo.SummonCount set from storage arena:temp MobInfo.SummonCount[3]
execute if score $Wave Arena.Temp matches 4 run data modify storage arena:temp MobInfo.AttackDamage set from storage arena:temp MobInfo.AttackDamage[3]
execute if score $Wave Arena.Temp matches 4 run data modify storage arena:temp MobInfo.Health set from storage arena:temp MobInfo.Health[3]
execute if score $Wave Arena.Temp matches 4 run data modify storage arena:temp MobInfo.Speed set from storage arena:temp MobInfo.Speed[3]

execute if score $Wave Arena.Temp matches 5 run data modify storage arena:temp MobInfo.SummonCount set from storage arena:temp MobInfo.SummonCount[4]
execute if score $Wave Arena.Temp matches 5 run data modify storage arena:temp MobInfo.AttackDamage set from storage arena:temp MobInfo.AttackDamage[4]
execute if score $Wave Arena.Temp matches 5 run data modify storage arena:temp MobInfo.Health set from storage arena:temp MobInfo.Health[4]
execute if score $Wave Arena.Temp matches 5 run data modify storage arena:temp MobInfo.Speed set from storage arena:temp MobInfo.Speed[4]

# 固有データ読み込み
    # クリーパー: ExplosionRadius
    execute if score $MobType Arena.Temp matches 5 if score $Wave Arena.Temp matches 1 run data modify storage arena:temp MobInfo.ExplosionRadius set from storage arena:temp MobInfo.ExplosionRadius[0]
    execute if score $MobType Arena.Temp matches 5 if score $Wave Arena.Temp matches 2 run data modify storage arena:temp MobInfo.ExplosionRadius set from storage arena:temp MobInfo.ExplosionRadius[1]
    execute if score $MobType Arena.Temp matches 5 if score $Wave Arena.Temp matches 3 run data modify storage arena:temp MobInfo.ExplosionRadius set from storage arena:temp MobInfo.ExplosionRadius[2]
    execute if score $MobType Arena.Temp matches 5 if score $Wave Arena.Temp matches 4 run data modify storage arena:temp MobInfo.ExplosionRadius set from storage arena:temp MobInfo.ExplosionRadius[3]
    execute if score $MobType Arena.Temp matches 5 if score $Wave Arena.Temp matches 5 run data modify storage arena:temp MobInfo.ExplosionRadius set from storage arena:temp MobInfo.ExplosionRadius[4]

# 難易度別にステータス値, 召喚数を倍率
    ##Memo:
    ##Attributes: movement_speed, attack_damage, max_health
    ##Status: ExplosionRadius
    ##倍率($StatusMultiple)は%表記

    # 難易度で倍率を指定
    data modify storage arena:temp Difficulty set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty

    execute if data storage arena:temp {Difficulty:0} run scoreboard players set $StatusMultiple Arena.Temp 100
    execute if data storage arena:temp {Difficulty:1} run scoreboard players set $StatusMultiple Arena.Temp 200
    execute if data storage arena:temp {Difficulty:2} run scoreboard players set $StatusMultiple Arena.Temp 400

    execute if data storage arena:temp {Difficulty:-1} run scoreboard players set $StatusMultiple Arena.Temp 100

    # ストレージから計算用にスコアで取得
    execute store result score $AttackDamage Arena.Temp run data get storage arena:temp MobInfo.AttackDamage 100
    execute store result score $Health Arena.Temp run data get storage arena:temp MobInfo.Health 100
    execute store result score $Speed Arena.Temp run data get storage arena:temp MobInfo.Speed 100

    execute store result score $ExplosionRadius Arena.Temp run data get storage arena:temp MobInfo.ExplosionRadius 100

    # 指定した倍率で各種ステータスを計算
    scoreboard players operation $AttackDamage Arena.Temp *= $StatusMultiple Arena.Temp
    scoreboard players operation $Health Arena.Temp *= $StatusMultiple Arena.Temp
    scoreboard players operation $Speed Arena.Temp *= $StatusMultiple Arena.Temp

    scoreboard players operation $ExplosionRadius Arena.Temp *= $StatusMultiple Arena.Temp


    scoreboard players operation $AttackDamage Arena.Temp /= #100 Arena
    scoreboard players operation $Health Arena.Temp /= #100 Arena
    scoreboard players operation $Speed Arena.Temp /= #100 Arena

    scoreboard players operation $ExplosionRadius Arena.Temp /= #100 Arena

    execute if score $Speed Arena.Temp matches 30.. run scoreboard players set $Speed Arena.Temp 30

    # ストレージに適応
    execute store result storage arena:temp MobInfo.AttackDamage double 0.01 run scoreboard players get $AttackDamage Arena.Temp
    execute store result storage arena:temp MobInfo.Health double 0.01 run scoreboard players get $Health Arena.Temp
    execute store result storage arena:temp MobInfo.Speed double 0.01 run scoreboard players get $Speed Arena.Temp

    execute store result storage arena:temp MobInfo.ExplosionRadius double 0.01 run scoreboard players get $ExplosionRadius Arena.Temp

    # 召喚数の計算
    execute store result score $MobCountMax Arena.Temp run data get storage arena:temp MobInfo.SummonCount

    execute store result score $SummonCountMultiple Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty 100
    execute if score $SummonCountMultiple Arena.Temp matches ..-1 run scoreboard players set $SummonCountMultiple Arena.Temp 100

    scoreboard players operation $SummonCountMultiple Arena.Temp /= #2 Constant
    scoreboard players add $SummonCountMultiple Arena.Temp 100

    scoreboard players operation $MobCountMax Arena.Temp *= $SummonCountMultiple Arena.Temp
    scoreboard players operation $MobCountMax Arena.Temp /= #100 Constant
