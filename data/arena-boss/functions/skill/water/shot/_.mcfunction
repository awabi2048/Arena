# パーティクル表示
# ビーム照射
execute as @a[tag=Arena.Player,distance=..50] positioned ~-50 ~-50 ~-50 unless predicate hitbox:hitbox run tag @a remove ArenaBoss.PlayerHit
execute as @a[tag=Arena.Player,distance=..50] positioned ~-50 ~-50 ~-50 if predicate hitbox:hitbox run tag @s add ArenaBoss.Player.Hit

execute if entity @a[tag=ArenaBoss.Player.Hit] run scoreboard players add $BeamExposured ArenaBoss 1

execute positioned ^ ^ ^0.25 if block ~ ~ ~ air if entity @e[tag=ArenaBoss.Core] unless entity @a[tag=ArenaBoss.Player.Hit] run function arena-boss:skill/water/shot/_

