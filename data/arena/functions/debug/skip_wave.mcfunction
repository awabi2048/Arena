# 指定したウェーブまでスキップ
execute store result score $Debug.Wave Arena.Temp run data get storage arena:debug SkipWave
scoreboard players remove $Debug.Wave Arena.Temp 1

execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int -1 run scoreboard players get $Debug.Wave Arena.Temp

tellraw @s [{"text":"［アリーナデバッグ］:","color": "light_purple","bold": true},{"text":"ウェーブを","color": "white","bold": false},{"nbt":"SkipWave","storage": "arena:debug"},"に設定しました。"]

tp @e[tag=Arena.Mob,distance=..32] ~ ~-300 ~
