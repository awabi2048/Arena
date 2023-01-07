# 斬撃マーカー処理
execute unless block ~ ~ ~ air run kill @s

# 01
execute if entity @s[tag=Arena.LastBoss.Skill.Slash_01] rotated ~ 0 run tp @s ^ ^ ^0.75
execute if entity @s[tag=Arena.LastBoss.Skill.Slash_01] rotated ~90 ~ run function arena:endless/boss/hidden/particle/slash/01

execute if entity @s[tag=Arena.LastBoss.Skill.Slash_01] as @a[tag=Arena.Player,distance=..1.5] run function arena:endless/boss/hidden/skill/hit

# 02
execute if entity @s[tag=Arena.LastBoss.Skill.Slash_02] rotated ~ 0 run tp @s ^ ^ ^1
execute if entity @s[tag=Arena.LastBoss.Skill.Slash_02] rotated ~90 ~ run function arena:endless/boss/hidden/particle/slash/02

execute if entity @s[tag=Arena.LastBoss.Skill.Slash_02] as @a[tag=Arena.Player,distance=..3] run function arena:endless/boss/hidden/skill/hit
