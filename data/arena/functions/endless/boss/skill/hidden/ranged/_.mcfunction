# 2秒間隔で遠距離攻撃
scoreboard players operation $Temp.TimerMod Arena = $Boss.SkillTimer Arena
scoreboard players operation $Temp.TimerMod Arena %= #40 Arena

execute if score $Temp.TimerMod Arena matches 0 as @e[tag=Arena.Boss] at @s unless data entity @s {NoAI:1b} unless data storage arena: {Debug:{DisableRangedAttack:1b}} run function arena:endless/boss/skill/hidden/ranged/summon

# マーカー移動とパーティクル表示
execute as @e[tag=Arena.Boss.SkillRanged] at @s run tp @s ^ ^ ^0.33 facing entity @p[tag=Arena.Player] eyes

execute at @e[tag=Arena.Boss.SkillRanged] run particle scrape ~ ~ ~ 0.1 0.1 0.1 0 2
execute at @e[tag=Arena.Boss.SkillRanged] run particle dust_color_transition 0 0.5 1 1 0.5 0.75 1 ~ ~ ~ 0.1 0.1 0.1 0 1

# 当たり判定
execute at @e[tag=Arena.Boss.SkillRanged] positioned ~ ~-1.4 ~ as @p[tag=Arena.Player,distance=..0.5] at @s run function arena:endless/boss/skill/hidden/ranged/hit
execute as @e[tag=Arena.Boss.SkillRanged] at @s if entity @e[tag=Arena.Boss.SkillRanged,distance=0.1..0.5] run function arena:endless/boss/skill/hidden/ranged/hit
execute as @e[tag=Arena.Boss.SkillRanged] at @s unless block ~ ~ ~ air run function arena:endless/boss/skill/hidden/ranged/hit
