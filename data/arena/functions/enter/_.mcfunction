# 入場可否判定
data modify storage arena:temp Enterable set value true

    # 5人以上いる場合はエラー
    execute store result score $Temp.PlayerCount Arena at @e[tag=Arena.Entrance,sort=nearest,limit=1] if entity @a[distance=..3.5]
    execute unless score $Temp.PlayerCount Arena matches ..4 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run tellraw @a[distance=..3.5] [{"text":"[","color": "white"},{"text":"Arena","color": "red"},{"text":"] ","color": "white"},{"text":"プレイヤーが多すぎます！ 枠内のプレイヤーを4人以下にした状態で再度ボタンを押してください。"}]
    execute unless score $Temp.PlayerCount Arena matches ..4 at @e[tag=Arena.Entrance,sort=nearest,limit=1] run playsound entity.experience_orb.pickup master @a[distance=..3.5] ~ ~ ~ 1 0.5
    execute unless score $Temp.PlayerCount Arena matches ..4 run data modify storage arena:temp Enterable set value false

    # 同じArenaスコアを持つ人がいる(このアリーナがプレイ中でる)場合にエラー
    execute if score $Temp.PlayerCount Arena matches ..4 as @a[tag=Arena.Player] if score @s Arena = @e[tag=Arena.Entrance,sort=nearest,limit=1] Arena run data modify storage arena:temp Enterable set value false

execute if data storage arena:temp {Enterable:true} at @e[tag=Arena.Entrance,sort=nearest,limit=1] run function arena:enter/success
execute if data storage arena:temp {Enterable:false} at @e[tag=Arena.Entrance,sort=nearest,limit=1] run function arena:enter/failed
