# モブの行動(攻撃): 炎
function arena:rng

# 特殊攻撃: 柱ドカ
execute if predicate arena:1-n/10 unless data storage arena-boss: {Animation:{LastActivated:"Burning_Pillar"}} at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=4..6] run data modify storage arena-boss: Animation.Name set value "Burning_Pillar"
data modify storage arena-boss: Animation.LastActivated set from storage arena-boss: Animation.Name
execute unless data storage arena-boss: {Animation:{Name:"Regular"}} run function arena:stop_process

# 特殊攻撃: 爆縮移動
execute if predicate arena:1-n/02 unless data storage arena-boss: {Animation:{LastActivated:"Implosion"}} at @e[tag=ArenaBoss.Core] if entity @a[tag=Arena.Player,distance=12..] run data modify storage arena-boss: Animation.Name set value "Implosion"
data modify storage arena-boss: Animation.LastActivated set from storage arena-boss: Animation.Name
execute unless data storage arena-boss: {Animation:{Name:"Regular"}} run function arena:stop_process

# 特殊攻撃: 炎ばらまき
execute if predicate arena:1-n/04 unless data storage arena-boss: {Animation:{LastActivated:"Shot-Hard"}} at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=8..16] run data modify storage arena-boss: Animation.Name set value "Shot-Hard"
data modify storage arena-boss: Animation.LastActivated set from storage arena-boss: Animation.Name
execute unless data storage arena-boss: {Animation:{Name:"Regular"}} run function arena:stop_process

# 特殊攻撃: 手下召喚
execute if predicate arena:1-n/08 unless data storage arena-boss: {Animation:{LastActivated:"Summon_Minion"}} at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=10..] run data modify storage arena-boss: Animation.Name set value "Summon_Minion"
data modify storage arena-boss: Animation.LastActivated set from storage arena-boss: Animation.Name
execute unless data storage arena-boss: {Animation:{Name:"Regular"}} run function arena:stop_process

# 通常ショット
function arena:rng
execute at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=..8] if score $Random Arena matches 1..75 run data modify storage arena-boss: Animation.Name set value "Shot-Normal"
execute at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=..8] if score $Random Arena matches 76..99 run data modify storage arena-boss: Animation.Name set value "Shot-Easy"



