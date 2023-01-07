# APあるか判定
    # AP不足
    execute as @a[distance=..3.5] unless score @s arena matches 1.. run tellraw @s [{"text": "アリーナポイントが不足していたため、入場できませんでした","color": "red"}]
    execute as @a[distance=..3.5] unless score @s arena matches 1.. run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    # APあり
    execute as @a[distance=..3.5] if score @s arena matches 1.. run tag @s add Arena.Player
    execute as @a[distance=..3.5] if score @s arena matches 1.. run scoreboard players set @s Arena 0

    scoreboard players remove @a[tag=Arena.Player,scores={Arena=0}] arena 1

# APが足りれば入場
scoreboard players set @a[tag=Arena.Player,scores={Arena=0}] Arena 99

    # リセット
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} at @s run function arena_beta:reset

    # tp, 通知
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} run tp @a[tag=Arena.Player,distance=..3.5] @s
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 5 2
    execute as @e[tag=Arena.Core] if data entity @s {data:{Arena:{StageType:BetaExtra}}} at @s run tellraw @a[tag=Arena.Player,distance=..20] {"text":"本アリーナはβ段階です。バグ等を発見された場合はDiscord: awabi2048#1001までご連絡ください。","color":"aqua"}
