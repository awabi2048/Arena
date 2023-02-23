# トリガー
advancement revoke @s only arena-boss:attacked

# 被攻撃時処理
execute store result score $Health ArenaBoss.Temp run data get storage arena-boss: Health 100
execute if data storage arena-boss: {Name:"Fire"} run function arena-boss:attacked/fire
execute if data storage arena-boss: {Name:"Water"} run function arena-boss:attacked/water

# ボスバー
execute store result bossbar arena-boss: value run data get storage arena-boss: Health

execute if score $Health ArenaBoss.Temp matches ..-1 run bossbar remove arena-boss:

# アニメーション中なら中断
execute unless data storage arena-boss: {Animation:{Name:"Regular"}} run function arena:stop_process


# アニメーション
data modify storage arena-boss: Animation.Name set value "Attacked"
