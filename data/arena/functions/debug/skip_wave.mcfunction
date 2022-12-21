# 指定したウェーブまでスキップ
execute store result score $Temp.Debug.Wave Arena run data get storage arena: Debug.SkipWave
scoreboard players remove $Temp.Debug.Wave Arena 1

execute store result entity @e[tag=Arena.Core,sort=nearest,limit=1] data.Arena.Wave int -1 run scoreboard players get $Temp.Debug.Wave Arena

tellraw @s [{"text":"［アリーナデバッグ］:","color": "light_purple","bold": true},{"text":"ウェーブを","color": "white","bold": false},{"nbt":"Debug.SkipWave","storage": "arena:"},"に設定しました。"]

tp @e[tag=Arena.Mob,distance=..32] ~ ~-300 ~
