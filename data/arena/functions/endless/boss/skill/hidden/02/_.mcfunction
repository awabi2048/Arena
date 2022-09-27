# 弾召喚
execute if score $Boss.SkillTimer Arena matches 0 run summon marker ~ ~ ~ {Tags:["Arena.Boss.Skill02.Core","Arena.Boss.Marker"]} 
execute if score $Boss.SkillTimer Arena matches 1..20 as @e[tag=Arena.Boss.Skill02.Core] at @s run function arena:endless/boss/skill/hidden/02/summon_bullet

# 弾の移動と当たり判定
execute if score $Boss.SkillTimer Arena matches 30.. as @e[tag=Arena.Boss.Skill02.Bullet] at @s facing entity @e[tag=Arena.Boss.Skill02.Core,limit=1] eyes rotated ~ 0 run tp @s ^1 ^ ^-0.25 ~ ~

execute at @e[tag=Arena.Boss.Skill02.Bullet] as @a[tag=Arena.Player,distance=..1] run data modify storage score_damage: Argument set value {Damage:10.00d}
execute at @e[tag=Arena.Boss.Skill02.Bullet] as @a[tag=Arena.Player,distance=..1] run function score_damage:api/attack
execute at @e[tag=Arena.Boss.Skill02.Bullet] as @a[tag=Arena.Player,distance=..1] run effect give @s levitation 3 1 true

# 演出
execute if score $Boss.SkillTimer Arena matches 0 run playsound item.trident.thunder master @a ~ ~ ~ 5 0.5
execute if score $Boss.SkillTimer Arena matches 0 run playsound block.portal.travel master @a ~ ~ ~ 5 1.8

execute at @e[tag=Arena.Boss.Skill02.Bullet] run particle crit ~ ~ ~ 0 0 0 0 2
execute at @e[tag=Arena.Boss.Skill02.Bullet] run particle end_rod ~ ~ ~ 0 0 0 0 1
execute at @e[tag=Arena.Boss.Skill02.Bullet] run particle enchanted_hit ~ ~ ~ 0 0 0 0 2

# kill
execute if score $Boss.SkillTimer Arena matches 100 run kill @e[tag=Arena.Boss.Skill02.Bullet]
execute if score $Boss.SkillTimer Arena matches 100 run kill @e[tag=Arena.Boss.Skill02.Core]

execute as @e[tag=Arena.Boss.Skill02.Bullet] at @s unless block ~ ~ ~ air run kill @s
