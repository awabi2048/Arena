# 全方位に回転してエヴォーカーの牙を出す
    # 召喚地点用のマーカーを召喚
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] run summon marker ~2 ~ ~ {Tags:["Arena.Boss.Skill07.Core","Arena.Boss.Marker"]}
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] run summon marker ~-2 ~ ~ {Tags:["Arena.Boss.Skill07.Core","Arena.Boss.Marker"]}
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] run summon marker ~ ~ ~2 {Tags:["Arena.Boss.Skill07.Core","Arena.Boss.Marker"]}
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] run summon marker ~ ~ ~-2 {Tags:["Arena.Boss.Skill07.Core","Arena.Boss.Marker"]}

    execute if score $Boss.SkillTimer Arena matches 0 as @e[tag=Arena.Boss.Skill07.Core] at @s run tp @s ~ ~ ~ facing entity @e[tag=Arena.Core,sort=nearest,limit=1] eyes

    # 移動
    execute as @e[tag=Arena.Boss.Skill07.Core] at @s rotated ~ 0 run tp @s ^1 ^ ^-0.125 facing entity @e[tag=Arena.Core,sort=nearest,limit=1] eyes

    # 召喚
    execute at @e[tag=Arena.Boss.Skill07.Core] run summon evoker_fangs ~ ~ ~

    # 演出
    execute at @e[tag=Arena.Boss.Skill07.Core] run particle dust_color_transition 0.5 0 1 1 0 0 0 ~ ~1 ~ 0 1 0 1 40
    execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.ender_dragon.hurt master @a ~ ~ ~ 5 0.5

    # 牙が通ったときの処理
    execute at @e[tag=Arena.Boss.Skill07.Core] positioned ~ ~1 ~ as @a[tag=Arena.Player,distance=..1.5] run data modify storage score_damage: Argument set value {Damage:20.00d}
    execute at @e[tag=Arena.Boss.Skill07.Core] positioned ~ ~1 ~ as @a[tag=Arena.Player,distance=..1.5] if data entity @s {HurtTime:0} run function score_damage:api/attack
    execute at @e[tag=Arena.Boss.Skill07.Core] positioned ~ ~1 ~ as @a[tag=Arena.Player,distance=..1.5] run effect give @s slowness 1 1 true

    # マーカーの移動に関する処理
    execute as @e[tag=Arena.Boss.Skill07.Core] at @s unless block ~ ~ ~ air run kill @s

    # ボスの移動制限
    execute if score $Boss.SkillTimer Arena matches 0 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value true
    execute if score $Boss.SkillTimer Arena matches 100 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value false
    