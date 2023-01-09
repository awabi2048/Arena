# クールタイム中なら中断
execute if entity @e[tag=Arena.Timer,distance=..3] run function arena:empty

# Arena.Coreからdata(MOB種類/難易度)取得
execute store result score $MobType Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType
execute store result score $Difficulty Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty

# シフトか通常クリックかで難易度とモブの種類を設定
execute if predicate arena:is_sneaking run scoreboard players add $Difficulty Arena 1
execute unless predicate arena:is_sneaking run scoreboard players add $MobType Arena 1
execute if score $MobType Arena matches -1 run scoreboard players set $MobType Arena 0
execute if score $Difficulty Arena matches -1 run scoreboard players set $Difficulty Arena 0

# 最後まで行ったら0に戻す
execute if score $MobType Arena matches 7.. run scoreboard players set $MobType Arena 0
execute if score $Difficulty Arena matches 3.. run scoreboard players set $Difficulty Arena 0

# Arena.Coreのdata.Arena.にモブの種類と難易度を保存
execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.MobType int 1 run scoreboard players get $MobType Arena
execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Difficulty int 1 run scoreboard players get $Difficulty Arena

# 演出
playsound entity.experience_orb.pickup master @a ~ ~ ~ 1 1

# 看板クリック時処理のクールダウン設定
summon armor_stand ~ ~ ~ {Tags:["Arena.Timer"],PortalCooldown:15,Marker:1b,Invisible:1b}

# ストラクチャー読み込み
execute at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-4 ~ air

execute at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-4 ~ minecraft:structure_block{posX:-19,posY:1,posZ:-19,name:"arena:stage-normal",mode:"LOAD"}

execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 0 run data modify block ~ ~-4 ~ name set value "arena:stage-normal"
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 1 run data modify block ~ ~-4 ~ name set value "arena:stage-skeleton"
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 2 run data modify block ~ ~-4 ~ name set value "arena:stage-normal"
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 3 run data modify block ~ ~-4 ~ name set value "arena:stage-spider"
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 4 run data modify block ~ ~-4 ~ name set value "arena:stage-slime"
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 5 run data modify block ~ ~-4 ~ name set value "arena:stage-creeper"
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 6 run data modify block ~ ~-4 ~ name set value "arena:stage-guardian"

execute at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-5 ~ redstone_block
execute at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~-5 ~ air

# ストラクチャーの影響で閉じ込められた人をArena.SummonPoint2から最短のArena.SummonPointにTP (スライム・クモアリーナ・ガーディアン選択時のみ)
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 3 at @e[tag=Arena.SummonPoint2,distance=..32] run tp @a[distance=..1] @e[tag=Arena.Core,sort=nearest,limit=1]
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 4 at @e[tag=Arena.SummonPoint2,distance=..32] run tp @a[distance=..1] @e[tag=Arena.Core,sort=nearest,limit=1]
execute at @e[tag=Arena.Core,sort=nearest,limit=1] if score $MobType Arena matches 6 at @e[tag=Arena.SummonPoint2,distance=..32] run tp @a[distance=..1] @e[tag=Arena.Core,sort=nearest,limit=1]

# 看板設置
setblock ~ ~ ~ air
setblock ~ ~ ~ oak_wall_sign[facing=north]{Text1:'{"text":"［アリーナの種類］","bold": true,"color": "yellow","clickEvent":{"action":"run_command","value":"function arena:click_sign"}}',Text2:'{"text":"モブの種類が入るよ"}',Text3:'{"text":"〈難易度〉","bold": true,"color": "yellow"}',Text4:'{"text":"難易度が入るよ"}'} replace
execute if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches -1 run setblock ~ ~ ~ air

    # 看板文字データ変更
    execute if score $MobType Arena matches 0 run data modify block ~ ~ ~ Text2 set value '{"text":"ゾンビ","color":"white","bold":true}'
    execute if score $MobType Arena matches 1 run data modify block ~ ~ ~ Text2 set value '{"text":"スケルトン","color":"white","bold":true}'
    execute if score $MobType Arena matches 2 run data modify block ~ ~ ~ Text2 set value '{"text":"ブレイズ","color":"white","bold":true}'
    execute if score $MobType Arena matches 3 run data modify block ~ ~ ~ Text2 set value '{"text":"スパイダー","color":"white","bold":true}'
    execute if score $MobType Arena matches 4 run data modify block ~ ~ ~ Text2 set value '{"text":"スライム","color":"white","bold":true}'
    execute if score $MobType Arena matches 5 run data modify block ~ ~ ~ Text2 set value '{"text":"クリーパー","color":"white","bold":true}'
    execute if score $MobType Arena matches 6 run data modify block ~ ~ ~ Text2 set value '{"text":"ガーディアン","color":"white","bold":true}'

    execute if score $Difficulty Arena matches 0 run data modify block ~ ~ ~ Text4 set value '{"text":"イージー","color":"gold","bold":true}'
    execute if score $Difficulty Arena matches 1 run data modify block ~ ~ ~ Text4 set value '{"text":"ノーマル","color":"green","bold":true}'
    execute if score $Difficulty Arena matches 2 run data modify block ~ ~ ~ Text4 set value '{"text":"ハード","color":"red","bold":true}'
