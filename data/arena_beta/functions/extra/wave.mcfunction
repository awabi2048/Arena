# 成功処理
    ## 0-5で乱数生成 (MobTypeに適応), ガーディアン除く
    function arena:rng
    scoreboard players operation $Random Arena %= #6 Arena
    execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType int 1 run scoreboard players get $Random Arena

    ## 難易度を無効化
    data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty set value -1

    # タイトル表示と効果音
    execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1

    title @a[tag=Arena.Player,distance=..20] times 10 60 10
    execute if score $Wave Arena.Temp matches 1 run title @a[tag=Arena.Player,distance=..20] title [{"text":"||| ","obfuscated": true},{"text": "Extra Arena","color": "yellow","bold": true,"obfuscated": false},{"text": " |||","obfuscated": true}]

    execute unless score $Wave Arena.Temp matches 1 run title @a[tag=Arena.Player,distance=..20] title " "

    title @a[tag=Arena.Player,distance=..20] subtitle [{"text":"Wave ","color": "gold"},{"score":{"name": "$Wave","objective": "Arena.Temp"},"color": "gold"}]
    playsound entity.experience_orb.pickup master @a[tag=Arena.Player,distance=..20] ~ ~ ~ 1 1.2
    function arena_beta:summon/_

    ## ストラクチャー読み込み
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ air
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,mode:"LOAD",name:"arena:stage-normal"}

    execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:3}}} run data modify block ~ ~-4 ~ name set value "arena:stage-spider"
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:4}}} run data modify block ~ ~-4 ~ name set value "arena:stage-slime"
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:5}}} run data modify block ~ ~-4 ~ name set value "arena:stage-creeper"

    execute at @e[tag=Arena.Core,sort=nearest,limit=1] if data storage arena:temp {SummonBoss:true} run data modify block ~ ~-4 ~ name set value "arena:stage-normal"

    execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ redstone_block
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ stone
