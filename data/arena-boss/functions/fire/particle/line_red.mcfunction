# プレイヤーにレーザー照射
particle dust_color_transition 1 0 0 1 0.5 0 0 ~ ~ ~ 0 0 0 0 1
execute positioned ^ ^ ^0.5 if block ~ ~ ~ air if entity @e[tag=ArenaBoss.Skill03,distance=..10] as @a[tag=Arena.Player,dx=0,dy=0,dz=0] positioned ~-0.75 ~-0.75 ~-0.75 unless entity @a[tag=Arena.Player,dx=0,dy=0,dz=0] run function arena-boss:fire/particle/line_red

execute positioned ^ ^ ^0.5 if block ~ ~ ~ air if entity @e[tag=ArenaBoss.Skill03,distance=..10] as @a[tag=Arena.Player,dx=0,dy=0,dz=0] positioned ~-0.75 ~-0.75 ~-0.75 as @a[tag=Arena.Player,dx=0,dy=0,dz=0] run function arena-boss:fire/burning_pillar
