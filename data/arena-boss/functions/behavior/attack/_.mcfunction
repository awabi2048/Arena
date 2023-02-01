# モブの行動
# 乱数生成
function arena:rng

# 体力割合計算
execute store result score $HealthPercent ArenaBoss.Temp run data get storage arena-boss: Health 100
execute store result score $MaxHealth ArenaBoss.Temp run data get storage arena-boss: MaxHealth

scoreboard players operation $HealthPercent ArenaBoss.Temp /= $MaxHealth ArenaBoss.Temp

execute if data storage arena-boss: {Name:Fire} run function arena-boss:behavior/attack/fire
