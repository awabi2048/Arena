# モブの行動(攻撃): 炎

function arena:rng

# 特殊攻撃: 柱ドカ
execute if score $Random Arena matches 1..12 at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=..8] run data modify storage arena-boss: Animation.Name set value "Burning_Pillar"
execute if score $Random Arena matches 1..12 at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=..8] run function arena:stop_process

# 特殊攻撃: 爆縮移動
execute if score $Random Arena matches 1..20 at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Player,distance=10..] run data modify storage arena-boss: Animation.Name set value "Implosion"

# 通常ショット
execute at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=..8] run data modify storage arena-boss: Animation.Name set value "Shot-Normal"
execute at @e[tag=ArenaBoss.Core] if entity @a[tag=ArenaBoss.Target,distance=8.01..16] run data modify storage arena-boss: Animation.Name set value "Shot-Hard"
