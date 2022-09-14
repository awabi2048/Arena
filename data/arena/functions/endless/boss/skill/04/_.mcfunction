# プレイヤーのいる地点に柱召喚、一定時間後に近くにいればウィザー効果
    # 演出
    execute if score $Boss.SkillTimer Arena matches 0 run particle ash ~ ~3 ~ 5 0 5 1 300

    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.enderman.teleport master @a ~ ~ ~ 3 2
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.enderman.teleport master @a ~ ~ ~ 3 0.5
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.shulker.shoot master @a ~ ~ ~ 3 2

    execute if score $Boss.SkillTimer Arena matches 20..60 at @e[tag=Arena.Boss.WitherPillar] run particle dust 0 0 0 1 ~ ~ ~ 0.125 3 0.125 1 200
    execute if score $Boss.SkillTimer Arena matches 20..60 at @e[tag=Arena.Boss.WitherPillar] run particle falling_obsidian_tear ~ ~ ~ 0 3 0 0 100

    # 基準マーカー召喚
    execute if score $Boss.SkillTimer Arena matches 20 at @a[tag=Arena.Player,distance=..20] run summon marker ~ ~ ~ {Tags:["Arena.Boss.WitherPillar","Arena.Boss.Marker"]}

    # 効果発動
    execute if score $Boss.SkillTimer Arena matches 60 at @e[tag=Arena.Boss.WitherPillar] run effect give @a[distance=..4] wither 3 2 true
    execute if score $Boss.SkillTimer Arena matches 60 at @e[tag=Arena.Boss.WitherPillar] run particle explosion ~ ~ ~ 0 0 0 1 5
    execute if score $Boss.SkillTimer Arena matches 60 at @e[tag=Arena.Boss.WitherPillar] run playsound entity.wither.break_block master @a ~ ~ ~ 0.5 0.8

    execute if score $Boss.SkillTimer Arena matches 60 run kill @e[tag=Arena.Boss.WitherPillar]

