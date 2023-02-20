# モブの行動(攻撃): 水




# 通常ショット
function arena:rng
# execute at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=..8] if score $Random Arena matches 1..75 run 
data modify storage arena-boss: Animation.Name set value "Shot-Normal"

