# APあるか判定
    # AP不足
    execute if score @s arena matches 0 run tellraw @s [{"text": "アリーナポイントが不足していたため、入場できませんでした","color": "red"}]
    execute if score @s arena matches 0 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
    execute if score @s arena matches 0 run function arena:stop_process

    # APあり
    tag @s add Arena.Player
    scoreboard players set @s Arena 0

    scoreboard players remove @s arena 1

# APが足りれば入場
scoreboard players set @s Arena 99

    # リセット
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} at @s run function arena_beta:reset

    # tp, 通知
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} run tp @a[tag=Arena.Player,distance=..3.5] @s
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 5 2
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} at @s run tellraw @a[tag=Arena.Player,distance=..20] {"text":"本アリーナはβ段階です。不具合等を発見された場合はリクエストチケットにてご報告ください。","color":"aqua"}


