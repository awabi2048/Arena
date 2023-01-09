# タイマースコア変更
execute if entity @e[tag=Arena.LastBoss] if entity @a[tag=Arena.Player,scores={Arena=-1},distance=..32] unless data storage arena: {Debug:{Pause:1b}} run scoreboard players add $Boss.SkillTimer Arena 1

# プレイヤーいなければリセット
#execute unless entity @a[tag=Arena.Player,scores={Arena=-1},distance=..32] run function arena:endless/boss/reset

# タイマーループ時処理
execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena run function arena:endless/boss/timer_loop

# スキル
function arena:endless/boss/skill/tick
execute as @e[tag=Arena.LastBoss] at @s if data entity @s {NoAI:1b,OnGround:0b} run data modify entity @s NoAI set value 0b

# ボスバー操作
execute if entity @e[tag=Arena.LastBoss] store result bossbar arena:boss value run data get entity @e[tag=Arena.LastBoss,limit=1] Health
execute if entity @e[tag=Arena.MidBoss] store result bossbar arena:mid_boss value run data get entity @e[tag=Arena.MidBoss,limit=1] Health

scoreboard players reset $Boss.Health Arena
execute store result score $Boss.Health Arena run bossbar get arena:mid_boss value
execute if score $Boss.Health Arena matches 0..500 run bossbar set arena:mid_boss color red
execute if score $Boss.Health Arena matches 501..1000 run bossbar set arena:mid_boss color white

# Hidden Endless
function arena:endless/boss/hidden/tick
