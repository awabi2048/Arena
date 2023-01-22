# ボスが攻撃受けたときの処理
# カウンターするか乱数で決定
function arena:rng
execute if score $Temp.Random Arena matches ..8 run function arena:endless/boss/attacked/counter/_

# 一定ダメージ以下の攻撃は通さない
function arena:endless/boss/attacked/shield/_

# ボスの体力によってボスバーの色変更
execute store result score $Boss.Health Arena.Temp run data get entity @e[tag=Arena.LastBoss,limit=1] Health

execute if score $Boss.Health Arena.Temp matches 667..1000 run bossbar set arena_beta:extra_boss color white
execute if score $Boss.Health Arena.Temp matches 334..666 run bossbar set arena_beta:extra_boss color yellow
execute if score $Boss.Health Arena.Temp matches 1..334 run bossbar set arena_beta:extra_boss color red

# ボスバー同期
execute store result bossbar arena_beta:extra_boss value run scoreboard players get $Boss.Health Arena.Temp

advancement revoke @a only arena_beta:extra_boss/attacked_last_boss

# 一定時間攻撃受けないと高速回復
scoreboard players set $Boss.LastAttackedTime Arena 0

