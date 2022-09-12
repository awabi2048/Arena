# 全プレイヤーに雷を落とす
execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.generic.explode master @a ~ ~ ~ 3 0.8
execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.wither.spawn master @a ~ ~ ~ 3 0.8

execute if score $Boss.SkillTimer Arena matches 0 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 1b

execute if score $Boss.SkillTimer Arena matches 0..60 at @a[distance=..20,tag=Arena.Player] run particle electric_spark ~ ~ ~ 0.25 0 0.25 0 100

execute if score $Boss.SkillTimer Arena matches 60 at @a[distance=..20,tag=Arena.Player] run summon lightning_bolt
execute if score $Boss.SkillTimer Arena matches 60 at @a[distance=..20,tag=Arena.Player] run summon lightning_bolt

execute if score $Boss.SkillTimer Arena matches 60 as @a[distance=..20,tag=Arena.Player] run effect give @s instant_damage 1 1 true

execute if score $Boss.SkillTimer Arena matches 60 at @a[distance=..20,tag=Arena.Player] run playsound item.trident.thunder master @a ~ ~ ~ 1 0.75
execute if score $Boss.SkillTimer Arena matches 60 at @a[distance=..20,tag=Arena.Player] run playsound entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1
execute if score $Boss.SkillTimer Arena matches 60 at @a[distance=..20,tag=Arena.Player] run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 1 0.75

execute if score $Boss.SkillTimer Arena matches 60 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 0b
