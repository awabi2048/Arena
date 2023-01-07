# ウェーブ進行可否判定
    ## 通常時
    execute store result score $Temp.MobCount Arena if entity @e[tag=Arena.Mob,distance=..40]
    data modify storage arena:temp NextWave set value false
    execute if score $Temp.MobCount Arena matches 0 run data modify storage arena:temp NextWave set value true

    ## 中・ラストボス
    execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1
    execute if score $Temp.Wave Arena matches 10 unless entity @e[tag=Arena.ExtraBoss] run data modify storage arena:temp NextWave set value true

# 失敗処理
execute if data storage arena:temp {NextWave:false} run tellraw @a[tag=Arena.Player,distance=..20] {"text":"敵がいない状態にしてもう一度ボタンを押してください！","color":"aqua"}
execute if data storage arena:temp {NextWave:false} run playsound entity.shulker.hurt master @a ~ ~ ~ 1 1

execute if data storage arena:temp {NextWave:false} store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1
execute if data storage arena:temp {NextWave:false} run scoreboard players remove $Temp.Wave Arena 1
execute if data storage arena:temp {NextWave:false} store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int -1 run scoreboard players get $Temp.Wave Arena

# 成功処理
    ## 0-5で乱数生成 (MobTypeに適応), ガーディアン除く
    function arena:rng
    scoreboard players operation $Random Arena %= #6 Arena
    execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType int 1 run scoreboard players get $Random Arena

    ## 難易度を無効化
    data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty set value -1

    # タイトル表示と効果音
    execute if data storage arena:temp {NextWave:true} store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1

    execute if data storage arena:temp {NextWave:true} run title @a[tag=Arena.Player,distance=..20] times 10 60 10
    execute if data storage arena:temp {NextWave:true} if score $Temp.Wave Arena matches 1 run title @a[tag=Arena.Player,distance=..20] title [{"text":"||| ","obfuscated": true},{"text": "Extra Arena","color": "yellow","bold": true,"obfuscated": false},{"text": " |||","obfuscated": true}]

    execute if data storage arena:temp {NextWave:true} unless score $Temp.Wave Arena matches 1 run title @a[tag=Arena.Player,distance=..20] title " "

    execute if data storage arena:temp {NextWave:true} run title @a[tag=Arena.Player,distance=..20] subtitle [{"text":"Wave ","color": "gold"},{"score":{"name": "$Temp.Wave","objective": "Arena"},"color": "gold"}]
    execute if data storage arena:temp {NextWave:true} run playsound entity.experience_orb.pickup master @a[tag=Arena.Player,distance=..20] ~ ~ ~ 1 1.2
    execute if data storage arena:temp {NextWave:true} run function arena_beta:summon/_

    ## ストラクチャー読み込み
    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ air
    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,mode:"LOAD",name:"arena:stage-normal"}

    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:1}}} run data modify block ~ ~-4 ~ name set value "arena:stage-skeleton"
    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:3}}} run data modify block ~ ~-4 ~ name set value "arena:stage-spider"
    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:4}}} run data modify block ~ ~-4 ~ name set value "arena:stage-slime"
    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:5}}} run data modify block ~ ~-4 ~ name set value "arena:stage-creeper"

    execute if data storage arena:temp {NextWave:true} at @e[tag=Arena.Core,sort=nearest,limit=1] if data storage arena:temp {SummonBoss:true} run data modify block ~ ~-4 ~ name set value "arena:stage-normal"

    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ redstone_block
    execute if data storage arena:temp {NextWave:true} as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ stone
