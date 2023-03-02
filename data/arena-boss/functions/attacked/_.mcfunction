# トリガー
advancement revoke @s only arena-boss:attacked

# 被攻撃時処理
execute store result score $Health ArenaBoss.Temp run data get storage arena-boss: Health 100
execute if data storage arena-boss: {Name:"Fire"} run function arena-boss:attacked/fire
execute if data storage arena-boss: {Name:"Water"} run function arena-boss:attacked/water

# プレイヤーの与ダメージスコア加算 (100倍値)
scoreboard players operation @s ArenaBoss.DamageDealt += $DamageDealt ArenaBoss.Temp

# ボスバー
execute store result bossbar arena-boss: value run data get storage arena-boss: Health

# アニメーション
execute if data storage arena-boss: {Animation:{Name:"Regular"}} run data modify storage arena-boss: Animation.Name set value "Attacked"

# 死亡時: 退出処理
execute store result score $Health ArenaBoss run data get storage arena-boss: Health
execute if score $Health ArenaBoss matches ..0 run function arena-boss:core/end
