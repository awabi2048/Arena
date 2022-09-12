# ボス位置をランダムなプレイヤーと入れ替え
execute store result score $Temp.PlayerCount Arena if entity @a[distance=..20,tag=Arena.Player]

tag @r[tag=Arena.Player,advancements={arena:boss/attacked_last_boss=false}] add Arena.Boss.SwapTarget
data modify storage arena: Temp.Boss.Swap set from entity @a[tag=Arena.Boss.SwapTarget,limit=1] Pos

tp @a[tag=Arena.Boss.SwapTarget] @s
execute if score $Temp.PlayerCount Arena matches 2.. run data modify entity @s Pos set from storage arena: Temp.Boss.Swap

tag @a remove Arena.Boss.SwapTarget

playsound entity.enderman.teleport master @a ~ ~ ~ 3 0.5
playsound entity.enderman.teleport master @a ~ ~ ~ 3 2

playsound entity.player.hurt master @a ~ ~ ~ 3 0.5
