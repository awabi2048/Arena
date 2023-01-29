# ウェーブ進行

# モブ召喚
    ## 召喚モブ選択
    function arena:endless/select_mob

    ## 難易度を無効化
    data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty set value -1

    ## 召喚
    function arena:summon/_

# タイトル表示と効果音
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1

title @a[tag=Arena.Player,distance=..32] times 10 60 10
execute if score $Wave Arena.Temp matches 1 run title @a[tag=Arena.Player,distance=..32] title [{"text":"||| ","obfuscated": true},{"text": "Endless Arena","color": "dark_purple","bold": true,"obfuscated": false},{"text": " |||","obfuscated": true}]

execute unless score $Wave Arena.Temp matches 1 run title @a[tag=Arena.Player,distance=..32] title " "

title @a[tag=Arena.Player,distance=..32] subtitle [{"text":"Wave ","color": "gold"},{"score":{"name": "$Wave","objective": "Arena.Temp"},"color": "gold"}]
playsound entity.experience_orb.pickup master @a[tag=Arena.Player,distance=..32] ~ ~ ~ 4 1.2

# チケット配布
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1

execute unless score $Wave Arena.Temp matches 1 run scoreboard players remove $Wave Arena.Temp 1
scoreboard players operation $Wave Arena.Temp %= #10 Arena
execute store success storage arena:temp GiveTicket byte 1 if score $Wave Arena.Temp matches 0

execute if data storage arena:temp {GiveTicket:true} run function arena:endless/ticket

# ストラクチャー読み込み
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ air
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,mode:"LOAD",name:"arena:stage-normal"}

execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:3}}} run data modify block ~ ~-4 ~ name set value "arena:stage-spider"
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:4}}} run data modify block ~ ~-4 ~ name set value "arena:stage-slime"
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:5}}} run data modify block ~ ~-4 ~ name set value "arena:stage-creeper"

execute at @e[tag=Arena.Core,sort=nearest,limit=1] if data storage arena:temp {SummonBoss:true} run data modify block ~ ~-4 ~ name set value "arena:stage-normal"

execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ redstone_block
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ air

# プレイヤーに設定する最大到達スコアをArena.Coreから取得
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1
execute as @a[tag=Arena.Player,distance=..32] if score $Wave Arena.Temp > @s Arena.MaxStageReached run scoreboard players operation @s Arena.MaxStageReached = $Wave Arena.Temp

# 実績解除判定
    ## 3連同じモブ
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] run data modify entity @s data.Arena.LastMobType append from entity @s data.Arena.MobType
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] run data remove entity @s data.Arena.LastMobType[0]

    execute store result score $LastMobType[0] Arena.Temp run data get storage arena: Endless.LastSummonedMob[0]
    execute store result score $LastMobType[1] Arena.Temp run data get storage arena: Endless.LastSummonedMob[1]
    execute store result score $LastMobType[2] Arena.Temp run data get storage arena: Endless.LastSummonedMob[2]

    execute if score $LastMobType[0] Arena.Temp = $LastMobType[1] Arena.Temp if score $LastMobType[1] Arena.Temp = $LastMobType[2] Arena.Temp if score $LastMobType[2] Arena.Temp = $LastMobType[3] Arena.Temp run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/endless/same_mobs

    ## 初エンドレス
    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Wave:-1}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/endless/first_join

    ## 壁に閉じ込める
    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{MobType:3}}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] if entity @a[tag=Arena.Player,distance=..2] at @e[tag=Arena.Core,sort=nearest,limit=1] run advancement grant @a[tag=Arena.Player,distance=..5] only arena:display/endless/leave_in_wall
    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{MobType:4}}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] if entity @a[tag=Arena.Player,distance=..2] at @e[tag=Arena.Core,sort=nearest,limit=1] run advancement grant @a[tag=Arena.Player,distance=..5] only arena:display/endless/leave_in_wall

    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{MobType:3}}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] as @a[tag=Arena.Player,distance=..2] run tp @s @e[tag=Arena.Core,sort=nearest,limit=1]
    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{MobType:4}}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] as @a[tag=Arena.Player,distance=..2] run tp @s @e[tag=Arena.Core,sort=nearest,limit=1]
