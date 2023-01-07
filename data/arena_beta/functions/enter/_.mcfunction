# 入場可否判定
scoreboard players set $Temp.Enterable Arena 1

    # 5人以上いる場合はエラー
    execute store result score $Temp.PlayerCount Arena at @e[tag=Arena.Entrance,sort=nearest,limit=1] if entity @a[distance=..3.5]
    execute unless score $Temp.PlayerCount Arena matches ..4 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..3.5] {"text":"プレイヤーが多すぎます！ 枠内に4人以下の状態で再度押してください。"}
    execute unless score $Temp.PlayerCount Arena matches ..4 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run playsound entity.experience_orb.pickup master @a[distance=..3.5] ~ ~ ~ 1 0.5
    execute unless score $Temp.PlayerCount Arena matches ..4 run scoreboard players set $Temp.Enterable Arena -1

    # 同じArenaスコアを持つ人がいない(このアリーナに誰もいない)場合を検出
    execute if score $Temp.PlayerCount Arena matches ..4 store success score $Temp.Enterable Arena as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena unless entity @s

execute if score $Temp.Enterable Arena matches 1 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run function arena_beta:enter/success
execute if score $Temp.Enterable Arena matches 0 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run function arena:enter/failed
