# タイマースコア変更
execute if entity @e[tag=Arena.LastBoss] if entity @a[tag=Arena.Player,scores={Arena=99},distance=..32] unless data storage arena: {Debug:{Pause:true}} run scoreboard players add $Boss.SkillTimer Arena 1

# タイマーループ時処理
execute if score $Boss.SkillTimer Arena >= $Boss.SkillInterval Arena run function arena_beta:extra/boss/timer_loop

# スキル
function arena_beta:extra/boss/skill/tick
execute as @e[tag=Arena.LastBoss] at @s if data entity @s {NoAI:1b,OnGround:0b} run data modify entity @s NoAI set value 0b
