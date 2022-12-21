# 斬撃マーカー処理
execute as @e[tag=Arena.LastBoss.Skill.Slash] at @s rotated ~ 0 run tp @s ^ ^ ^0.75
execute at @e[tag=Arena.LastBoss.Skill.Slash] rotated ~90 ~ run function arena:endless/boss/hidden/particle/slash

execute as @e[tag=Arena.LastBoss.Skill.Slash] at @s unless block ~ ~ ~ air run kill @s

execute as @e[tag=Arena.LastBoss.Skill.Slash] at @s if entity @a[tag=Arena.Player,distance=..1.5] run function arena:endless/boss/hidden/skill/hit
