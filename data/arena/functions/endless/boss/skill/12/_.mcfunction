# ファントム召喚
execute if score $Boss.SkillTimer Arena matches 0 run particle soul_fire_flame ~2 ~ ~ 0 0 0 0.125 10
execute if score $Boss.SkillTimer Arena matches 0 run particle soul_fire_flame ~-2 ~ ~ 0 0 0 0.125 10
execute if score $Boss.SkillTimer Arena matches 0 run particle soul_fire_flame ~ ~ ~2 0 0 0 0.125 10
execute if score $Boss.SkillTimer Arena matches 0 run particle soul_fire_flame ~ ~ ~-2 0 0 0 0.125 10

execute if score $Boss.SkillTimer Arena matches 0 at @e[tag=Arena.Boss] run summon phantom ~2 ~2 ~ {Tags:["Arena.Boss.Phantom","Arena.Mob"],DeathLootTable:"empty"}
execute if score $Boss.SkillTimer Arena matches 10 at @e[tag=Arena.Boss] run summon phantom ~ ~2 ~2 {Tags:["Arena.Boss.Phantom","Arena.Mob"],DeathLootTable:"empty"}
execute if score $Boss.SkillTimer Arena matches 20 at @e[tag=Arena.Boss] run summon phantom ~-2 ~2 ~ {Tags:["Arena.Boss.Phantom","Arena.Mob"],DeathLootTable:"empty"}
execute if score $Boss.SkillTimer Arena matches 30 at @e[tag=Arena.Boss] run summon phantom ~ ~2 ~-2 {Tags:["Arena.Boss.Phantom","Arena.Mob"],DeathLootTable:"empty"}
