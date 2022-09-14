# エンドレス
    # 各ボスの召喚判定
    execute store result score $Temp.BossSummon Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1
    execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run scoreboard players operation $Temp.Wave Arena *= #-1 Arena

    scoreboard players operation $Temp.BossSummon Arena %= #10 Arena
    execute store success score $Temp.BossSummon Arena if score $Temp.BossSummon Arena matches 0
    execute unless score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run scoreboard players set $Temp.BossSummon Arena 0

    # 召喚
    execute if score $Temp.BossSummon Arena matches 1 unless score $Temp.Wave Arena matches 50 unless score $Temp.Wave Arena matches 100 run function arena:endless/mini_boss/summon
    execute if score $Temp.BossSummon Arena matches 1 if score $Temp.Wave Arena matches 50 run function arena:endless/mid_boss/summon
    execute if score $Temp.BossSummon Arena matches 1 if score $Temp.Wave Arena matches 100 run function arena:endless/boss/summon

# 通常アリーナ
    # ストレージからデータ取得
    execute store result score $Temp.MobType Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType
    execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave

    execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run scoreboard players set $Temp.Wave Arena 5
    function arena:summon/get_data

        # 召喚場所を指定
        execute if score $Temp.MobType Arena matches 1..4 run scoreboard players set $Temp.SummonPoint Arena 1
        execute unless score $Temp.MobType Arena matches 1..4 run scoreboard players set $Temp.SummonPoint Arena 2
        execute if score $Temp.MobType Arena matches 6 run scoreboard players set $Temp.SummonPoint Arena 1

    # 召喚場所別でループで召喚
    #Memo: Arena.SummonPointは手前、Arena.SummonPoint2は奥側
    execute if score $Temp.BossSummon Arena matches 0 if score $Temp.SummonPoint Arena matches 1 at @e[tag=Arena.SummonPoint,sort=nearest,limit=4] run function arena:summon/loop
    execute if score $Temp.BossSummon Arena matches 0 if score $Temp.SummonPoint Arena matches 2 at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] run function arena:summon/loop

    # 一体だけ召喚するモブを召喚
    execute if score $Temp.BossSummon Arena matches 0 as @e[tag=Arena.SummonPoint,sort=nearest,limit=4] if score $Temp.MobType Arena matches 6 if score $Temp.Wave Arena matches 3..5 at @s run summon elder_guardian ~ ~ ~ {Attributes:[{Name:"generic.max_health",Base:1},{Name:"generic.movement_speed",Base:0.1},{Name:"generic.attack_damage",Base:1}],Tags:["Arena.Mob","Arena.Summoned"]}

    # ストレージのデータをモブの Attributes に適応
    execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run function arena:endless/attributes_multiple
    execute if score $Temp.BossSummon Arena matches 0 run function arena:summon/set_attributes

tag @e[tag=Arena.Summoned] remove Arena.Summoned
