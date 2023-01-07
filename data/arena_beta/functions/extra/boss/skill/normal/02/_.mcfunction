# シュルカー弾をプレイヤーにホーミングさせて飛ばす
    # ボスを中央で固定
    execute if score $Boss.SkillTimer Arena matches 0 run data modify entity @s NoAI set value 1b

    # 演出
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.shulker_bullet.hit master @a ~ ~ ~ 5 0.8
    execute if score $Boss.SkillTimer Arena matches 4 run playsound entity.shulker_bullet.hit master @a ~ ~ ~ 5 0.9
    execute if score $Boss.SkillTimer Arena matches 8 run playsound entity.shulker_bullet.hit master @a ~ ~ ~ 5 1.0
    execute if score $Boss.SkillTimer Arena matches 12 run playsound entity.shulker_bullet.hit master @a ~ ~ ~ 5 1.1
    execute if score $Boss.SkillTimer Arena matches 16 run playsound entity.shulker_bullet.hit master @a ~ ~ ~ 5 1.2
    execute if score $Boss.SkillTimer Arena matches 20 run playsound entity.shulker_bullet.hit master @a ~ ~ ~ 5 1.3

    # 順番に召喚
    execute if score $Boss.SkillTimer Arena matches 40 at @s run summon shulker_bullet ~2 ~2 ~2 {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}
    execute if score $Boss.SkillTimer Arena matches 42 at @s run summon shulker_bullet ~-2 ~2 ~-2 {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}
    execute if score $Boss.SkillTimer Arena matches 44 at @s run summon shulker_bullet ~-2 ~2 ~2 {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}
    execute if score $Boss.SkillTimer Arena matches 46 at @s run summon shulker_bullet ~2 ~2 ~-2 {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}

    execute if score $Boss.SkillTimer Arena matches 48 at @s run summon shulker_bullet ~3 ~2 ~ {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}
    execute if score $Boss.SkillTimer Arena matches 50 at @s run summon shulker_bullet ~-3 ~2 ~ {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}
    execute if score $Boss.SkillTimer Arena matches 52 at @s run summon shulker_bullet ~ ~2 ~3 {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}
    execute if score $Boss.SkillTimer Arena matches 54 at @s run summon shulker_bullet ~ ~2 ~-3 {Tags:["Arena.Boss.ShulkerBullet","Arena.Boss.Marker"],NoGravity:1b}

    # ボス固定解除
    execute if score $Boss.SkillTimer Arena matches 55 run data modify entity @s NoAI set value 0b

    # 弾の処理
    execute if score $Boss.SkillTimer Arena matches 55.. as @e[tag=Arena.Boss.ShulkerBullet] at @s run tp @s ^ ^ ^0.5 facing entity @p[tag=Arena.Player]
    execute at @e[tag=Arena.Boss.ShulkerBullet] run particle enchant ~ ~ ~ 0 0 0 1 3
    execute at @e[tag=Arena.Boss.ShulkerBullet] run particle crit ~ ~ ~ 0 0 0 0 1
    execute at @e[tag=Arena.Boss.ShulkerBullet] run particle enchanted_hit ~ ~ ~ 0 0 0 0.5 1

    execute as @e[tag=Arena.Boss.ShulkerBullet] at @s if entity @a[tag=Arena.Player,distance=..1] run function arena:endless/boss/skill/normal/02/hit

