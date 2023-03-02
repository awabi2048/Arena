## ロビーへ自動tp
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. run tp @s @e[tag=ArenaBoss.Lobby,limit=1]
execute as @a[tag=Arena.Player] if score @s Arena matches 101.. at @s run playsound entity.enderman.teleport master @s ~ ~ ~ 1 1.25

## タグ・スコアリセット
execute as @a if score @s Arena matches 101.. run scoreboard players set @s ArenaBoss.DamageDealt 0

execute as @a if score @s Arena matches 101.. run tag @s remove Arena.Player
execute as @a if score @s Arena matches 101.. run scoreboard players reset @s Arena

## フラグ解除・データリセット
data modify storage arena-boss: Status.IsPlaying set value false
data modify storage arena-boss: Status.ActiveStageInfo set value {}
