# APあるか判定
    # AP不足
    execute as @a[distance=..3.5] unless score @s arena matches 1.. run tellraw @s [{"text":"[","color": "white"},{"text":"Arena","color": "red"},{"text":"] ","color": "white"},{"text": "アリーナポイントが不足していたため、入場できませんでした","color": "red"}]
    execute as @a[distance=..3.5] unless score @s arena matches 1.. run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    # APあり
    execute as @a[distance=..3.5] if score @s arena matches 1.. run tag @s add Arena.Player
    execute as @a[distance=..3.5] if score @s arena matches 1.. run scoreboard players set @s Arena 0

    scoreboard players remove @a[tag=Arena.Player,scores={Arena=0},tag=!Arena.Debug] arena 1

# APが足りれば入場
scoreboard players operation @a[tag=Arena.Player,scores={Arena=0}] Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena

    # リセットして看板設置
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s run function arena:reset
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s if data entity @s {data:{Arena:{StageType:Normal}}} positioned ~ ~1 ~2 run function arena:click_sign

    # TPしてから
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena run tp @a[tag=Arena.Player,distance=..3.5] @s
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 5 2
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s if data entity @s {data:{Arena:{StageType:Normal}}} run tellraw @a[tag=Arena.Player,distance=..20] [{"text":"[","color": "white"},{"text":"Arena","color": "red"},{"text":"] ","color": "white"},{"text":"看板を右クリックでモブの種類を、\n素手でシフト右クリックで難易度を変更できます","color":"yellow"}]

