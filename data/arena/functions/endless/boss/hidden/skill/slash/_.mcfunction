# 斬撃
function arena:rng 
execute if score $Random Arena matches 0..50 run data modify storage arena: Boss.Motion.Name set value "Slash_1"
execute if score $Random Arena matches 51..99 run data modify storage arena: Boss.Motion.Name set value "Slash_2"

scoreboard players set $MotionTimer Arena 0
