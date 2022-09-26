# 火の玉を飛ばす
    # 演出
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.experience_orb.pickup master @a ~ ~ ~ 3 0.5
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.ender_dragon.hurt master @a ~ ~ ~ 3 0.75

    execute if score $Boss.SkillTimer Arena matches 40 run playsound entity.ender_dragon.ambient master @a ~ ~ ~ 3 1

    # ターゲット決定
    execute if score $Boss.SkillTimer Arena matches 0 run tag @r[tag=Arena.Player,distance=..20] add Arena.Boss.FireballTarget

    # ボス中央に固定
    execute if score $Boss.SkillTimer Arena matches 0 run data modify entity @e[tag=Arena.LastBoss,limit=1] NoAI set value 1b

    # 火の玉を召喚, Motionに適当な値を設定して飛ばす
    execute if score $Boss.SkillTimer Arena matches 0 run summon fireball ~ ~2 ~ {Tags:["Arena.Boss.Fireball","Arena.Boss.Marker"]}
    execute if score $Boss.SkillTimer Arena matches 0..40 as @e[tag=Arena.Boss] at @s run tp @s ~ ~ ~ facing entity @p[tag=Arena.Boss.FireballTarget]

    execute if score $Boss.SkillTimer Arena matches 40 run function arena:endless/boss/skill/normal/14/set_motion

    # タグ除去
    execute if score $Boss.SkillTimer Arena matches 40 run tag @a[tag=Arena.Player] remove Arena.Boss.FireballTarget

    # 固定解除
    execute if score $Boss.SkillTimer Arena matches 40 run data modify entity @e[tag=Arena.LastBoss,limit=1] NoAI set value 0b