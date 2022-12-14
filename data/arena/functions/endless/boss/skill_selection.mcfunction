# 乱数で発動スキルを決定

    # storageリセット
    data modify storage arena: Boss.Skills set value []

    # 抽選
    function arena:rng
    execute if data entity @s {data:{Arena:{Wave:-100}}} run scoreboard players operation $Random Arena %= #16 Arena
    execute if data entity @s {data:{Arena:{Wave:-50}}} run scoreboard players operation $Random Arena %= #9 Arena
    scoreboard players add $Random Arena 1

    execute store result storage arena:temp Random int 1 run scoreboard players get $Random Arena
    data modify storage arena: Boss.Skills append from storage arena:temp Random

    # ラスボスの場合はもう一つ抽選
    function arena:rng
    scoreboard players operation $Random Arena %= #16 Arena
    scoreboard players add $Random Arena 1

    execute store result storage arena:temp Random int 1 run scoreboard players get $Random Arena
    execute if data entity @s {data:{Arena:{Wave:-100}}} run data modify storage arena: Boss.Skills append from storage arena:temp Random

    # モブ召喚系スキルの場合特定条件下で再抽選
    execute if data storage arena: {Boss:{Skills:[1]}} if entity @e[tag=Arena.Boss.Skill01] run function arena:endless/boss/skill_selection 
    execute if data storage arena: {Boss:{Skills:[12]}} if entity @e[tag=Arena.Boss.Phantom] run function arena:endless/boss/skill_selection 
    execute if data storage arena: {Boss:{Skills:[15]}} if entity @e[tag=Arena.MiniBoss] run function arena:endless/boss/skill_selection 

    data remove storage arena:temp Random

    # デバッグ用
    execute unless data storage arena: {Debug:{SetSkill:none}} if data storage arena: Debug.SetSkill run data remove storage arena: Boss.Skills
    execute unless data storage arena: {Debug:{SetSkill:none}} if data storage arena: Debug.SetSkill run data modify storage arena: Boss.Skills append from storage arena: Debug.SetSkill 

# ボスのHPをチェック、一定以下ならスキル発動加速
    # ラスボス
    execute store result score $Boss.Health Arena run bossbar get arena:boss value

    execute if score $Boss.Health Arena matches 667..1000 run scoreboard players set $Boss.SkillInterval Arena 250
    execute if score $Boss.Health Arena matches 334..666 run scoreboard players set $Boss.SkillInterval Arena 150
    execute if score $Boss.Health Arena matches 1..334 run scoreboard players set $Boss.SkillInterval Arena 120

    # 中ボス
    scoreboard players reset $Boss.Health Arena
    execute store result score $Boss.Health Arena run bossbar get arena:mid_boss value

    execute if score $Boss.Health Arena matches 401..800 run scoreboard players set $Boss.SkillInterval Arena 300
    execute if score $Boss.Health Arena matches 1..400 run scoreboard players set $Boss.SkillInterval Arena 200
    
    # スキル発動予備動作のタイマー設定
    scoreboard players operation $Boss.SkillNotice Arena = $Boss.SkillInterval Arena
    scoreboard players remove $Boss.SkillNotice Arena 50
