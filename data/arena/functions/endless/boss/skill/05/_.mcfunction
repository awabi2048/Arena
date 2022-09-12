# 一定時間攻撃力増加・移動速度低下
execute if score $Boss.SkillTimer Arena matches 0 run particle crimson_spore ~ ~ ~ 5 5 5 1 300

execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.experience_orb.pickup master @a ~ ~ ~ 3 0.5
execute if score $Boss.SkillTimer Arena matches 0 run playsound entity.ender_dragon.ambient master @a ~ ~ ~ 3 0.75

execute if score $Boss.SkillTimer Arena matches 20 run effect give @a[tag=Arena.Player,distance=..20] blindness 1 0 true

execute if score $Boss.SkillTimer Arena matches 60 run effect give @e[tag=Arena.Boss] strength 10 3 true
execute if score $Boss.SkillTimer Arena matches 60 run effect give @e[tag=Arena.Boss] slowness 10 3 true

execute at @e[tag=Arena.Boss] run particle dust_color_transition 1 0.125 0.125 1 1 0 0 ~ ~ ~ 0.125 0.5 0.125 0.5 1
execute at @e[tag=Arena.Boss] run particle angry_villager ~ ~2 ~ 0.25 0.25 0.25 1 1
