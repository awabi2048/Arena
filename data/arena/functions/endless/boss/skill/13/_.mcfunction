# 四方八方にレーザーを飛ばす
execute if score $Boss.SkillTimer Arena matches 0 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 1b
execute if score $Boss.SkillTimer Arena matches 0 run data modify entity @e[tag=Arena.Boss,limit=1] Rotation[1] set value 30f

execute if score $Boss.SkillTimer Arena matches 0 run playsound block.beacon.ambient master @a ~ ~ ~ 5 1.5
execute if score $Boss.SkillTimer Arena matches 0 run playsound block.beacon.activate master @a ~ ~ ~ 5 1.5
execute if score $Boss.SkillTimer Arena matches 0 run playsound block.beacon.deactivate master @a ~ ~ ~ 5 1.5

# 起点用マーカー
execute if score $Boss.SkillTimer Arena matches 40 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~ ~ air
execute if score $Boss.SkillTimer Arena matches 40 run summon marker ~ ~ ~ {Rotation:[0.0f,0.0f],Tags:["Arena.Boss.LaserPoint"]}


execute if score $Boss.SkillTimer Arena matches 40..50 as @e[tag=Arena.Boss.LaserPoint] at @s run tp @s ~ ~ ~ ~36 ~
execute if score $Boss.SkillTimer Arena matches 40..50 at @e[tag=Arena.Boss.LaserPoint] run function arena:endless/boss/skill/13/laser

# 効果音
execute if score $Boss.SkillTimer Arena matches 40 run playsound entity.ender_dragon.hurt master @a ~ ~ ~ 5 0.5
execute if score $Boss.SkillTimer Arena matches 40 run playsound entity.generic.explode master @a ~ ~ ~ 5 0.75

# 後処理
execute if score $Boss.SkillTimer Arena matches 50 run kill @e[tag=Arena.Boss.LaserPoint]
execute if score $Boss.SkillTimer Arena matches 50 run data modify entity @e[tag=Arena.Boss,limit=1] NoAI set value 0b
execute if score $Boss.SkillTimer Arena matches 50 at @e[tag=Arena.Core,sort=nearest,limit=1] run setblock ~ ~ ~ stone_button[face=floor]
