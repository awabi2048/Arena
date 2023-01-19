# ウェーブ進行

# モブ召喚用に調整
    ## 0-5で乱数生成 (MobTypeに適応), ガーディアン除く
    function arena:rng
    scoreboard players operation $Random Arena %= #6 Arena
    execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType int 1 run scoreboard players get $Random Arena

    ## 難易度を無効化
    data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty set value -1

    ## デバッグ用
    execute if data storage arena: {Debug:{NextMob:"zombie"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType set value 0
    execute if data storage arena: {Debug:{NextMob:"skeleton"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType set value 1
    execute if data storage arena: {Debug:{NextMob:"blaze"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType set value 2
    execute if data storage arena: {Debug:{NextMob:"spider"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType set value 3
    execute if data storage arena: {Debug:{NextMob:"slime"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType set value 4
    execute if data storage arena: {Debug:{NextMob:"creeper"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType set value 5
    data remove storage arena: Debug.NextMob

# タイトル表示と効果音
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1

title @a[tag=Arena.Player,distance=..32] times 10 60 10
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:Endless}}} if score $Wave Arena.Temp matches 1 run title @a[tag=Arena.Player,distance=..32] title [{"text":"||| ","obfuscated": true},{"text": "Endless","color": "dark_purple","bold": true,"obfuscated": false},{"text": " |||","obfuscated": true}]
execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{StageType:HiddenEndless}}} if score $Wave Arena.Temp matches 1 run title @a[tag=Arena.Player,distance=..32] title [{"text":"||| ","obfuscated": true},{"text": "Hidden Endless","color": "red","bold": true,"obfuscated": false},{"text": " |||","obfuscated": true}]

execute unless score $Wave Arena.Temp matches 1 run title @a[tag=Arena.Player,distance=..32] title " "

title @a[tag=Arena.Player,distance=..32] subtitle [{"text":"Wave ","color": "gold"},{"score":{"name": "$Wave","objective": "Arena.Temp"},"color": "gold"}]
playsound entity.experience_orb.pickup master @a[tag=Arena.Player,distance=..32] ~ ~ ~ 4 1.2

# 召喚
    ## 各ボスの召喚判定
    execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    scoreboard players operation $Wave Arena.Temp %= #10 Arena
    execute if score $Wave Arena.Temp matches 0 run data modify storage arena:temp SummonBoss set value true
    execute unless score $Wave Arena.Temp matches 0 run data modify storage arena:temp SummonBoss set value false

    ## 実際に召喚
    function arena:summon/_

# チケット配布
execute store result score $Temp.TicketGive Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1

execute unless score $Wave Arena.Temp matches 1 run scoreboard players remove $Temp.TicketGive Arena 1
scoreboard players operation $Temp.TicketGive Arena %= #10 Arena
execute store success score $Temp.TicketGive Arena if score $Temp.TicketGive Arena matches 0

execute if score $Temp.TicketGive Arena matches 1 run function arena:endless/ticket

# ストラクチャー読み込み
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ air
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,mode:"LOAD",name:"arena:stage-normal"}

execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:3}}} run data modify block ~ ~-4 ~ name set value "arena:stage-spider"
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:4}}} run data modify block ~ ~-4 ~ name set value "arena:stage-slime"
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{Arena:{MobType:5}}} run data modify block ~ ~-4 ~ name set value "arena:stage-creeper"

execute at @e[tag=Arena.Core,sort=nearest,limit=1] if data storage arena:temp {SummonBoss:true} run data modify block ~ ~-4 ~ name set value "arena:stage-normal"

execute at @e[tag=Arena.Core,sort=nearest,limit=1] if data storage arena:temp {SummonBoss:true} if data entity @s {data:{Arena:{Wave:100,StageType:HiddenEndless}}} run data modify block ~ ~-4 ~ name set value "arena:stage-large"

execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ redstone_block
execute as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ air

# プレイヤーに設定する最大到達スコアをArena.Coreから取得
execute store result score $Wave Arena.Temp run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave -1
execute as @a[tag=Arena.Player,distance=..32] if score $Wave Arena.Temp > @s Arena.MaxStageReached run scoreboard players operation @s Arena.MaxStageReached = $Wave Arena.Temp

# 実績解除判定
    ## 3連同じモブ
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] run data modify entity @s data.Arena.LastMobType append from entity @s data.Arena.MobType
    execute as @e[tag=Arena.Core,sort=nearest,limit=1] run data remove entity @s data.Arena.LastMobType[0]

    execute store result score $Temp.LastMobType1 Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.LastMobType[0]
    execute store result score $Temp.LastMobType2 Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.LastMobType[1]
    execute store result score $Temp.LastMobType3 Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.LastMobType[2]

    execute if score $Temp.LastMobType1 Arena = $Temp.LastMobType2 Arena if score $Temp.LastMobType2 Arena = $Temp.LastMobType3 Arena run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/endless/same_mobs

    ## 初エンドレス
    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{Wave:-1}}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/endless/first_join

    ## 壁に閉じ込める
    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{MobType:3}}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] if entity @a[tag=Arena.Player,distance=..2] at @e[tag=Arena.Core,sort=nearest,limit=1] run advancement grant @a[tag=Arena.Player,distance=..5] only arena:display/endless/leave_in_wall
    execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Arena:{MobType:4}}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] if entity @a[tag=Arena.Player,distance=..2] at @e[tag=Arena.Core,sort=nearest,limit=1] run advancement grant @a[tag=Arena.Player,distance=..5] only arena:display/endless/leave_in_wall
