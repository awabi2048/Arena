# 最寄りのプレイヤーに向けてエヴォーカーの牙を出す
    # 最寄りのプレイヤーの方を向く
    execute as @e[tag=Arena.Boss] at @s run tp @s ~ ~ ~ facing entity @p[tag=Arena.Player]

    # 召喚地点用のマーカーを召喚, 向きを揃える
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] rotated ~ 0 run summon marker ^ ^ ^1 {Tags:["Arena.Boss.Fang","Arena.Boss.Marker"]}
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] rotated ~15 0 run summon marker ^ ^ ^1 {Tags:["Arena.Boss.Fang","Arena.Boss.Marker"]}
    execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] rotated ~-15 0 run summon marker ^ ^ ^1 {Tags:["Arena.Boss.Fang","Arena.Boss.Marker"]}

    execute if score $Boss.SkillTimer Arena matches 0 as @e[tag=Arena.Boss.Fang] at @s run tp @s ~ ~ ~ facing entity @e[tag=Arena.Boss,limit=1]

    # 召喚
    execute at @e[tag=Arena.Boss.Fang] run summon evoker_fangs ~ ~ ~

    execute at @e[tag=Arena.Boss.Fang] run particle dust_color_transition 0.5 0 1 1 0 0 0 ~ ~1 ~ 0 1 0 1 40

    # 牙が通ったときの処理
    execute at @e[tag=Arena.Boss.Fang] positioned ~ ~1.5 ~ run effect give @a[tag=Arena.Player,distance=..1.5] weakness 2 1 true
    execute at @e[tag=Arena.Boss.Fang] positioned ~ ~1.5 ~ run effect give @a[tag=Arena.Player,distance=..1.5] poison 3 1 true
    execute at @e[tag=Arena.Boss.Fang] positioned ~ ~1.5 ~ run effect give @a[tag=Arena.Player,distance=..1.5] instant_damage 1 1 true

    # マーカーの移動に関する処理
    execute as @e[tag=Arena.Boss.Fang] at @s unless block ~ ~ ~ air run kill @s
    execute as @e[tag=Arena.Boss.Fang] at @s run tp @s ^ ^ ^-0.5

