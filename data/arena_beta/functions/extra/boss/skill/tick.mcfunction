# スキルの発動
    # 共通
    execute store result score $Boss.Health Arena run bossbar get arena_beta:extra_boss value
    
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillNotice Arena positioned ~ ~-0.25 ~ run function arena:endless/boss/skill/tp_notice
    execute if score $Boss.SkillTimer Arena = $Boss.SkillNotice Arena run playsound block.beacon.deactivate master @a ~ ~ ~ 1 0.75

    # シールド演出
    execute as @e[tag=Arena.Boss.Shield] at @s run tp @s ~ ~-0.33 ~
    execute as @e[tag=Arena.Boss.Shield] at @s unless entity @e[tag=Arena.LastBoss,distance=..3] run kill @s

    execute at @e[tag=Arena.Boss.Shield.X] align x run particle enchanted_hit ~ ~ ~ 0.4 0 0 0 20
    execute at @e[tag=Arena.Boss.Shield.Z] align z run particle enchanted_hit ~ ~ ~ 0 0 0.4 0 20
    
    # スキルの発動処理
    function arena_beta:extra/boss/skill/normal/tick

    # 自動回復スキル
    execute if score $Boss.HealCooldown Arena matches 1.. run scoreboard players remove $Boss.HealCooldown Arena 1
    execute store result score $BossHealth Arena.Temp run bossbar get arena_beta:extra_boss value
    #execute if score $Boss.HealCooldown Arena matches 0 if score $Bosshealth Arena.Temp matches ..500 run function arena_beta:extra/boss/skill/huge_heal

    # 一定時間攻撃受けないと高速回復
    execute if score $Boss.LastAttackedTime Arena matches 0.. run scoreboard players add $Boss.LastAttackedTime Arena 1
    #execute if score $Boss.LastAttackedTime Arena matches 1200.. run function arena_beta:extra/boss/skill/mini_heal
