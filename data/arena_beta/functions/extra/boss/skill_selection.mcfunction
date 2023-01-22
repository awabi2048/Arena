# 乱数で発動スキルを決定
    # storageリセット
    data modify storage arena:boss Skills set value []

    # 抽選
    function arena:rng
    scoreboard players operation $Random Arena %= #13 Arena

    scoreboard players add $Random Arena 1

    execute store result storage arena:temp Random int 1 run scoreboard players get $Random Arena
    data modify storage arena:boss Skills append from storage arena:temp Random

    # モブ召喚系スキルの場合特定条件下で再抽選
    execute if data storage arena:boss {Skills:[1]} if entity @e[tag=Arena.Boss.Skill01] run function arena_beta:extra/boss/skill_selection 
    execute if data storage arena:boss {Skills:[12]} if entity @e[tag=Arena.Boss.Phantom] run function arena_beta:extra/boss/skill_selection

    data remove storage arena:temp Random

    # デバッグ用
    execute unless data storage arena:debug {SetSkill:none} if data storage arena:debug SetSkill run data remove storage arena:boss Skills
    execute unless data storage arena:debug {SetSkill:none} if data storage arena:debug SetSkill run data modify storage arena:boss Skills append from storage arena:debug SetSkill 

# ボスのHPをチェック、一定以下ならスキル発動加速
    # ラスボス
    execute store result score $Boss.Health Arena run bossbar get arena_beta:extra_boss value

    execute if score $Boss.Health Arena matches 667..1000 run scoreboard players set $Boss.SkillInterval Arena 250
    execute if score $Boss.Health Arena matches 334..666 run scoreboard players set $Boss.SkillInterval Arena 150
    execute if score $Boss.Health Arena matches 1..334 run scoreboard players set $Boss.SkillInterval Arena 120

    # スキル発動予備動作のタイマー設定
    scoreboard players operation $Boss.SkillNotice Arena = $Boss.SkillInterval Arena
    scoreboard players remove $Boss.SkillNotice Arena 50
