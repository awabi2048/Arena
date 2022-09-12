# 終了
execute store result score $MobCount Arena if entity @e[tag=Arena.Mob,distance=..20]

# Wave [1..5] = 通常 , [6] = 報酬 , [7] = 終了

    # 成功処理
    execute if score $Temp.Wave Arena matches 6 if score $MobCount Arena matches 0 as @e[tag=Arena.Core,sort=nearest,limit=1] run function arena:button/reward
    execute if score $Temp.Wave Arena matches 7 if score $MobCount Arena matches 0 as @e[tag=Arena.Core,sort=nearest,limit=1] run function arena:end

    # 失敗処理
    execute if score $Temp.Wave Arena matches 6 unless score $MobCount Arena matches 0 run tellraw @a[tag=Arena.Player,distance=..20] {"text":"敵がいない状態にしてもう一度ボタンを押してください","color":"aqua"}
    execute if score $Temp.Wave Arena matches 6 unless score $MobCount Arena matches 0 run playsound entity.shulker.hurt master @a ~ ~ ~ 1 1

    execute if score $Temp.Wave Arena matches 6 unless score $MobCount Arena matches 0 store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave
    execute if score $Temp.Wave Arena matches 6 unless score $MobCount Arena matches 0 store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Wave int 1 run scoreboard players remove $Temp.Wave Arena 1

