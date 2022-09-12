# モブ召喚 (Wave [1..5])
    # ウェーブ進行可否判定
    execute at @e[tag=Arena.Core,sort=nearest,limit=1] store result score $Temp.MobCount Arena if entity @e[tag=Arena.Mob,distance=..40]
    execute store success score $Temp.NextWave Arena if score $Temp.MobCount Arena matches ..39

    # 成功処理
    execute if score $Temp.NextWave Arena matches 1 run function arena:summon/_

    execute if score $Temp.NextWave Arena matches 1 run title @a[tag=Arena.Player,distance=..20] times 10 40 10
    execute if score $Temp.NextWave Arena matches 1 run title @a[tag=Arena.Player,distance=..20] title " "

    execute if score $Temp.NextWave Arena matches 1 if score $Temp.Wave Arena matches 1..4 run title @a[tag=Arena.Player,distance=..20] subtitle [{"text":"Wave ","color": "gold"},{"score":{"name": "$Temp.Wave","objective": "Arena"},"color": "gold"}]
    execute if score $Temp.NextWave Arena matches 1 if score $Temp.Wave Arena matches 5 run title @a[tag=Arena.Player,distance=..20] subtitle [{"text":"Last Wave","color": "gold"}]

    execute if score $Temp.NextWave Arena matches 1 run playsound entity.experience_orb.pickup master @a[tag=Arena.Player,distance=..20] ~ ~ ~ 1 1.2

    # 失敗処理
    execute if score $Temp.NextWave Arena matches 0 run playsound entity.shulker.hurt master @a ~ ~ ~ 1 1
    execute if score $Temp.NextWave Arena matches 0 run tellraw @a[tag=Arena.Player,distance=..20] {"text":"敵が多すぎます！敵を減らしてからもう一度ボタンを押してください！","color":"aqua"}

    execute if score $Temp.NextWave Arena matches 0 store result score $Temp.Wave Arena run data get entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave
    execute if score $Temp.NextWave Arena matches 0 run scoreboard players remove $Temp.Wave Arena 1
    execute if score $Temp.NextWave Arena matches 0 store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int 1 run scoreboard players get $Temp.Wave Arena
