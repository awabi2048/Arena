summon marker ~ ~ ~ {Tags:["Arena.Random"]}
execute store result score $Boss.Skill Arena run data get entity @e[tag=Arena.Random,limit=1] UUID[0]
kill @e[tag=Arena.Random]

execute if entity @e[tag=Arena.LastBoss] run scoreboard players operation $Boss.Skill Arena %= #16 Arena
execute if entity @e[tag=Arena.MidBoss] run scoreboard players operation $Boss.Skill Arena %= #9 Arena

# 特定条件下で再抽選
execute if score $Boss.Skill Arena matches 0 if entity @e[tag=Arena.Boss.Skill01] run function arena:endless/boss/skill_selection 
execute if score $Boss.Skill Arena matches 1..2 if entity @e[tag=Arena.Boss.Phantom] run function arena:endless/boss/skill_selection 
execute if score $Boss.Skill Arena matches 11..12 if entity @e[tag=Arena.Boss.Phantom] run function arena:endless/boss/skill_selection 
execute if score $Boss.Skill Arena matches 15 if entity @e[tag=Arena.MiniBoss] run function arena:endless/boss/skill_selection 
