# ボス召喚
    execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    scoreboard players operation $Wave Arena.Temp %= #5 Arena

    data modify storage arena:temp SummonBoss set value false
    execute if score $Wave Arena.Temp matches 0 run data modify storage arena:temp SummonBoss set value true

    execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    execute if data storage arena:temp {SummonBoss:true} if score $Wave Arena.Temp matches -5 run function arena_beta:extra/mini_boss/summon
    execute if data storage arena:temp {SummonBoss:true} if score $Wave Arena.Temp matches -10 run function arena_beta:extra/boss/summon
    
    # ストレージからデータ取得
    execute store result score $Temp.MobType Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType
    execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

    scoreboard players set $Wave Arena.Temp 5
    scoreboard players set $Temp.SummonCountMultiple Arena 50
    function arena:summon/get_data

        # 召喚場所を指定
        execute if score $Temp.MobType Arena matches 1..4 run data modify storage arena:temp SummonPoint set value 1b
        execute unless score $Temp.MobType Arena matches 1..4 run data modify storage arena:temp SummonPoint set value 2b
        execute if score $Temp.MobType Arena matches 6 run data modify storage arena:temp SummonPoint set value 1b

    # 召喚場所別でループで召喚
    #Memo: Arena.SummonPointは手前、Arena.SummonPoint2は奥側
    execute if data storage arena:temp {SummonBoss:false} if data storage arena:temp {SummonPoint:1b} at @e[tag=Arena.SummonPoint,sort=nearest,limit=4] run function arena:summon/loop
    execute if data storage arena:temp {SummonBoss:false} if data storage arena:temp {SummonPoint:2b} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] run function arena:summon/loop

    # ストレージのデータをモブの Attributes に適応
    function arena_beta:extra/attributes_multiple
    execute if data storage arena:temp {SummonBoss:false} run function arena_beta:summon/set_attributes

tag @e[tag=Arena.Summoned] remove Arena.Summoned
