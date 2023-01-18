# 入場可否判定
data modify storage arena:temp Enterable set value true

    # 5人以上いる場合はエラー
    execute store result score $PlayerCount Arena.Temp at @e[tag=Arena.Entrance,sort=nearest,limit=1] if entity @a[distance=..3.5]

    execute unless score $PlayerCount Arena.Temp matches ..4 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..3.5] {"text":"プレイヤーが多すぎます！ 枠内に4人以下の状態で再度押してください。"}
    execute unless score $PlayerCount Arena.Temp matches ..4 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run playsound entity.experience_orb.pickup master @a[distance=..3.5] ~ ~ ~ 1 0.5

    execute unless score $PlayerCount Arena.Temp matches ..4 run data modify storage arena:temp Enterable set value false

    # 同じArenaスコアを持つ人がいる(このアリーナがプレイ中である)場合にエラー
    execute if score $PlayerCount Arena.Temp matches ..4 as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena run data modify storage arena:temp Enterable set value false

execute if data storage arena:temp {Enterable:true} at @e[tag=Arena.Entrance,sort=nearest,limit=1] as @a[distance=..3.5] run function arena_beta:enter/success
execute if data storage arena:temp {Enterable:false} at @e[tag=Arena.Entrance,sort=nearest,limit=1] as @a[distance=..3.5] run function arena:enter/failed
