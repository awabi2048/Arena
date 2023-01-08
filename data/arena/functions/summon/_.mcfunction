# エンドレス  
    # ボスの召喚
    data modify storage arena:temp Wave set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    data modify storage arena:temp StageType set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType
    execute if data storage arena:temp {SummonBoss:true} unless data storage arena:temp {Wave:-50} unless data storage arena:temp {Wave:-100} run function arena:endless/mini_boss/summon
    execute if data storage arena:temp {SummonBoss:true,Wave:-50} run function arena:endless/mid_boss/summon
    execute if data storage arena:temp {SummonBoss:true,Wave:-100} if data storage arena:temp {StageType:Endless} run function arena:endless/boss/summon
    execute if data storage arena:temp {SummonBoss:true,Wave:-100} if data storage arena:temp {StageType:HiddenEndless} run function arena:endless/boss/hidden/summon

# 通常アリーナ
    # ストレージからデータ取得
    execute store result score $Temp.MobType Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType
    execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

    execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run scoreboard players set $Temp.Wave Arena 5
    function arena:summon/get_data

        # 召喚場所を指定
        execute if score $Temp.MobType Arena matches 1..4 run data modify storage arena:temp SummonPoint set value 1b
        execute unless score $Temp.MobType Arena matches 1..4 run data modify storage arena:temp SummonPoint set value 2b
        execute if score $Temp.MobType Arena matches 6 run data modify storage arena:temp SummonPoint set value 1b

    # 召喚場所別でループで召喚
    #Memo: Arena.SummonPointは手前、Arena.SummonPoint2は奥側
    execute if data storage arena:temp {SummonBoss:false} if data storage arena:temp {SummonPoint:1b} at @e[tag=Arena.SummonPoint,sort=nearest,limit=4] run function arena:summon/loop
    execute if data storage arena:temp {SummonBoss:false} if data storage arena:temp {SummonPoint:2b} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] run function arena:summon/loop

    # 一体だけ召喚するモブを召喚
    execute if data storage arena:temp {SummonBoss:false} as @e[tag=Arena.SummonPoint,sort=nearest,limit=4] if score $Temp.MobType Arena matches 6 if score $Temp.Wave Arena matches 3..5 at @s run summon elder_guardian ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}

    # ストレージのデータをモブの Attributes に適応
    execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run function arena:endless/attributes_multiple
    execute if data storage arena:temp {SummonBoss:false} run function arena:summon/set_attributes

tag @e[tag=Arena.Summoned] remove Arena.Summoned
