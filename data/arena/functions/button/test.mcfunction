# ウェーブ進行可否判定
execute store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
execute at @e[tag=Arena.Core,sort=nearest,limit=1] store result score $Temp.MobCount Arena if entity @e[tag=Arena.Mob,distance=..40]

data modify storage arena:temp StageType set from entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.StageType
execute if data storage arena:temp {StageType:Normal} if score $Temp.Wave Arena matches 5 run data modify storage arena:temp StageType set value Endless

# ステージの種類によって場合分け
data modify storage arena:temp NextWave set value false
execute if data storage arena:temp {StageType:Normal} if score $Temp.MobCount Arena matches ..40 run data modify storage arena:temp NextWave set value true
execute unless data storage arena:temp {StageType:Normal} if score $Temp.MobCount Arena matches 0 run data modify storage arena:temp NextWave set value true

# 通知・効果音
execute if data storage arena:temp {NextWave:false} run playsound entity.shulker.hurt master @a ~ ~ ~ 1 1

execute if data storage arena:temp {NextWave:false} unless data storage arena:temp {StageType:Normal} run tellraw @a[tag=Arena.Player,distance=..32] {"text":"敵がいない状態にしてもう一度ボタンを押してください。","color":"red"}
execute if data storage arena:temp {NextWave:false} if data storage arena:temp {StageType:Normal} run tellraw @a[tag=Arena.Player,distance=..32] {"text":"敵が多すぎます！敵を減らしてからもう一度ボタンを押してください。","color":"red"}

execute if data storage arena:temp {StageType:Endless} if score @e[tag=Arena.Core,sort=nearest,limit=1] Arena matches 1.. run data modify storage arena:temp StageType set value Normal

# 失敗したらここで処理中断
execute if data storage arena:temp {NextWave:false} run function arena:stop_process
