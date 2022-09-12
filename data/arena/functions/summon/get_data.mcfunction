# ストレージのデータ読み込み
execute store result score $Temp.MobType Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
execute if score $Temp.Wave Arena matches ..-1 run scoreboard players set $Temp.Wave Arena 5

# MobTypeで絞り込み
execute if score $Temp.MobType Arena matches 0 run data modify storage arena: Temp.MobInfo set from storage arena: Core.MobInfo.Zombie
execute if score $Temp.MobType Arena matches 1 run data modify storage arena: Temp.MobInfo set from storage arena: Core.MobInfo.Skeleton
execute if score $Temp.MobType Arena matches 2 run data modify storage arena: Temp.MobInfo set from storage arena: Core.MobInfo.Blaze
execute if score $Temp.MobType Arena matches 3 run data modify storage arena: Temp.MobInfo set from storage arena: Core.MobInfo.Spider
execute if score $Temp.MobType Arena matches 4 run data modify storage arena: Temp.MobInfo set from storage arena: Core.MobInfo.Slime
execute if score $Temp.MobType Arena matches 5 run data modify storage arena: Temp.MobInfo set from storage arena: Core.MobInfo.Creeper
execute if score $Temp.MobType Arena matches 6 run data modify storage arena: Temp.MobInfo set from storage arena: Core.MobInfo.Guardian

# Wave数で絞り込み
execute if score $Temp.Wave Arena matches 1 run data modify storage arena: Temp.MobInfo.SummonCount set from storage arena: Temp.MobInfo.SummonCount[0]
execute if score $Temp.Wave Arena matches 1 run data modify storage arena: Temp.MobInfo.AttackDamage set from storage arena: Temp.MobInfo.AttackDamage[0]
execute if score $Temp.Wave Arena matches 1 run data modify storage arena: Temp.MobInfo.Health set from storage arena: Temp.MobInfo.Health[0]
execute if score $Temp.Wave Arena matches 1 run data modify storage arena: Temp.MobInfo.Speed set from storage arena: Temp.MobInfo.Speed[0]

execute if score $Temp.Wave Arena matches 2 run data modify storage arena: Temp.MobInfo.SummonCount set from storage arena: Temp.MobInfo.SummonCount[1]
execute if score $Temp.Wave Arena matches 2 run data modify storage arena: Temp.MobInfo.AttackDamage set from storage arena: Temp.MobInfo.AttackDamage[1]
execute if score $Temp.Wave Arena matches 2 run data modify storage arena: Temp.MobInfo.Health set from storage arena: Temp.MobInfo.Health[1]
execute if score $Temp.Wave Arena matches 2 run data modify storage arena: Temp.MobInfo.Speed set from storage arena: Temp.MobInfo.Speed[1]

execute if score $Temp.Wave Arena matches 3 run data modify storage arena: Temp.MobInfo.SummonCount set from storage arena: Temp.MobInfo.SummonCount[2]
execute if score $Temp.Wave Arena matches 3 run data modify storage arena: Temp.MobInfo.AttackDamage set from storage arena: Temp.MobInfo.AttackDamage[2]
execute if score $Temp.Wave Arena matches 3 run data modify storage arena: Temp.MobInfo.Health set from storage arena: Temp.MobInfo.Health[2]
execute if score $Temp.Wave Arena matches 3 run data modify storage arena: Temp.MobInfo.Speed set from storage arena: Temp.MobInfo.Speed[2]

execute if score $Temp.Wave Arena matches 4 run data modify storage arena: Temp.MobInfo.SummonCount set from storage arena: Temp.MobInfo.SummonCount[3]
execute if score $Temp.Wave Arena matches 4 run data modify storage arena: Temp.MobInfo.AttackDamage set from storage arena: Temp.MobInfo.AttackDamage[3]
execute if score $Temp.Wave Arena matches 4 run data modify storage arena: Temp.MobInfo.Health set from storage arena: Temp.MobInfo.Health[3]
execute if score $Temp.Wave Arena matches 4 run data modify storage arena: Temp.MobInfo.Speed set from storage arena: Temp.MobInfo.Speed[3]

execute if score $Temp.Wave Arena matches 5 run data modify storage arena: Temp.MobInfo.SummonCount set from storage arena: Temp.MobInfo.SummonCount[4]
execute if score $Temp.Wave Arena matches 5 run data modify storage arena: Temp.MobInfo.AttackDamage set from storage arena: Temp.MobInfo.AttackDamage[4]
execute if score $Temp.Wave Arena matches 5 run data modify storage arena: Temp.MobInfo.Health set from storage arena: Temp.MobInfo.Health[4]
execute if score $Temp.Wave Arena matches 5 run data modify storage arena: Temp.MobInfo.Speed set from storage arena: Temp.MobInfo.Speed[4]

# 固有データ読み込み
    # クリーパー: ExplosionRadius
    execute if score $Temp.MobType Arena matches 5 if score $Temp.Wave Arena matches 1 run data modify storage arena: Temp.MobInfo.ExplosionRadius set from storage arena: Temp.MobInfo.ExplosionRadius[0]
    execute if score $Temp.MobType Arena matches 5 if score $Temp.Wave Arena matches 2 run data modify storage arena: Temp.MobInfo.ExplosionRadius set from storage arena: Temp.MobInfo.ExplosionRadius[1]
    execute if score $Temp.MobType Arena matches 5 if score $Temp.Wave Arena matches 3 run data modify storage arena: Temp.MobInfo.ExplosionRadius set from storage arena: Temp.MobInfo.ExplosionRadius[2]
    execute if score $Temp.MobType Arena matches 5 if score $Temp.Wave Arena matches 4 run data modify storage arena: Temp.MobInfo.ExplosionRadius set from storage arena: Temp.MobInfo.ExplosionRadius[3]
    execute if score $Temp.MobType Arena matches 5 if score $Temp.Wave Arena matches 5 run data modify storage arena: Temp.MobInfo.ExplosionRadius set from storage arena: Temp.MobInfo.ExplosionRadius[4]


# 難易度別にステータス値, 召喚数を倍率
    #Memo:
    #Attributes: movement_speed, attack_damage, max_health
    #Status: ExplosionRadius
    #倍率($Temp.StatusMultiple)は%表記
    execute store result score $Temp.Difficulty Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty

    execute if score $Temp.Difficulty Arena matches 0 run scoreboard players set $Temp.StatusMultiple Arena 100
    execute if score $Temp.Difficulty Arena matches 1 run scoreboard players set $Temp.StatusMultiple Arena 200
    execute if score $Temp.Difficulty Arena matches 2 run scoreboard players set $Temp.StatusMultiple Arena 400

    execute store result score $Temp.AttackDamage Arena run data get storage arena: Temp.MobInfo.AttackDamage 100
    execute store result score $Temp.Health Arena run data get storage arena: Temp.MobInfo.Health 100
    execute store result score $Temp.Speed Arena run data get storage arena: Temp.MobInfo.Speed 100

    execute store result score $Temp.ExplosionRadius Arena run data get storage arena: Temp.MobInfo.ExplosionRadius 100


    scoreboard players operation $Temp.AttackDamage Arena *= $Temp.StatusMultiple Arena
    scoreboard players operation $Temp.Health Arena *= $Temp.StatusMultiple Arena
    scoreboard players operation $Temp.Speed Arena *= $Temp.StatusMultiple Arena

    scoreboard players operation $Temp.ExplosionRadius Arena *= $Temp.StatusMultiple Arena


    execute if score $Temp.Speed Arena matches 3000.. run scoreboard players set $Temp.Speed Arena 3000


    execute unless data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Endless:1b}}} store result storage arena: Temp.MobInfo.AttackDamage double 0.0001 run scoreboard players get $Temp.AttackDamage Arena
    execute unless data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Endless:1b}}} store result storage arena: Temp.MobInfo.Health double 0.0001 run scoreboard players get $Temp.Health Arena
    execute unless data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Endless:1b}}} store result storage arena: Temp.MobInfo.Speed double 0.0001 run scoreboard players get $Temp.Speed Arena

    execute unless data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Endless:1b}}} store result storage arena: Temp.MobInfo.ExplosionRadius double 0.0001 run scoreboard players get $Temp.ExplosionRadius Arena

    # 召喚数
    execute store result score $Temp.MobCountMax Arena run data get storage arena: Temp.MobInfo.SummonCount

    execute unless data entity @e[tag=Arena.COre,sort=nearest,limit=1] {data:{Arena:{Endless:1b}}} store result score $Temp.SummonCountMultiple Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty 100
    scoreboard players operation $Temp.SummonCountMultiple Arena /= #2 Arena
    scoreboard players add $Temp.SummonCountMultiple Arena 100
    scoreboard players operation $Temp.MobCountMax Arena *= $Temp.SummonCountMultiple Arena
    scoreboard players operation $Temp.MobCountMax Arena /= #100 Arena
