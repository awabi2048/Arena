# ウェーブ進行可否判定
## 通常時
execute store result score $Temp.MobCount Arena if entity @e[tag=Arena.Mob,distance=..40]
execute store success score $Temp.NextWave Arena if score $Temp.MobCount Arena matches 0

# ボスいるかな
## 中・ラストボス
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1
execute if score $Temp.Wave Arena matches 50 store success score $Temp.NextWave Arena unless entity @e[tag=Arena.MidBoss]
execute if score $Temp.Wave Arena matches 100 store success score $Temp.NextWave Arena unless entity @e[tag=Arena.LastBoss]

    # 失敗処理
    execute if score $Temp.NextWave Arena matches 0 run tellraw @a[tag=Arena.Player,distance=..20] {"text":"敵がいない状態にしてもう一度ボタンを押してください！","color":"aqua"}
    execute if score $Temp.NextWave Arena matches 0 run playsound entity.shulker.hurt master @a ~ ~ ~ 1 1

    execute if score $Temp.NextWave Arena matches 0 store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1
    execute if score $Temp.NextWave Arena matches 0 run scoreboard players remove $Temp.Wave Arena 1
    execute if score $Temp.NextWave Arena matches 0 store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave int -1 run scoreboard players get $Temp.Wave Arena

    # 成功処理
        ## 0-5 でランダムな数字を選択 (MobTypeに適応), ガーディアン除く
        summon area_effect_cloud ~ ~ ~ {Tags:["Arena.Random"]}
        execute store result score $Random Arena run data get entity @e[tag=Arena.Random,limit=1] UUID[0]
        scoreboard players operation $Random Arena %= #6 Arena
        execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.MobType int 1 run scoreboard players get $Random Arena

        ## 難易度データを無効化
        data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Difficulty set value -1

    	## デバッグ用
        execute if data storage arena: {Debug:{NextMob:"zombie"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.MobType set value 0
        execute if data storage arena: {Debug:{NextMob:"skeleton"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.MobType set value 1
        execute if data storage arena: {Debug:{NextMob:"blaze"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.MobType set value 2
        execute if data storage arena: {Debug:{NextMob:"spider"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.MobType set value 3
        execute if data storage arena: {Debug:{NextMob:"slime"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.MobType set value 4
        execute if data storage arena: {Debug:{NextMob:"creeper"}} run data modify entity @e[tag=Arena.Core,sort=nearest,limit=1] data.MobType set value 5
        data remove storage arena: Debug.NextMob

    # タイトル表示と効果音
    execute if score $Temp.NextWave Arena matches 1 run title @a[tag=Arena.Player,distance=..20] times 10 40 10
    execute if score $Temp.NextWave Arena matches 1 if score $Temp.Wave Arena matches 100 run title @a[tag=Arena.Player,distance=..20] title " "
    execute if score $Temp.NextWave Arena matches 1 run title @a[tag=Arena.Player,distance=..20] title " "

    execute if score $Temp.NextWave Arena matches 1 store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1
    execute if score $Temp.NextWave Arena matches 1 run title @a[tag=Arena.Player,distance=..20] subtitle [{"text":"Wave ","color": "gold"},{"score":{"name": "$Temp.Wave","objective": "Arena"},"color": "gold"}]
    execute if score $Temp.NextWave Arena matches 1 run playsound entity.experience_orb.pickup master @a[tag=Arena.Player,distance=..20] ~ ~ ~ 1 1.2
    execute if score $Temp.NextWave Arena matches 1 run function arena:summon/_
    
    ## チケット配布
    execute if score $Temp.NextWave Arena matches 1 store result score $Temp.TicketGive Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1
    execute if score $Temp.NextWave Arena matches 1 store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1

    execute if score $Temp.NextWave Arena matches 1 unless score $Temp.Wave Arena matches 1 run scoreboard players remove $Temp.TicketGive Arena 1
    execute if score $Temp.NextWave Arena matches 1 run scoreboard players operation $Temp.TicketGive Arena %= #10 Arena
    execute if score $Temp.NextWave Arena matches 1 store success score $Temp.TicketGive Arena if score $Temp.TicketGive Arena matches 0

    execute if score $Temp.NextWave Arena matches 1 if score $Temp.TicketGive Arena matches 1 run function arena:endless/ticket

    ## ストラクチャー読み込み
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ air
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-4 ~ structure_block{posX:-19,posY:1,posZ:-19,mode:"LOAD",name:"arena:stage-normal"}
    
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{MobType:1}} run data modify block ~ ~-4 ~ name set value "arena:stage-skeleton"
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{MobType:3}} run data modify block ~ ~-4 ~ name set value "arena:stage-spider"
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{MobType:4}} run data modify block ~ ~-4 ~ name set value "arena:stage-slime"
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if data entity @s {data:{MobType:5}} run data modify block ~ ~-4 ~ name set value "arena:stage-creeper"
    
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s if score $Temp.BossSummon Arena matches 1 run data modify block ~ ~-4 ~ name set value "arena:stage-normal"
    
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ redstone_block
    execute if score $Temp.NextWave Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] at @s run setblock ~ ~-5 ~ air
    
    ## プレイヤーに設定する最大到達スコアをArena.Coreから取得
    execute if score $Temp.NextWave Arena matches 1 store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1
    execute if score $Temp.NextWave Arena matches 1 as @a[tag=Arena.Player,distance=..32] if score $Temp.Wave Arena > @s Arena.MaxStageR store result score @s Arena.MaxStageR run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave -1

    ## 実績解除判定
        ### 3連同じモブ
        execute if score $Temp.NextWave Arena matches 1 unless score $Temp.BossSummon Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] run data modify entity @s data.LastMobType append from entity @s data.MobType
        execute if score $Temp.NextWave Arena matches 1 unless score $Temp.BossSummon Arena matches 1 as @e[tag=Arena.Core,sort=nearest,limit=1] run data remove entity @s data.LastMobType[0]

        execute if score $Temp.NextWave Arena matches 1 store result score $Temp.LastMobType1 Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.LastMobType[0]
        execute if score $Temp.NextWave Arena matches 1 store result score $Temp.LastMobType2 Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.LastMobType[1]
        execute if score $Temp.NextWave Arena matches 1 store result score $Temp.LastMobType3 Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.LastMobType[2]

        execute if score $Temp.LastMobType1 Arena = $Temp.LastMobType2 Arena if score $Temp.LastMobType2 Arena = $Temp.LastMobType3 Arena run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/endless/same_mobs

        ### 初エンドレス
        execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{Wave:-1}} run advancement grant @a[tag=Arena.Player,distance=..32] only arena:display/endless/first_join

        ### 壁に閉じ込める
        execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{MobType:3}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] if entity @a[tag=Arena.Player,distance=..2] at @e[tag=Arena.Core,sort=nearest,limit=1] run advancement grant @a[tag=Arena.Player,distance=..5] only arena:display/endless/leave_in_wall
        execute if data entity @e[tag=Arena.Core,sort=nearest,limit=1] {data:{MobType:4}} at @e[tag=Arena.SummonPoint2,sort=nearest,limit=4] if entity @a[tag=Arena.Player,distance=..2] at @e[tag=Arena.Core,sort=nearest,limit=1] run advancement grant @a[tag=Arena.Player,distance=..5] only arena:display/endless/leave_in_wall
