# 通常アリーナ
    # ストレージからデータ取得
    function arena:summon/get_data

    # 召喚場所を設定
    execute if score $MobType Arena.Temp matches 1..4 run data modify storage arena:temp SummonPoint set value 1b
    execute unless score $MobType Arena.Temp matches 1..4 run data modify storage arena:temp SummonPoint set value 2b
    execute if score $MobType Arena.Temp matches 6 run data modify storage arena:temp SummonPoint set value 1b

    # 召喚場所別でループで召喚
    #Memo: Arena.SummonPointは手前、Arena.SummonPoint2は奥側
    execute if data storage arena:temp {SummonPoint:1b} at @e[tag=Arena.SummonPoint,sort=nearest,limit=4] run function arena:summon/loop
    execute if data storage arena:temp {SummonPoint:2b} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] run function arena:summon/loop

    # 一体だけ召喚するモブを召喚
    execute as @e[tag=Arena.SummonPoint,sort=nearest,limit=4] if score $MobType Arena.Temp matches 6 if score $Wave Arena.Temp matches 3..5 at @s run summon elder_guardian ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}

    # ストレージのデータをモブの Attributes に移動
    execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches ..-1 run function arena:endless/attributes_multiple
    function arena:summon/set_attributes

tag @e[tag=Arena.Summoned] remove Arena.Summoned
