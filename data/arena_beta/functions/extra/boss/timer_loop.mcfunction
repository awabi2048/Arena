# タイマーループ時処理
    # スキル再抽選, ボス移動
    function arena_beta:extra/boss/skill_selection
    tp @e[tag=Arena.Boss] ~ ~-0.5 ~
    data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 0b

    # 中央付近のプレイヤーにペナルティ
    execute as @a[tag=Arena.Player,distance=..4] run particle enchanted_hit ~ ~ ~ 1 1 1 1 100
    execute as @a[tag=Arena.Player,distance=..4] run effect give @s levitation 3 1 true
    execute as @a[tag=Arena.Player,distance=..4] run effect give @s blindness 4 1 true
    execute as @a[tag=Arena.Player,distance=..4] run effect give @s wither 4 2 true

    # タイマーリセット
    scoreboard players set $Boss.SkillTimer Arena 0

    # 雑多な処理
    data modify entity @e[tag=Arena.Boss,limit=1] Fire set value 0
