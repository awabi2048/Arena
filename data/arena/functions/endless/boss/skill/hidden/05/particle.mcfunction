particle flame ~ ~ ~ 0 0 0 0.01 1 force
execute positioned ~ ~-1.4 ~ if score $Boss.SkillTimer Arena matches 100 run tag @p[tag=Arena.Player,distance=..0.5] add Arena.Boss.Skill05.Target
execute positioned ^ ^ ^0.25 if block ~ ~ ~ air positioned ~ ~-1.4 ~ unless entity @a[tag=Arena.Boss.Skill05.Target,distance=..0.5] positioned ~ ~1.4 ~ run function arena:endless/boss/skill/hidden/05/particle
