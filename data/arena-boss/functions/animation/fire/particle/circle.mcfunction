# 球体
particle flame ^ ^1 ^3 0 0 0 0 1
scoreboard players add $Rotation ArenaBoss.Temp 12

execute unless score $Rotation ArenaBoss.Temp matches 360.. rotated ~30 ~ run function arena-boss:animation/fire/particle/circle

execute if score $Rotation ArenaBoss.Temp matches 360.. run scoreboard players set $Rotation ArenaBoss.Temp 0
