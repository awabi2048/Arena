# スキルの発動
    # 共通
    execute store result score $Boss.Health Arena run bossbar get arena:boss value
    execute if score $Boss.Health Arena matches 1..500 run function arena:endless/boss/skill/under_half
    
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillNotice Arena positioned ~ ~-0.25 ~ run function arena:endless/boss/skill/tp_notice
    execute if score $Boss.SkillTimer Arena = $Boss.SkillNotice Arena run playsound block.beacon.deactivate master @a ~ ~ ~ 1 0.75

    # シールド演出
    execute as @e[tag=Arena.Boss.Shield] at @s run tp @s ~ ~-0.33 ~
    execute as @e[tag=Arena.Boss.Shield] at @s unless entity @e[tag=Arena.LastBoss,distance=..3] run kill @s

    execute at @e[tag=Arena.Boss.Shield.X] align x run particle enchanted_hit ~ ~ ~ 0.4 0 0 0 20
    execute at @e[tag=Arena.Boss.Shield.Z] align z run particle enchanted_hit ~ ~ ~ 0 0 0.4 0 20
    
    # スキル別で処理
    execute if data storage arena: {Boss:{Skills:[1]}} run function arena:endless/boss/skill/01/_
    execute if data storage arena: {Boss:{Skills:[2]}} as @e[tag=Arena.Boss] run function arena:endless/boss/skill/02/_
    execute if data storage arena: {Boss:{Skills:[3]}} as @e[tag=Arena.Boss] run function arena:endless/boss/skill/03/_
    execute if data storage arena: {Boss:{Skills:[4]}} run function arena:endless/boss/skill/04/_
    execute if data storage arena: {Boss:{Skills:[5]}} run function arena:endless/boss/skill/05/_
    execute if data storage arena: {Boss:{Skills:[6]}} run function arena:endless/boss/skill/06/_
    execute if data storage arena: {Boss:{Skills:[7]}} at @e[tag=Arena.Boss] run function arena:endless/boss/skill/07/_
    execute if data storage arena: {Boss:{Skills:[8]}} run function arena:endless/boss/skill/08/_
    execute if data storage arena: {Boss:{Skills:[9]}} at @e[tag=Arena.Boss] run function arena:endless/boss/skill/09/_
    execute if data storage arena: {Boss:{Skills:[10]}} run function arena:endless/boss/skill/10/_
    execute if data storage arena: {Boss:{Skills:[11]}} run function arena:endless/boss/skill/11/_
    execute if data storage arena: {Boss:{Skills:[12]}} run function arena:endless/boss/skill/12/_
    execute if data storage arena: {Boss:{Skills:[13]}} as @e[tag=Arena.Boss] at @s run function arena:endless/boss/skill/13/_
    execute if data storage arena: {Boss:{Skills:[14]}} as @e[tag=Arena.Boss] at @s run function arena:endless/boss/skill/14/_
    execute if data storage arena: {Boss:{Skills:[15]}} run function arena:endless/boss/skill/15/_

    # 隠しエンドレス用: 自動回復スキル
    execute if score $Boss.HealCooldown Arena matches 1.. run scoreboard players remove $Boss.HealCooldown Arena 1
    execute if data entity @s {data:{Arena:{StageType:HiddenEndless}}} if score $Boss.HealCooldown Arena matches 0 unless data entity @e[tag=Arena.LastBoss,limit=1] {Health:1000f} run function arena:endless/boss/skill/big_heal

    # 隠しエンドレス用: 一定時間攻撃受けないと高速回復
    execute if score $Boss.LastAttackedTime Arena matches 0.. run scoreboard players add $Boss.LastAttackedTime Arena 1
    execute if data entity @s {data:{Arena:{StageType:HiddenEndless}}} if score $Boss.LastAttackedTime Arena matches 300.. run function arena:endless/boss/skill/small_heal
