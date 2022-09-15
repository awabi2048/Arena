# タイマースコア変更
execute if entity @e[tag=Arena.Boss] if entity @a[tag=Arena.Player,scores={Arena=-1},distance=..32] run scoreboard players add $Boss.SkillTimer Arena 1

# プレイヤーいなければリセット
execute unless entity @a[tag=Arena.Player,scores={Arena=-1},distance=..32] run function arena:endless/boss/reset

# タイマーループ時処理
execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena run function arena:endless/boss/timer_loop

# スキル
function arena:endless/boss/skill/tick
execute as @e[tag=Arena.Boss] at @s unless block ~ ~-1 ~ air if data entity @s {NoAI:1b} run data modify entity @s NoAI set value 0b

# ボスバー操作
execute store result bossbar arena:boss value run data get entity @e[tag=Arena.LastBoss,limit=1] Health
execute store result bossbar arena:mid_boss value run data get entity @e[tag=Arena.MidBoss,limit=1] Health
