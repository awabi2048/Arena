# APあるか判定
    # AP不足
    execute as @a[distance=..3.5] unless score @s arena matches 1.. run tellraw @s [{"text": "アリーナポイントが不足していたため、入場できませんでした","color": "red"}]
    execute as @a[distance=..3.5] unless score @s arena matches 1.. run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

    # APあり
    execute as @a[distance=..3.5] if score @s arena matches 1.. run tag @s add Arena.Player
    execute as @a[distance=..3.5] if score @s arena matches 1.. run scoreboard players set @s Arena 0

    scoreboard players remove @a[tag=Arena.Player,scores={Arena=0}] arena 1

# APが足りれば入場
scoreboard players operation @a[tag=Arena.Player,scores={Arena=0}] Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena

    # 裏エンドレス用に人数カウント
    execute store result score $Temp.PlayerCount Arena if entity @a[distance=..3.5]

    # リセットして看板設置, 
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s run function arena:reset
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s positioned ~ ~1 ~2 run function arena:click_sign

    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s unless data entity @s {data:{Arena:{StageType:Endless}}} run summon armor_stand ~ ~ ~ {Tags:["Arena.Timer"],Marker:1b,Invisible:1b,Silent:1b}

    # TPしてから
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena run tp @a[tag=Arena.Player,distance=..3.5] @s
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s run playsound entity.experience_orb.pickup master @a ~ ~ ~ 5 2
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s if data entity @s {data:{Arena:{StageType:Normal}}} run tellraw @a[tag=Arena.Player,distance=..20] {"text":"看板を右クリックでモブの種類を、素手でシフト右クリックで難易度を変更できます","color":"aqua"}
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s as @a[distance=..20] unless score @s Arena.MaxStageReached matches 1.. run scoreboard players set @s Arena.MaxStageReached 0
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena if data entity @s {data:{Arena:{StageType:HiddenEndless}}} run data modify entity @s data.Arena.StageType set value "Endless"
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s if data entity @s {data:{Arena:{StageType:Endless}}} if score $Temp.PlayerCount Arena matches 1 if entity @p[advancements={arena:display/endless/solo_clear=true}] run scoreboard objectives add Arena.PlayHiddenStage trigger
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s if data entity @s {data:{Arena:{StageType:Endless}}} if score $Temp.PlayerCount Arena matches 1 if entity @p[advancements={arena:display/endless/solo_clear=true}] run scoreboard players enable @p[tag=Arena.Player] Arena.PlayHiddenStage
    execute as @e[tag=Arena.Core] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena at @s if data entity @s {data:{Arena:{StageType:Endless}}} if score $Temp.PlayerCount Arena matches 1 if entity @p[advancements={arena:display/endless/solo_clear=true}] run tellraw @p[tag=Arena.Player] [{"text":"＊エンドレスアリーナ 隠しステージに進みますか？ ","color":"#dc143c","bold": true},{"text":"[クリックして続行]","color":"aqua","clickEvent": {"action": "run_command","value": "/trigger Arena.PlayHiddenStage set 1"}}]
