# ランダムなプレイヤーの地点にボスがテレポート
    # ターゲットを決定してボスを中央に固定
    execute if score $Boss.SkillTimer Arena matches 0 run tag @r[distance=..20,tag=Arena.Player] add Arena.Boss.TpTo
    execute if score $Boss.SkillTimer Arena matches 0 run playsound block.beacon.activate master @a ~ ~ ~ 3 0.8
    execute if score $Boss.SkillTimer Arena matches 0 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 1b

    # ターゲットのいる地点にパーティクル
    execute if score $Boss.SkillTimer Arena matches 0..60 as @e[tag=Arena.Boss] at @s run tp @s ~ ~ ~ facing entity @p[tag=Arena.Boss.TpTo]
    execute if score $Boss.SkillTimer Arena matches 0..60 at @a[tag=Arena.Boss.TpTo] rotated 0 0 run function arena:endless/boss/skill/06/particle

    # 演出
    execute if score $Boss.SkillTimer Arena matches 10 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 0.8
    execute if score $Boss.SkillTimer Arena matches 20 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1
    execute if score $Boss.SkillTimer Arena matches 30 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1.3
    execute if score $Boss.SkillTimer Arena matches 40 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1.8

    execute if score $Boss.SkillTimer Arena matches 60 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 0.5
    execute if score $Boss.SkillTimer Arena matches 61 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 0.75
    execute if score $Boss.SkillTimer Arena matches 62 run playsound entity.enderman.teleport master @a ~ ~ ~ 1 1

    # テレポート
    execute if score $Boss.SkillTimer Arena matches 60 run tp @e[tag=Arena.Boss] @p[tag=Arena.Boss.TpTo]
    execute if score $Boss.SkillTimer Arena matches 60 at @e[tag=Arena.Boss] run particle reverse_portal ~ ~ ~ 0 0 0 0.75 250

    # 後処理
    execute if score $Boss.SkillTimer Arena matches 60 run tag @a remove Arena.Boss.TpTo
    execute if score $Boss.SkillTimer Arena matches 60 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 0b



