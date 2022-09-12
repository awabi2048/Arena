#as at エンドレスアリーナのArena.Core
# タイマースコア
execute if entity @e[tag=Arena.Boss] if entity @a[tag=Arena.Player,scores={Arena=-1}] run scoreboard players add $Boss.SkillTimer Arena 1
execute unless entity @a[tag=Arena.Player,scores={Arena=-1}] run function arena:endless/boss/reset

# ボスのHPをチェック、一定以下ならスキル発動加速
    ## Last Boss
    execute store result score $Boss.Health Arena run bossbar get arena:boss value

    execute if score $Boss.Health Arena matches 667..1000 run scoreboard players set $Boss.SkillInterval Arena 250
    execute if score $Boss.Health Arena matches 334..666 run scoreboard players set $Boss.SkillInterval Arena 150
    execute if score $Boss.Health Arena matches 1..334 run scoreboard players set $Boss.SkillInterval Arena 120

    ## Mid Boss
    scoreboard players reset $Boss.Health Arena
    execute store result score $Boss.Health Arena run bossbar get arena:mid_boss value

    execute if score $Boss.Health Arena matches 501..750 run scoreboard players set $Boss.SkillInterval Arena 300
    execute if score $Boss.Health Arena matches 1..500 run scoreboard players set $Boss.SkillInterval Arena 200

# タイマーループ時
    ## スキル再抽選
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena run function arena:endless/boss/skill_selection
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena run tp @e[tag=Arena.Boss] ~ ~-0.25 ~
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 0b
    
    ## 中央付近のプレイヤーにペナルティ
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena as @a[tag=Arena.Player,distance=..4] run particle enchanted_hit ~ ~ ~ 1 1 1 1 100
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena as @a[tag=Arena.Player,distance=..4] run effect give @s levitation 3 1 true
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena as @a[tag=Arena.Player,distance=..4] run effect give @s blindness 4 1 true
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena as @a[tag=Arena.Player,distance=..4] run effect give @s wither 4 2 true

    ## ループ
    execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena run scoreboard players set $Boss.SkillTimer Arena 0

# ボスバー操作
execute store result bossbar arena:boss value run data get entity @e[tag=Arena.LastBoss,limit=1] Health
execute store result bossbar arena:mid_boss value run data get entity @e[tag=Arena.MidBoss,limit=1] Health

execute store result score $Boss.Health Arena run bossbar get arena:boss value
execute if score $Boss.Health Arena matches 667..1000 run bossbar set arena:boss color white
execute if score $Boss.Health Arena matches 334..666 run bossbar set arena:boss color yellow
execute if score $Boss.Health Arena matches 1..334 run bossbar set arena:boss color red


    # スキル発動
        ## 共通
        execute if score $Boss.SkillTimer Arena matches 0.. if score $Boss.Health Arena matches 1..500 run function arena:endless/boss/skill/under-half
        
        scoreboard players operation $Boss.SkillNotice Arena = $Boss.SkillInterval Arena
        scoreboard players remove $Boss.SkillNotice Arena 50
        execute if score $Boss.SkillTimer Arena >= $Boss.SkillNotice Arena positioned ~ ~-0.25 ~ run function arena:endless/boss/skill/tp_notice
        execute if score $Boss.SkillTimer Arena = $Boss.SkillNotice Arena run playsound block.beacon.deactivate master @a ~ ~ ~ 1 0.75

        ## シールド演出
        execute as @e[tag=Arena.Boss.Shield] at @s run tp @s ~ ~-0.33 ~
        execute as @e[tag=Arena.Boss.Shield] at @s unless entity @e[tag=Arena.LastBoss,distance=..3] run kill @s

        execute at @e[tag=Arena.Boss.Shield.X] run particle enchanted_hit ~ ~ ~ 0.4 0 0 0 20
        execute at @e[tag=Arena.Boss.Shield.Z] align z run particle enchanted_hit ~ ~ ~ 0 0 0.4 0 20

        ## スキル [01]
        execute at @e[tag=Arena.Boss.Skill01.01] run particle dust 1 0 0 1 ~ ~ ~ 0.25 0 0.25 0.5 2
        execute at @e[tag=Arena.Boss.Skill01.02] run particle dust 1 0.5 0 1 ~ ~ ~ 0.25 0 0.25 0.5 2
        execute at @e[tag=Arena.Boss.Skill01.03] run particle dust 1 1 0 1 ~ ~ ~ 0.25 0 0.25 0.5 2
        execute at @e[tag=Arena.Boss.Skill01.04] run particle dust 0.5 1 0 1 ~ ~ ~ 0.25 0 0.25 0.5 2

        execute at @e[tag=Arena.Boss.Skill01.05] run particle dust 0 1 0 1 ~ ~ ~ 0.25 0 0.25 0.5 2
        execute at @e[tag=Arena.Boss.Skill01.06] run particle dust 0 1 1 1 ~ ~ ~ 0.25 0 0.25 0.5 2
        execute at @e[tag=Arena.Boss.Skill01.07] run particle dust 0 0.5 1 1 ~ ~ ~ 0.25 0 0.25 0.5 2
        execute at @e[tag=Arena.Boss.Skill01.08] run particle dust 0 0 1 1 ~ ~ ~ 0.25 0 0.25 0.5 2
        execute if score $Boss.Skill Arena matches 0 run function arena:endless/boss/skill/01/_
        
        ## スキル [01以外]
        execute if score $Boss.Skill Arena matches 1..2 as @e[tag=Arena.Boss] run function arena:endless/boss/skill/02/_
        execute if score $Boss.Skill Arena matches 2..3 as @e[tag=Arena.Boss] run function arena:endless/boss/skill/03/_
        execute if score $Boss.Skill Arena matches 3..4 run function arena:endless/boss/skill/04/_
        execute if score $Boss.Skill Arena matches 4..5 run function arena:endless/boss/skill/05/_
        execute if score $Boss.Skill Arena matches 5..6 run function arena:endless/boss/skill/06/_
        execute if score $Boss.Skill Arena matches 6..7 at @e[tag=Arena.Boss] run function arena:endless/boss/skill/07/_
        execute if score $Boss.Skill Arena matches 7..8 run function arena:endless/boss/skill/08/_
        execute if score $Boss.Skill Arena matches 8..9 at @e[tag=Arena.Boss] run function arena:endless/boss/skill/09/_
        execute if score $Boss.Skill Arena matches 9..10 run function arena:endless/boss/skill/10/_
        execute if score $Boss.Skill Arena matches 10..11 run function arena:endless/boss/skill/11/_
        execute if score $Boss.Skill Arena matches 11..12 run function arena:endless/boss/skill/12/_
        execute if score $Boss.Skill Arena matches 12..13 as @e[tag=Arena.Boss] at @s run function arena:endless/boss/skill/13/_
        execute if score $Boss.Skill Arena matches 13..14 as @e[tag=Arena.Boss] at @s run function arena:endless/boss/skill/14/_
        execute if score $Boss.Skill Arena matches 15 run function arena:endless/boss/skill/15/_
        
    